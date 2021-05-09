import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/part_store_queries/part_queries.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:bikersworld/services/string_extension.dart';

class RegisterAutoParts extends StatefulWidget {
  final String partStoreId;
  final AutoPartModel autoPartInfo;
  final String partStoreCity;
  RegisterAutoParts({@required this.partStoreId,this.autoPartInfo,@required this.partStoreCity});
  @override
  _RegisterAutoPartsState createState() => _RegisterAutoPartsState();
}

String dropDownTypeValue;
String dropDownCategoryValue;

class _RegisterAutoPartsState extends State<RegisterAutoParts> {
  int currentIndex;
  bool _isButtonVisible = true;

  File _image;
  final picker = ImagePicker();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _validateFields = ValidateAutoPart();
  final _error = ToastErrorMessage();
  final _valid = ToastValidMessage();
  final _addAutoPart = AutoPartQueries();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  void clear(){
    _titleController.clear();
    _priceController.clear();
  }
  void mapValues(){
    if(widget.autoPartInfo != null){
      _titleController.text = widget.autoPartInfo.title;
      _priceController.text = widget.autoPartInfo.price.toString();
      dropDownTypeValue = widget.autoPartInfo.type;
      dropDownCategoryValue = widget.autoPartInfo.category;
    }
  }
  void checkFormState(){
    if(!_formKey.currentState.validate()){
      return;
    }
    validate();
  }
  void validate(){
    int price = int.tryParse(_priceController.text.trim());
    if(!_validateFields.isPriceValid(price: price) && !_validateFields.isTitleValid(title: _titleController.text.trim())){
      _error.errorToastMessage(errorMessage: 'Please Fill All Fields');
    }
    else if(!_validateFields.isTitleValid(title: _titleController.text.trim())){
      _error.errorToastMessage(errorMessage: 'Please Enter Correct Title');
    }
    else if(!_validateFields.isPriceValid(price: price)){
      _error.errorToastMessage(errorMessage: 'Price must greater than 0');
    }
    else if(_image == null && widget.autoPartInfo == null){
     _error.errorToastMessage(errorMessage: 'Please Select an Image');
    }
    else{
      addPart(price);
    }
  }
  Future<void> addPart(int price) async{
     try{
       setState(() {
         _isButtonVisible = false;
       });

     if(widget.autoPartInfo == null) {
         var imageUrl = await _addAutoPart.uploadImage(_image);
         if(imageUrl != null) {
           final data = AutoPartModel(title: _titleController.text.trim().firstinCaps,
               price: price,
               category: dropDownCategoryValue,
               partStoreCity: widget.partStoreCity.firstinCaps,
               type: dropDownTypeValue,
               imageURL: imageUrl,
               partStoreId: widget.partStoreId);

           bool result = await _addAutoPart.addAutoPart(data);
           if (result) {
             setState(() {
               _isButtonVisible = true;
             });
             clear();
             _valid.validToastMessage(
                 validMessage: 'Part Successfully Added');
             Future.delayed(
                 new Duration(seconds: 2),
                     () {
                   Navigator.pop(context);
                 }
             );
           }
        }
     }
     else if(widget.autoPartInfo != null && _image == null){
       final data = AutoPartModel(title: _titleController.text.trim().firstinCaps,
           price: price,
           category: dropDownCategoryValue,
           docId: widget.autoPartInfo.docId,
           partStoreCity: widget.autoPartInfo.partStoreCity,
           type: dropDownTypeValue,
           imageURL: widget.autoPartInfo.imageURL,
           partStoreId: widget.autoPartInfo.partStoreId);
       bool result = await _addAutoPart.updateAutoPart(data);
       if (result) {
         setState(() {
           _isButtonVisible = true;
         });
         clear();
         _valid.validToastMessage(
             validMessage: 'Part Successfully Updated');
         Future.delayed(
             new Duration(seconds: 1),
                 () {
               Navigator.pop(context);
             }
         );
       }
     }
     else if(widget.autoPartInfo != null && _image != null) {
         var imageUrl = await _addAutoPart.uploadImage(_image);
         if(imageUrl != null){
         final data = AutoPartModel(title: _titleController.text.trim().firstinCaps,
             price: price,
             partStoreCity: widget.autoPartInfo.partStoreCity,
             docId: widget.autoPartInfo.docId,
             category: dropDownCategoryValue,
             type: dropDownTypeValue,
             imageURL: imageUrl,
             partStoreId: widget.autoPartInfo.partStoreId);
         bool result = await _addAutoPart.updateAutoPart(data);
         if (result) {
           setState(() {
             _isButtonVisible = true;
           });
           clear();
           _valid.validToastMessage(
               validMessage: 'Part Successfully Updated');
           Future.delayed(
               new Duration(seconds: 1),
                   () {
                 Navigator.pop(context);
               }
           );
         }
       }
     }
   }catch(e){
     _error.errorToastMessage(errorMessage: e.toString());
   }finally{
      setState(() {
        _isButtonVisible = true;
      });
   }

}

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    dropDownTypeValue = null;
    dropDownCategoryValue = null;
    super.dispose();
  }
  @override
  void initState() {
    mapValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
          iconTheme: IconThemeData(color: Color(0xfffbb448)),
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.orange,
              )
          ),
          elevation: 0.0,
        ),
        body: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20,),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: 'Register',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: ' AutoParts',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                color: Colors.black,
                              )
                          ),
                        ]),
                  ),


                  _registerpartWidget(),

                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Upload Part image",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          onPressed: getImage,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              FontAwesomeIcons.image,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 210,
                          height: 150,
                          color: Colors.blue,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            alignment: Alignment.topLeft,
                            child: widget.autoPartInfo != null && _image == null
                                ? Image(
                                image: NetworkImage(widget.autoPartInfo.imageURL))
                                : _image == null ? Text('') : Image.file(_image),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*
                  **/
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 60,
                      child: RaisedButton(
                        onPressed: _isButtonVisible ? () => {checkFormState()} : null,
                        child:Text(
                          widget.autoPartInfo != null ? 'Update Part' : 'Add Part',
                          style: GoogleFonts.krub(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        color: Color(0xfff7892b),
                        disabledColor: Colors.grey.shade400,
                        disabledTextColor: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerpartWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _entryField(title:'title',type: TextInputType.text,filter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),controller: _titleController),
          SizedBox(height: 10,),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Select",
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Category",
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          CategoriesComboBox(),
          SizedBox(height: 15,),

          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Select",
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Type",
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          TypeComboBox(),

          SizedBox(height: 10,),
          _entryField(title:"Price",controller: _priceController,type: TextInputType.number,filter: FilteringTextInputFormatter.digitsOnly),
          SizedBox(height: 20,),

        ],
      ),
    );
  }

}

