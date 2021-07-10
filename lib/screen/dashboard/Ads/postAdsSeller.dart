import 'dart:io';
import 'package:bikersworld/screen/dashboard/Ads/seller/sellerDashbaord.dart';
import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/screen/loginSignup/user_role_option.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/postAdTextfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:bikersworld/services/bike_add_queries.dart';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:bikersworld/widgets/city_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:bikersworld/services/string_extension.dart';
import 'package:bikersworld/services/admin_data_queries/bike_add_search/bike_admin_data.dart';


class PostBikeInfo extends StatefulWidget {

  final BikeAddModel data;

  PostBikeInfo({this.data});
  @override
  _PostBikeInfoState createState() => _PostBikeInfoState();
}

//String yearSelected;

class _PostBikeInfoState extends State<PostBikeInfo> with SingleTickerProviderStateMixin {

  final _titleController = TextEditingController();
  final _yearController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _validate = ValidateBikeAdd();
  final _error = ToastErrorMessage();
  final _valid = ToastValidMessage();
  bool _isButtonVisible = true;
  String make,model;

  void mapValues(){
    if(widget.data != null){
      _titleController.text = widget.data.title;
      _yearController.text = widget.data.year;
      _priceController.text = widget.data.price.toString();
      _descriptionController.text = widget.data.description;
    }
  }

