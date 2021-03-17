import 'dart:async';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/screen/workshop/addServices.dart';
import 'package:bikersworld/screen/workshop/addServices.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';


final TextEditingController shopTitleController = TextEditingController();
final TextEditingController shopCityController = TextEditingController();
final TextEditingController shopSpecificAreaController = TextEditingController();
final TextEditingController ownerNameController = TextEditingController();
final TextEditingController ownerContactController = TextEditingController();
ToastErrorMessage error = ToastErrorMessage();
ToastValidMessage valid = ToastValidMessage();
bool _isTitleEmpty = false;
bool _isCityEmpty = false;
bool _isAreaEmpty = false;
bool _isNameEmpty = false;
bool _isContactEmpty = false;
int fieldEmptyChecker = 0;

class RegisterWorkshop extends StatefulWidget {
  @override
  _RegisterWorkshopState createState() => _RegisterWorkshopState();
}

class _RegisterWorkshopState extends State<RegisterWorkshop> {
  int currentIndex;

  TextEditingController _textFieldController = new TextEditingController();
  @override
  void initState() {
    super.initState();

    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void checkEmptyField(){
    setState(() {
    if(shopTitleController.text.isEmpty){
      _isTitleEmpty = true;
    }
    else{
      _isTitleEmpty = false;
    }
    if(shopCityController.text.isEmpty){
      _isCityEmpty = true;
    }
    else{
      _isCityEmpty = false;
    }
    if(shopSpecificAreaController.text.isEmpty){
      _isAreaEmpty = true;
    }
    else{
      _isAreaEmpty = false;
    }
    if(ownerNameController.text.isEmpty){
      _isNameEmpty = true;
    }
    else{
      _isNameEmpty = false;
    }
    if(ownerContactController.text.isEmpty){
      _isContactEmpty = true;
    }
    else{
      _isContactEmpty = false;
    }
    if(_isTitleEmpty == false && _isCityEmpty == false && _isAreaEmpty == false && _isNameEmpty == false && _isContactEmpty == false) {
      fieldEmptyChecker = 1;
    }
    });
  }
  void validateFields(){

    if(fieldEmptyChecker == 1){
      ValidateWorkshop _workShop = ValidateWorkshop();
      if(!_workShop.validateShopTitle(shopTitleController.text.trim()) && !_workShop.validateShopCity(shopCityController.text.trim()) && !_workShop.validateShopArea(shopSpecificAreaController.text.trim()) && !_workShop.validateOwnerName(ownerNameController.text.trim()) && !_workShop.validateOwnerContact(ownerContactController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Data in every Fields");
      }
      else if(!_workShop.validateShopTitle(shopTitleController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Shop Title");
      }
      else if(!_workShop.validateShopCity(shopCityController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid City Name");
      }
      else if(!_workShop.validateShopArea(shopSpecificAreaController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Specific Area Title");
      }
      else if(!_workShop.validateOwnerName(ownerNameController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Owner Name");
      }
      else if(!_workShop.validateOwnerContact(ownerContactController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Pakistan Number");
      }
      else{
        addWorkshop();
      }
    }

  }

  Future<void> addWorkshop() async{
    try {
      RegisterWorkshopQueries register = RegisterWorkshopQueries();
      await register.registerWorkshop(
          shopTitleController.text, shopCityController.text,
          shopSpecificAreaController.text, ownerNameController.text,
          ownerContactController.text);
        if(RegisterWorkshopQueries.resultMessage == "Workshop Successfully Registered"){
          valid.validToastMessage(validMessage: RegisterWorkshopQueries.resultMessage);
          Future.delayed(
              new Duration(seconds: 2),
                (){
                Navigator.of(this.context).push(MaterialPageRoute(builder: (context) => AddServices())
                );
          },
          );
        }
        else{
          error.errorToastMessage(errorMessage: RegisterWorkshopQueries.resultMessage);
        }
    }catch(e){
      error.errorToastMessage(errorMessage: e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
            leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
              onPressed:() => Navigator.pop(context),
            )
        ),
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      _title(),
                      SizedBox(height: 20),
                      _registerWorkshopWidget(),
                      SizedBox(height: 20),

                    FlatButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                        child: Text(
                          'Next',
                          style: GoogleFonts.krub(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: (){
                        checkEmptyField();
                        validateFields();
                      },
                    ),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: drawer(),
      ),
    );
  }
}
Widget _entryField(String title,TextEditingController controller,TextInputType inputType,FilteringTextInputFormatter filter,bool _isFieldEmpty,)
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
        TextField(
          controller: controller,
          keyboardType: inputType,
          inputFormatters: <TextInputFormatter>[
            filter,
          ],
          decoration: InputDecoration(
            errorText: _isFieldEmpty ? "$title is a Required property": null,
            border: InputBorder.none,
            fillColor: Color(0xfff3f3f4),
            filled: true,
          ),
        ),
      ],
    ),
  );
}
Widget _registerWorkshopWidget() {

  return Column(
    children: <Widget>[
      _entryField("Workshop Name",shopTitleController,TextInputType.text,FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),_isTitleEmpty),
      _entryField("City",shopCityController,TextInputType.text,FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),_isCityEmpty),
      _entryField("Specific Area",shopSpecificAreaController,TextInputType.text,FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),_isAreaEmpty),


      Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            Text('Owner Information' ,style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w600),),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),

      _entryField("Owner Name", ownerNameController,TextInputType.text,FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),_isNameEmpty),
      _entryField("Contact Number",ownerContactController,TextInputType.number,FilteringTextInputFormatter.digitsOnly,_isContactEmpty),

    ],
  );
}

Widget _title() {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
        text: 'Register',
        style: GoogleFonts.quicksand(
          fontSize: 30,
          color: Color(0xfff7892b),
        ),
        children: [
          TextSpan(
            text: ' Workshop',
            style: GoogleFonts.quicksand(
              fontSize: 30,
              color: Colors.black,
            )
          ),
        ]),
  );
}



//
//class cityPicker extends StatefulWidget {
//  @override
//  _cityPickerState createState() => _cityPickerState();
//}
//
//class _cityPickerState extends State<cityPicker> {
//  String cityValue;
//  String countryValue;
//  String stateValue;
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        padding: EdgeInsets.symmetric(horizontal: 20),
//        height: 600,
//        child:
//        Column(
//          children: [
//            SelectState(
//              onCountryChanged: (value) {
//                setState(() {
//                  countryValue = value;
//                });
//              },
//              onStateChanged:(value) {
//                setState(() {
//                  stateValue = value;
//                });
//              },
//              onCityChanged:(value) {
//                setState(() {
//                  cityValue = value;
//                });
//              },
//
//            ),
//            // InkWell(
//            //   onTap:(){
//            //     print('country selected is $countryValue');
//            //     print('country selected is $stateValue');
//            //     print('country selected is $cityValue');
//            //   },
//            //   child: Text(' Check')
//            // )
//          ],
//        )
//    );
//  }
//}
