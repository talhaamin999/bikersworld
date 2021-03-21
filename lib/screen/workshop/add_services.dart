import 'dart:async';
import 'dart:developer';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:bikersworld/services/workshop_queries/service_queries.dart';
import 'package:bikersworld/widgets/entry_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/widgets/customeTextArea.dart';
import 'package:bikersworld/screen/workshop/workshop_dashboard.dart';

ToastErrorMessage _error = ToastErrorMessage();
ToastValidMessage _valid = ToastValidMessage();
String _currentCategorySelected = 'Mechanical';

class AddServices extends StatefulWidget {
  final Services service;
  final int index;
  AddServices({this.service,this.index});
  @override
  _AddServicesState createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {

  int currentIndex;
  String _cityName;
  Services _serviceInfo;
  int documentIndex;
  final _serviceTitleController = TextEditingController();
  final _servicePriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final WorkshopServiceQueries _add = WorkshopServiceQueries();
  final _firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    cityName();
    mapServiceData();
    super.initState();
    currentIndex = 0;
  }
  @override
  void dispose() {
    _serviceTitleController.dispose();
    _servicePriceController.dispose();
    super.dispose();
  }
  void clear(){

    _formKey.currentState.reset();
    _serviceTitleController.clear();
    _servicePriceController.clear();

  }
  void mapServiceData(){
    if(widget.service != null) {
      _serviceInfo = Services(title: widget.service.title,
          category: widget.service.category,
          price: widget.service.price,
          workshopCity: widget.service.workshopCity,
          workshopId: widget.service.workshopCity);
      _serviceTitleController.text = widget.service.title;
      _servicePriceController.text = widget.service.price.toString();
      _currentCategorySelected = widget.service.category;
      documentIndex = widget.index;
      print(documentIndex.toString());
    }
  }

  Future cityName() async{
   _cityName = await _add.getWorkshopCityName();
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  validateFields() async{

    final ValidateWorkshopServices service = ValidateWorkshopServices();
    final int _price = int.tryParse(_servicePriceController.text.trim());
    if(!service.validateServiceCategory(_currentCategorySelected) && !service.validateServiceTitle(_serviceTitleController.text.trim()) && !service.validateServicePrice(_price)){
      _error.errorToastMessage(errorMessage: "Enter Valid Data in Each Field");
    }
    else if(!service.validateServiceCategory(_currentCategorySelected)){
      _error.errorToastMessage(errorMessage: "Service Category Must Only contain Alphabets");
    }
    else if(!service.validateServiceTitle(_serviceTitleController.text.trim())){
      _error.errorToastMessage(errorMessage: "Service Title Must Only contain Alphabets");
    }
    else if(!service.validateServicePrice(_price)){
      _error.errorToastMessage(errorMessage: "Service Price must be less than or equal to 2000");
    }
    else{
      if(widget.service != null){
        await updateService(_price);
      }else {
        await addService(_price);
      }
    }
  }
  Future<void> addService(int price) async{
  try {

      Services data = Services(title: _serviceTitleController.text.trim(), category: _currentCategorySelected, price: price, workshopCity: _cityName, workshopId: _firebaseUser.uid);
      await _add.addWorkshopService(data);
      if(WorkshopServiceQueries.resultMessage == WorkshopServiceQueries.completionMessage){
        _valid.validToastMessage(validMessage: WorkshopServiceQueries.resultMessage);
        clear();
        Future.delayed(
          new Duration(seconds: 2),
              (){
            Navigator.pop(context);
          },
        );
      }
      else{
        _error.errorToastMessage(errorMessage: WorkshopServiceQueries.resultMessage);
      }
    }catch(e){
       _error.errorToastMessage(errorMessage: e.toString());
    }
}
  Future<void> updateService(int price) async{
    try {
      final Services data = Services(title: _serviceTitleController.text.trim(), category: _currentCategorySelected, price: price, workshopCity: _serviceInfo.workshopCity, workshopId: _serviceInfo.workshopId);
      await _add.updateService(data, documentIndex);
      if(WorkshopServiceQueries.updateResultMessage == WorkshopServiceQueries.SUCCESS_UPDATE){
        _valid.validToastMessage(validMessage: WorkshopServiceQueries.updateResultMessage);
        clear();
        Future.delayed(
          new Duration(seconds: 2),
              (){
            Navigator.pop(context);
          },
        );
      }
      else{
        _error.errorToastMessage(errorMessage: WorkshopServiceQueries.updateResultMessage);
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    int _checkboxValue;
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
              onPressed:() {
                clear();
                Navigator.pop(context);
              }
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30,),
                      _title(),
                      SizedBox(height: 40),
                      _addServicesWidget(titleController: _serviceTitleController,priceController: _servicePriceController,formKey: _formKey),
                      SizedBox(height: 20),
                      FlatButton(
                      child: Container(
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
                          'Register Now',
                          style: GoogleFonts.krub(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: (){
                        if(!_formKey.currentState.validate()){
                          return;
                        }
                        else{
                          validateFields();
                        }
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
      ),
    );
  }
}
Widget _addServicesWidget({@required TextEditingController titleController,@required TextEditingController priceController,@required GlobalKey formKey}) {
  return Form(
    key: formKey,
    autovalidateMode: AutovalidateMode.disabled,
    child: Column(
      children: <Widget>[
        SpecializationComboBox(),
        SizedBox(height:15,),
        EntryField(title: "Title",hintText: 'wheel barring',controller: titleController,inputType: TextInputType.text,filter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))),
        SizedBox(height:15,),
        EntryField(title: "Price",hintText: 'price < 2000',controller: priceController,inputType: TextInputType.number,filter:FilteringTextInputFormatter.digitsOnly),
      ],
    ),
  );
}

Widget _title() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'Add',
        style:GoogleFonts.quicksand(
          fontSize: 30,
          color: Color(0xfff7892b),
        ),
        children: [
          TextSpan(
            text: ' Services',
            style:GoogleFonts.quicksand(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ]),
  );
}
class SpecializationComboBox extends StatefulWidget {

  SpecializationComboBox({Key key}) : super(key: key);
  @override
  _SpecializationComboBoxState createState() => _SpecializationComboBoxState();
}

class _SpecializationComboBoxState extends State<SpecializationComboBox> {

  var _dropDownItems = ['Mechanical', 'Electrical', 'Tuning'];

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff3f3f4),
      width: 380,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: _currentCategorySelected,
          icon: Container(
            margin: EdgeInsets.only(left: 200),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 0, 0, 0),
              child: Icon(
                FontAwesomeIcons.caretDown,
              ),
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
              _currentCategorySelected = newValue;
            });
          },
          items: _dropDownItems
              .map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem, style: GoogleFonts.quicksand(fontSize: 15)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