Widget _entryField({String title,TextEditingController controller,TextInputType type,TextInputFormatter filter})
{
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            title,
            style: GoogleFonts.quicksand(
              fontSize: 18,
            )
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          inputFormatters: [
            filter,
          ],
          keyboardType: type,
          controller: controller,
          validator: (value){
            if(value.isEmpty){
              return "$title is a Required Field";
            }
            return null;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Color(0xffe3e3e3),
            filled: true,
          ),
        ),
      ],
    ),
  );
}

class CategoriesComboBox extends StatefulWidget {
  CategoriesComboBox({Key key}) : super(key: key);

  @override
  _CategoriesComboBoxState createState() => _CategoriesComboBoxState();
}

class _CategoriesComboBoxState extends State<CategoriesComboBox> {

  var _dropDownItems = ['Accessories', 'Body & Frame', 'Brake & Suspension', 'Air Intake', 'Electrical & Ignition', 'Exhaust System','Engine & Engine Parts','Lighting & Indicators','Wheel & Tyres','Seating','Other'];

  void mapVlaue(){
    if(dropDownCategoryValue == null){
      dropDownCategoryValue = _dropDownItems[0];
    }
  }

  @override
  void initState(){
    mapVlaue();
    super.initState();
  }

  Widget build(BuildContext context) {

    return Container(
      color: Color(0xffe3e3e3),
      width: 370,
      height: 50,
      child:  DropdownButton<String>(
        value: dropDownCategoryValue,
        icon: Container(
          margin: EdgeInsets.only(left: 120),
          child: Icon(
            FontAwesomeIcons.caretDown,
          ),
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black,),
        underline: Container(
          height: 2,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropDownCategoryValue = newValue;
          });
        },
        items: _dropDownItems
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value, style: GoogleFonts.quicksand(fontSize: 15),),
            ),
          );
        }).toList(),
      ),
    );
  }
}




class TypeComboBox extends StatefulWidget {
  TypeComboBox({Key key}) : super(key: key);
  @override
  _TypeComboBoxState createState() => _TypeComboBoxState();
}

class _TypeComboBoxState extends State<TypeComboBox> {

  var dropDownItems = ['Local', 'Genuine','Others'];

  void mapVlaue(){
    if(dropDownTypeValue == null){
      dropDownTypeValue = dropDownItems[0];
    }
  }
  @override
  void initState(){
    mapVlaue();
    super.initState();
  }

  Widget build(BuildContext context) {

    return Container(
      color: Color(0xffe3e3e3),
      width: 370,
      height: 50,
      child:  DropdownButton<String>(
        value: dropDownTypeValue,
        icon: Container(
          margin: EdgeInsets.only(left:220),
          child: Icon(
            FontAwesomeIcons.caretDown,
          ),
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black,),
        underline: Container(
          height: 2,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropDownTypeValue = newValue;
          });
        },
        items: dropDownItems
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value, style: GoogleFonts.quicksand(fontSize: 15),),
            ),
          );
        }).toList(),
      ),
    );
  }
}

