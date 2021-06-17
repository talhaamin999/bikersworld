import 'dart:async';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/admin_data_queries/admin_workshop_queries.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:bikersworld/services/workshop_queries/service_queries.dart';
import 'package:bikersworld/widgets/entry_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

ToastErrorMessage _error = ToastErrorMessage();
ToastValidMessage _valid = ToastValidMessage();
String _currentCategorySelected;

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
  int documentIndex;
  final _serviceTitleController = TextEditingController();
  final _servicePriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final WorkshopServiceQueries _add = WorkshopServiceQueries();
  final _firebaseUser = FirebaseAuth.instance.currentUser;
  String option;
  bool _isButtonVisible = true;

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
      // _serviceInfo = Services(title: widget.service.title,
      //     category: widget.service.category,
      //     price: widget.service.price,
      //     workshopCity: widget.service.workshopCity,
      //     workshopId: widget.service.workshopCity);
      _serviceTitleController.text = widget.service.title;
      _servicePriceController.text = widget.service.price.toString();
      _currentCategorySelected = widget.service.category;
      documentIndex = widget.index;
      print(documentIndex);
      print(widget.service.workshopId);
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
    if(!service.validateServiceCategory(_currentCategorySelected) && !service.validateServiceTitle(_serviceTitleController.text.trim())){
      _error.errorToastMessage(errorMessage: "Enter Valid Data in Each Field");
    }
    else if(!service.validateServiceCategory(_currentCategorySelected)){
      _error.errorToastMessage(errorMessage: "Service Category Must Only contain Alphabets");
    }
    else if(!service.validateServiceTitle(_serviceTitleController.text.trim())){
      _error.errorToastMessage(errorMessage: "Service Title Must Only contain Alphabets");
    }
    else{

      if(_price > 2000) {
        await Alert(
          context: context,
          type: AlertType.warning,
          title: "Alert",
          desc: "Services generally don't have price greater than 2000",
          buttons: [
            DialogButton(
              width: 120,
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                option = 'cancel';
                Navigator.of(context,rootNavigator: true).pop();
              },
            ),
            DialogButton(
              width: 120,
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                option = 'ok';
                Navigator.of(context, rootNavigator: true).pop();
              }
            )
          ],
        ).show();
        if(option == 'ok'){
          widget.service != null ? await updateService(_price) : await addService(_price);
        }
      }
      else{
        setState(() {
          _isButtonVisible = false;
        });
        widget.service != null ? await updateService(_price) : await addService(_price);
      }
    }
  }
  Future<void> addService(int price) async{
    try {
      Services data = Services(title: _serviceTitleController.text.trim(), category: _currentCategorySelected, price: price, workshopCity: _cityName, workshopId: _firebaseUser.uid);
      bool result = await _add.addWorkshopService(data);
      if(result){
        _valid.validToastMessage(validMessage: WorkshopServiceQueries.registerResultMessage);
        clear();
        setState(() {
          _isButtonVisible = true;
        });
        Future.delayed(
          new Duration(seconds: 2),
              (){
            Navigator.pop(context);
          },
        );
      }
      else{
        _error.errorToastMessage(errorMessage: _add.errorMessage);
      }
    }catch(e){
       _error.errorToastMessage(errorMessage: e.toString());
    }finally{
      setState(() {
        _isButtonVisible = true;
      });
    }
}
  Future<void> updateService(int price) async{
    try {
      final Services data = Services(title: _serviceTitleController.text.trim(), category: _currentCategorySelected, price: price, workshopCity: widget.service.workshopCity, workshopId: widget.service.workshopId);
      bool result = await _add.updateService(data, documentIndex);
      if(result){
        clear();
        _valid.validToastMessage(validMessage: WorkshopServiceQueries.updateResultMessage);
        setState(() {
          _isButtonVisible = true;
        });
        Future.delayed(
          new Duration(seconds: 2),
              (){
            Navigator.pop(context);
          },
        );
      }
      else{
        _error.errorToastMessage(errorMessage: _add.errorMessage);
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }finally{
      setState(() {
        _isButtonVisible = true;
      });
    }
  }

  void checkFormState(){
    if(!_formKey.currentState.validate()){
      return;
    }
    else{
      validateFields();
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
                padding: EdgeInsets.only(left: 10 , right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15,),
                      _title(widget.service),
                      SizedBox(height: 15),
                      Container(
                        child: Text(
                          "Category",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      _addServicesWidget(titleController: _serviceTitleController,priceController: _servicePriceController,formKey: _formKey),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 60,
                          child: RaisedButton(
                            onPressed: _isButtonVisible ? () => {checkFormState()} : null,
                            child:Text(
                              widget.service != null ? 'Update Service':'Add Service',
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

Widget _title(Services _Service) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: _Service != null ? 'Update':'Add',
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

  final _adminData = AdminWorkshopQueries();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _adminData.getWorkshopServiceCategory(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if(snapshot.hasData && snapshot.data.isNotEmpty){
          return Padding(
            padding: const EdgeInsets.only( top:10),
            child:Container(
              color: Colors.white,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select Category",
                  searchBoxDecoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5),
                      ),
                    ),
                  ),
                  showSelectedItem: true,
                  items: snapshot.data,
                  // showClearButton: true,
                  onChanged: (value){
                    setState(() {
                      _currentCategorySelected = value;
                    });
                  },
                ),
              ),
            ),
          );
        }
        else if(snapshot.hasData && snapshot.data.isEmpty){
          return Padding(
            padding: const EdgeInsets.only( top:10),
            child:Container(
              color: Colors.white,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select Category",
                  searchBoxDecoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5),
                      ),
                    ),
                  ),
                  showSelectedItem: true,
                  items: ['mechanical','Electrical','Tuning','Other'],
                  // showClearButton: true,
                  onChanged: (value){
                    setState(() {
                      _currentCategorySelected = value;
                    });
                  },
                ),
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
