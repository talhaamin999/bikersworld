import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/workshop/workshop_dashboard.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:bikersworld/services/workshop_queries/mechanic_queries.dart';
import 'package:bikersworld/widgets/entry_field.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/screen/workshop/add_services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _formKey = GlobalKey<FormState>();
String _currentItemselected = 'Electrition';

class AddMechanics extends StatefulWidget {
  @override
  _AddMechanicsState createState() => _AddMechanicsState();
}

class _AddMechanicsState extends State<AddMechanics> {
  int currentIndex;
  ToastErrorMessage _error = ToastErrorMessage();
  ToastValidMessage _valid = ToastValidMessage();

  final mechanicNameController = TextEditingController();
  final mechanicContactController = TextEditingController();


  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }
  @override
  void dispose() {
    mechanicContactController.dispose();
    mechanicNameController.dispose();
    super.dispose();
  }
  void clear(){
    _formKey.currentState.reset();
    mechanicNameController.clear();
    mechanicContactController.clear();
  }
  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  validateFields() async{

    final ValidateWorkshopMechanics mechanic = ValidateWorkshopMechanics();
    if(!mechanic.validateMechanicName(mechanicNameController.text.trim()) && !mechanic.validateMechanicContact(mechanicContactController.text.trim()) && !mechanic.validateMechanicSpeciality(_currentItemselected)){
      _error.errorToastMessage(errorMessage: "Enter Valid Data in Each Field");
    }
    else if(!mechanic.validateMechanicName(mechanicNameController.text.trim())){
      _error.errorToastMessage(errorMessage: "Mechanic Name Must Only contain Alphabets");
    }
    else if(!mechanic.validateMechanicContact(mechanicContactController.text.trim())){
      _error.errorToastMessage(errorMessage: "Mechanic Contact Must be a Pakistani number");
    }
    else if(!mechanic.validateMechanicSpeciality(_currentItemselected)){
      _error.errorToastMessage(errorMessage: "Mechanic Speciality Must Be Selected");
    }
    else{
      await registerMechanic();
    }
  }
  Future<void> registerMechanic() async{
    try {
      final RegisterMechanicQueries _register = RegisterMechanicQueries();
      final Mechanics _mecahnicData = Mechanics(name: mechanicNameController.text.trim(),contact: mechanicContactController.text.trim(),speciality: _currentItemselected);
      await _register.regesterMechanic(_mecahnicData);
      if(RegisterMechanicQueries.resultMessage == 'Mechanic registered successfully'){
        _valid.validToastMessage(validMessage: RegisterMechanicQueries.resultMessage);
        clear();
        Future.delayed(
          new Duration(seconds: 2),
            (){
               Navigator.pop(this.context);
            }
        );
      }
      else{
        _error.errorToastMessage(errorMessage: RegisterMechanicQueries.resultMessage);
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
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
          iconTheme: IconThemeData(color: Color(0xfffbb448),
          ),
          leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
        onPressed:() {
          clear();
            Navigator
              .pop(context);
        }
      ),
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
                      _registerWorkshopWidget(nameController: mechanicNameController,contactController: mechanicContactController),
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
                            'Submit',
                            style: GoogleFonts.krub(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: (){
                          /*Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                                builder: (context) => Workshopdashboard()
                            ),
                          );*/
                          if(!_formKey.currentState.validate()){
                            return;
                          }
                          else{
                            validateFields();
                          }
                        },
                      ),
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

Widget _registerWorkshopWidget({@required TextEditingController nameController,@required TextEditingController contactController}) {

  return Form(
    key: _formKey,
    autovalidateMode: AutovalidateMode.disabled,
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EntryField(title: "Name",hintText: "Abdullah",controller: nameController,inputType: TextInputType.text,filter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))),
            SizedBox(height:15),
            EntryField(title: "Contact",hintText: "0310345635",controller: contactController,inputType: TextInputType.number,filter: FilteringTextInputFormatter.digitsOnly),
            SizedBox(height:15),
            Text(
                "Specilization",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                )
            ),
            SizedBox(
              height: 15,
            ),
            SpecializationComboBox(),
         ],
        ),
  );
}

Widget _title() {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
        text: 'Add',
        style: GoogleFonts.quicksand(
          fontSize: 30,
          color: Color(0xfff7892b),
        ),
        children: [
          TextSpan(
              text: ' Mechanics',
              style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.black,
              )
          ),
        ],
    ),
  );
}


class SpecializationComboBox extends StatefulWidget {
  SpecializationComboBox({Key key}) : super(key: key);

  @override
  _SpecializationComboBoxState createState() => _SpecializationComboBoxState();
}

class _SpecializationComboBoxState extends State<SpecializationComboBox> {

  var _dropDownItems = ['Electrition', 'Mechanic', 'Both'];


  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff3f3f4),
      width: 380,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: _currentItemselected,
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
              _currentItemselected = newValue;
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