  @override
  initState(){
    mapValues();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _yearController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void checkFormState(){
    if(!_formKey.currentState.validate()){
      return null;
    }
    validateFields();
  }

  void validateFields() async{
    double price = double.tryParse(_priceController.text);
    if((!_validate.valiadteTitle(_titleController.text)) && (!_validate.validateMake(make)) && (!_validate.validateModel(model)) &&  (!_validate.validatePrice(price))){
      _error.errorToastMessage(errorMessage: 'PLease Enter valid Information');
    }
    else if(!_validate.validateMake(make)){
      _error.errorToastMessage(errorMessage: 'Bike Make is Invalid');
    }
    else if(!_validate.validateModel(model)){
      _error.errorToastMessage(errorMessage: 'Bike model is Invalid');
    }
    else if(!_validate.validatePrice(price)){
      _error.errorToastMessage(errorMessage: "Bike Price can't be 0");
    }
    else{
      if(widget.data != null){
        try {
          setState(() {
            _isButtonVisible = false;
          });
          final _data = BikeAddModel(title: _titleController.text.capitalizeFirstofEach,
              make: make,
              model: model,
              year: _yearController.text,
              price: price,
              description: _descriptionController.text,
              id: widget.data.id);
          final _update = PostAddQueries();
          final bool result = await _update.updateBikeInfo(_data);
          if (result) {
            _valid.validToastMessage(validMessage: 'Add Updated Succedfully');
            Future.delayed(
                Duration(seconds: 2),
                    () {
                  Navigator.of(context).pop();
                }
            );
          }
        }catch(e){
          _error.errorToastMessage(errorMessage: e.toString());
        }finally{
          setState(() {
            _isButtonVisible = true;
          });
        }
      }
      else {
        final _data = BikeAddModel(title: _titleController.text.capitalizeFirstofEach,make: make,model: model,year: _yearController.text,price: price,description: _descriptionController.text);
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => SellerInformation(data: _data)));
      }
    }
  }

  final _adminData = BikeAdminDataQueries();
  Future<List<BikeSearchModel>> getMakeAndModel() {
    try {
      return _adminData.getMakeAndModel();
    }
    catch(e){
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.orange,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
          iconTheme: IconThemeData(color: Color(0xfffbb448)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),

        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "Bike",
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "Information",
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            color: Color(0XFF012A4A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Title",controller:_titleController,inputType: TextInputType.text,),
                ),

                FutureBuilder(
                  future: getMakeAndModel(),
                  builder: (BuildContext context, AsyncSnapshot<List<BikeSearchModel>> snapshot) {
                    if(snapshot.hasData && snapshot.data.isNotEmpty){
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left:15,right:15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:5,top: 10),
                                child: Text(
                                    "Make",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 18,
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only( top:10),
                                child:Container(
                                  color: Colors.white,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DropdownSearch<String>(
                                      validator: (v) => v == null ? "required field" : null,
                                      hint: "Select Make",
                                      searchBoxDecoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                      showSelectedItem: true,
                                      items: snapshot.data.map((doc) => doc.make).toList(),
                                      // showClearButton: true,
                                      onChanged: (value){
                                        setState(() {
                                          make = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              StreamBuilder(
                                stream: _adminData.getModelForMake(make),
                                builder: (BuildContext context, AsyncSnapshot<BikeSearchModel> docSnapshot) {
                                  if(docSnapshot.hasData && docSnapshot.data != null){
                                    return Padding(
                                      padding: const EdgeInsets.only( top:10,right: 15),
                                      child:Container(
                                        color: Colors.white,
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          child: DropdownSearch<String>(
                                            validator: (v) => v == null ? "required field" : null,
                                            hint: "Select Modal",
                                            searchBoxDecoration: InputDecoration(
                                              border: new OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  const Radius.circular(5),
                                                ),
                                              ),
                                            ),
                                            showSelectedItem: true,
                                            items: List<String>.from(docSnapshot.data.model),
                                            // showClearButton: true,
                                            onChanged: (value){
                                              model = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  else if(docSnapshot.data == null){
                                    return Padding(
                                      padding: const EdgeInsets.only( top:15,right: 0),
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:5,top: 10),
                                            child: Text(
                                                "Modal",
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 18,
                                                )
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            color: Colors.white,
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              child: DropdownSearch<String>(
                                                validator: (v) => v == null ? "required field" : null,
                                                hint: "Select Modal",
                                                searchBoxDecoration: InputDecoration(
                                                  border: new OutlineInputBorder(
                                                    borderRadius: const BorderRadius.all(
                                                      const Radius.circular(5),
                                                    ),
                                                  ),
                                                ),
                                                showSelectedItem: true,
                                                items: [],
                                                // showClearButton: true,
                                                onChanged: (value){

                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  else if(docSnapshot.hasError){
                                    return Center(child: Text(docSnapshot.error.toString()));
                                  }
                                  return Center(child: CircularProgressIndicator(),);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Center(child:CircularProgressIndicator());
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Year",controller: _yearController,inputType: TextInputType.number,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Price",controller:_priceController,inputType: TextInputType.number,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Description",controller:_descriptionController,inputType: TextInputType.text),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 60,
                    child: RaisedButton(
                      onPressed: _isButtonVisible ? () => {checkFormState()} : null,
                      child:Text(
                        widget.data != null ? "Update" : "Next",
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
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SellerInformation extends StatefulWidget {
  final BikeAddModel data;
  SellerInformation({@required this.data});
  @override
  _SellerInformationState createState() => _SellerInformationState();
}

class _SellerInformationState extends State<SellerInformation> {

  final _sellerNameController = TextEditingController();
  final _sellerContactController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _validate = ValidateBikeAdd();
  final _error = ToastErrorMessage();
  final _valid = ToastValidMessage();
  bool _isButtonVisible = true;

  void mapValues(){
    if((widget.data.sellerName != null) && (widget.data.sellerContact != null) && (widget.data.city != null) && (widget.data.address != null)){
      _sellerNameController.text = widget.data.sellerName;
      _sellerContactController.text = widget.data.sellerContact;
      _cityController.text = widget.data.city;
      _addressController.text = widget.data.address;
    }
  }

  @override
  void initState() {
    mapValues();
    print('${widget.data.title} ${widget.data.price}');
    super.initState();
  }

  @override
  void dispose() {
    _sellerNameController.dispose();
    _sellerContactController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void checkFormState(){
    if(!_formKey.currentState.validate()){
      return null;
    }
    validateFields();
  }
  void validateFields() async{
    if((!_validate.validateSellerName(_sellerNameController.text)) && (!_validate.validateSellerContact(_sellerContactController.text)) && (!_validate.validateCity(_cityController.text)) &&  (!_validate.validateAddress(_addressController.text))){
      _error.errorToastMessage(errorMessage: 'PLease Enter valid Information');
    }
    else if(!_validate.validateSellerName(_sellerNameController.text)){
      _error.errorToastMessage(errorMessage: 'Seller Name is Invalid');
    }
    else if(!_validate.validateSellerContact(_sellerContactController.text)){
      _error.errorToastMessage(errorMessage: 'Seller Contact is Invalid');
    }
    else if(!_validate.validateCity(_cityController.text)){
      _error.errorToastMessage(errorMessage: 'City is Invalid');
    }
    else if(!_validate.validateAddress(_addressController.text)){
      _error.errorToastMessage(errorMessage: "Address is Invalid");
    }
    else{
      if((widget.data.sellerName != null) && (widget.data.sellerContact != null) && (widget.data.city != null) &&(widget.data.address != null)) {
        try {
          setState(() {
            _isButtonVisible = false;
          });
          final _data = BikeAddModel(
              sellerName: _sellerNameController.text.capitalizeFirstofEach,
              sellerContact: _sellerContactController.text,
              city: _cityController.text,
              address: _addressController.text,
              id: widget.data.id);
          final _update = PostAddQueries();
          final bool result = await _update.updateSellerInfo(_data);
          if (result) {
            _valid.validToastMessage(validMessage: "Seller Info Updated Successfully");
            Future.delayed(
              Duration(seconds: 2),
                (){
                  Navigator.of(context).pop();
                }
            );
          }
        }catch(e){

        }finally{
          setState(() {
            _isButtonVisible = true;
          });
        }
      }else {
        final _data = BikeAddModel(title: widget.data.title,
            make: widget.data.make,
            model: widget.data.model,
            year: widget.data.year,
            price: widget.data.price,
            description: widget.data.description,
            sellerName: _sellerNameController.text.capitalizeFirstofEach,
            sellerContact: _sellerContactController.text,
            city: _cityController.text,
            address: _addressController.text);
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => PostAddImages(data: _data,)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),

        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "Seller",
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "Information",
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            color: Color(0XFF012A4A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Name",controller: _sellerNameController,inputType: TextInputType.text,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Contact",controller: _sellerContactController,inputType: TextInputType.number),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "City",
                            style: GoogleFonts.quicksand(
                              fontSize:18,
                            ),
                          ),
                        ),
                        CityDropDown(controller: _cityController),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Full Address",controller: _addressController,inputType: TextInputType.text),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 60,
                    child: RaisedButton(
                      onPressed: _isButtonVisible ? () => {checkFormState()} : null,
                      child:Text(
                        widget.data.sellerName != null ? "Update" : "Next",
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
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class PostAddImages extends StatefulWidget {

  final BikeAddModel data;
  PostAddImages({@required this.data});
  @override
  _PostAddImagesState createState() => new _PostAddImagesState();
}

class _PostAddImagesState extends State<PostAddImages> {
  List<Asset> images = List<Asset>();
  List<File> files = [];
  String _error = 'No Error Dectected';
  final _postAdd = PostAddQueries();
  final _currentUser = AuthenticationService();
  final _errorMessage = ToastErrorMessage();
  final _valid = ToastValidMessage();
  bool _isButtonVisible = true;

  @override
  void initState() {
   print('${widget.data.title} ${widget.data.price} ${widget.data.sellerName} ${widget.data.city}');
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#012A4A",
          actionBarTitle: "Select Images",
          actionBarTitleColor: "#fbb448",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
     _errorMessage.errorToastMessage(errorMessage: e.toString());
    }
    if (!mounted) return;

      resultList.forEach((imageAsset) async {
      final filePath = await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);
      File tempFile = File(filePath);
      if (tempFile.existsSync()) {
        files.add(tempFile);
      }
    });
    setState(() {
      images = resultList;
      _error = error;
    });
  }

  Future<void> uploadAdd() async{
    try {
      setState(() {
        _isButtonVisible = false;
      });
      if (_currentUser.getCurrentUser()) {
        if (images.isNotEmpty) {
          final List<String> urls = await _postAdd.uploadFiles(files);
          if (urls != null) {
            if (widget.data.images !=null) {
              final bikeData = BikeAddModel(
                  images: urls,
                  id: widget.data.id);
              final bool result = await _postAdd.updateImages(bikeData);
              if (result) {
                _valid.validToastMessage(
                    validMessage: "Add Images Successfully Updated");
                Future.delayed(
                    new Duration(seconds: 2),
                        () {
                      Navigator.of(context).pop();
                    }
                );
              }
            } else {
              final bikeData = BikeAddModel(title: widget.data.title,
                  make: widget.data.make,
                  model: widget.data.model,
                  year: widget.data.year,
                  price: widget.data.price,
                  description: widget.data.description,
                  sellerName: widget.data.sellerName,
                  sellerContact: widget.data.sellerContact,
                  city: widget.data.city,
                  address: widget.data.address,
                  images: urls,
                  postedBy: _currentUser.getUserId());

              final String result = await _postAdd.postAdd(bikeData);
              if (result == _postAdd.adPosted) {
                _valid.validToastMessage(validMessage: "Add has been Posted");
                Future.delayed(
                    new Duration(seconds: 2),
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SellerHomeScreen()));
                    }
                );
              }else if(result == _postAdd.roleErrorMessage){
                _errorMessage.errorToastMessage(errorMessage: result);
                Future.delayed(
                    new Duration(seconds: 1),
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GenericOptionScreen()));
                    }
                );
              }else{
                _errorMessage.errorToastMessage(errorMessage: result);
              }
            }
          }
        } else {
          _errorMessage.errorToastMessage(errorMessage: "No Images Selected");
        }
      } else {
        _errorMessage.errorToastMessage(errorMessage: "You'r Not Logged In");
      }
    }catch(e){
      _errorMessage.errorToastMessage(errorMessage: e.toString());
    }finally{
      setState(() {
        _isButtonVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),

        ),
        body: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Select",
                      style: GoogleFonts.raleway(
                        fontSize: 25,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "Images",
                      style: GoogleFonts.raleway(
                        fontSize: 25,
                        color: Color(0XFF012A4A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 5, color: Colors.lightBlue.shade900),
                      bottom: BorderSide(width: 5, color: Colors.lightBlue.shade900),
                      left: BorderSide(width: 5, color: Colors.lightBlue.shade900),
                      right: BorderSide(width: 5, color: Colors.lightBlue.shade900),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: buildGridView(),
                  ),
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                loadAssets();
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Color(0xff585859), width: 2),
                ),
                child: Center(
                  child: Text(
                    "Pick Images",
                    style: GoogleFonts.quicksand(
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 60,
                child: RaisedButton(
                  onPressed: _isButtonVisible ? () => {uploadAdd()} : null,
                  child:Text(
                    widget.data.images != null ? "Update" : "Post Add",
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
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

// class YearComboBox extends StatefulWidget {
//
//   YearComboBox({Key key}) : super(key: key);
//   @override
//   _YearComboBoxState createState() => _YearComboBoxState();
// }
//
// class _YearComboBoxState extends State<YearComboBox> {
//
//   var _dropDownItems = [''
//       '1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000',
//     '2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011',
//     '2012','2013','2014','2015','2015','2016','2017','2018','2019','2020','2021',
//     '2022','2023','2024','2025','2026','2027','2028','2029','2030',
//
//   ];
//
//   @override
//   void initState(){
//     super.initState();
//   }
//   @override
//   void dispose(){
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xffe3e3e3),
//       width: 380,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: DropdownButton<String>(
//           value: yearSelected,
//           icon: Container(
//             margin: EdgeInsets.only(left: 200),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(45.0, 0, 0, 0),
//               child: Icon(
//                 FontAwesomeIcons.caretDown,
//               ),
//             ),
//           ),
//           iconSize: 24,
//           elevation: 16,
//           style: TextStyle(color: Colors.black,),
//           underline: Container(
//             height: 2,
//           ),
//           onChanged: (String newValue) {
//             setState(() {
//              yearSelected = newValue;
//             });
//           },
//           items: _dropDownItems
//               .map((String dropDownStringItem) {
//             return DropdownMenuItem<String>(
//               value: dropDownStringItem,
//               child: Text(dropDownStringItem, style: GoogleFonts.quicksand(fontSize: 15)),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
