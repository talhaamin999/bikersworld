import 'dart:ffi';

import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/postAdTextfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class PostAdSeller extends StatefulWidget {
  @override
  _PostAdSellerState createState() => _PostAdSellerState();
}

class _PostAdSellerState extends State<PostAdSeller> with SingleTickerProviderStateMixin {

  final _titleController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _validate = ValidateBikeAdd();
  final _error = ToastErrorMessage();

  @override
  void dispose() {
    // _titleController.dispose();
    // _makeController.dispose();
    // _modelController.dispose();
    // _yearController.dispose();
    // _priceController.dispose();
    // _descriptionController.dispose();
    super.dispose();
  }

  void validateFields(){
    double price = double.tryParse(_priceController.text);
    if((!_validate.valiadteTitle(_titleController.text)) && (!_validate.validateMake(_makeController.text)) && (!_validate.validateModel(_modelController.text)) &&  (!_validate.validatePrice(price))){
      _error.errorToastMessage(errorMessage: 'PLease Enter valid Information');
    }
    else if(!_validate.validateMake(_makeController.text)){
      _error.errorToastMessage(errorMessage: 'Bike Make is Invalid');
    }
    else if(!_validate.validateModel(_modelController.text)){
      _error.errorToastMessage(errorMessage: 'Bike model is Invalid');
    }
    else if(!_validate.validatePrice(price)){
      _error.errorToastMessage(errorMessage: "Bike Price can't be 0");
    }
    else{
      final _data = BikeAddModel(title: _titleController.text,make: _makeController.text,model: _modelController.text,year: _yearController.text,price: price,description: _descriptionController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => SellerInformation(data: _data,)));
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
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Make",controller:_makeController,inputType: TextInputType.name,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Modal",controller:_modelController,inputType: TextInputType.text,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Year",controller:_yearController,inputType: TextInputType.number,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Price",controller:_priceController,inputType: TextInputType.number,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Description",controller:_descriptionController,inputType: TextInputType.text,),
                ),
                SizedBox(height: 20,),
                Center(
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {

                      if(!_formKey.currentState.validate()){
                        return null;
                      }
                      validateFields();
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xfffbb448),
                            Color(0xfff7892b),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: GoogleFonts.quicksand(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
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

  @override
  void initState() {
    print('${widget.data.title} ${widget.data.price}');
    super.initState();
  }

  void validateFields(){
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
      final _data = BikeAddModel(title: widget.data.title,make: widget.data.make,model: widget.data.model,year: widget.data.year,price: widget.data.price,description: widget.data.description,sellerName: _sellerNameController.text,sellerContact: _sellerContactController.text,city: _cityController.text,address: _addressController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(data: _data,)));

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
                  child: postAdTextfield("City",controller: _cityController,inputType: TextInputType.text),
                ), Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: postAdTextfield("Full Address",controller: _addressController,inputType: TextInputType.text),
                ),
                SizedBox(height: 20,),
                Center(
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if(!_formKey.currentState.validate()){
                        return null;
                      }
                      validateFields();
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xfffbb448),
                            Color(0xfff7892b),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.quicksand(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
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



class MyApp extends StatefulWidget {
  final BikeAddModel data;
  MyApp({@required this.data});
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

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
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
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
            SizedBox(height: 20,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: buildGridView(),
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
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xfffbb448),
                      Color(0xfff7892b),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Pick Images",
                    style: GoogleFonts.quicksand(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
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
