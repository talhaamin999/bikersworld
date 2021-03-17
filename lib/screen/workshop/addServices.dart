import 'dart:async';

import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:bikersworld/services/workshop_queries/service_queries.dart';
import 'package:bikersworld/widgets/entry_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/widgets/customeTextArea.dart';
import 'package:bikersworld/screen/workshop/workshopDashboard.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _serviceTitleController = TextEditingController();
TextEditingController _serviceCategoryController = TextEditingController();
TextEditingController _servicePriceController = TextEditingController();
ToastErrorMessage _error = ToastErrorMessage();
ToastValidMessage _valid = ToastValidMessage();

class AddServices extends StatefulWidget {
  @override
  _AddServicesState createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {

  int currentIndex;

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
  validateFields() async{

    final ValidateWorkshopServices service = ValidateWorkshopServices();
    final int _price = int.tryParse(_servicePriceController.text.trim());
    if(!service.validateServiceCategory(_serviceCategoryController.text.trim()) && !service.validateServiceTitle(_serviceTitleController.text.trim()) && !service.validateServicePrice(_price)){
      _error.errorToastMessage(errorMessage: "Enter Valid Data in Each Field");
    }
    else if(!service.validateServiceCategory(_serviceCategoryController.text.trim())){
      _error.errorToastMessage(errorMessage: "Service Category Must Only contain Alphabets");
    }
    else if(!service.validateServiceTitle(_serviceTitleController.text.trim())){
      _error.errorToastMessage(errorMessage: "Service Title Must Only contain Alphabets");
    }
    else if(!service.validateServicePrice(_price)){
      _error.errorToastMessage(errorMessage: "Service Price must be less than or equal to 2000");
    }
    else{
     await addService(_price);
    }
  }
  Future<void> addService(int price) async{
  try {
      final WorkshopServiceQueries _add = WorkshopServiceQueries();
      await _add.addWorkshopService(_serviceTitleController.text.trim(),
          _serviceCategoryController.text.trim(), price);
      if(WorkshopServiceQueries.resultMessage == WorkshopServiceQueries.completionMessage){
        _valid.validToastMessage(validMessage: WorkshopServiceQueries.resultMessage);
        Future.delayed(
          new Duration(seconds: 2),
              (){
            Navigator.of(this.context).push(MaterialPageRoute(builder: (context) => WorkshopDashboard())
            );
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30,),
                      _title(),
                      SizedBox(height: 40),
                      _addServicesWidget(),
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
Widget _addServicesWidget() {
  return Form(
    key: _formKey,
    autovalidateMode: AutovalidateMode.disabled,
    child: Column(
      children: <Widget>[
        EntryField(title: "Category",hintText: 'Mechanical',controller: _serviceCategoryController,inputType: TextInputType.text,filter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))),
        SizedBox(height:15,),
        EntryField(title: "Title",hintText: 'wheel barring',controller: _serviceTitleController,inputType: TextInputType.text,filter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))),
        SizedBox(height:15,),
        EntryField(title: "Price",hintText: 'price < 2000',controller: _servicePriceController,inputType: TextInputType.number,filter:FilteringTextInputFormatter.digitsOnly),
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
