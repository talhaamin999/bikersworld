import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/admin_data_queries/admin_workshop_queries.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:bikersworld/services/workshop_queries/mechanic_queries.dart';
import 'package:bikersworld/widgets/entry_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _formKey = GlobalKey<FormState>();
String _currentItemselected;

class AddMechanics extends StatefulWidget {

  final Mechanics mechanics;
  final int index;
  AddMechanics({this.mechanics,this.index});
  @override
  _AddMechanicsState createState() => _AddMechanicsState();
}

class _AddMechanicsState extends State<AddMechanics> {
  int currentIndex;
  ToastErrorMessage _error = ToastErrorMessage();
  ToastValidMessage _valid = ToastValidMessage();
  final TextEditingController mechanicNameController = TextEditingController()..text = '';
  final TextEditingController mechanicContactController = TextEditingController()..text = '';
  Mechanics _mechanics;
  final RegisterMechanicQueries _register = RegisterMechanicQueries();
  bool _isButtonVisible = true;
  final _adminData = AdminWorkshopQueries();

  void mapMechanicData(){
   if(widget.mechanics != null) {
     _mechanics = Mechanics(
         name: widget.mechanics.name, contact: widget.mechanics.contact, speciality: widget.mechanics.speciality);
     _currentItemselected = widget.mechanics.speciality;
     mechanicNameController.text = widget.mechanics.name;
     mechanicContactController.text = widget.mechanics.contact;
   }
 }

  @override
  void initState() {
    mapMechanicData();
    print('${widget.index}');
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
      setState(() {
        _isButtonVisible = false;
      });
      final Mechanics _mecahnicData = Mechanics(name: mechanicNameController.text.trim(),contact: mechanicContactController.text.trim(),speciality: _currentItemselected);
      if(_mechanics != null) {
         await updateDocument(mechanics: _mecahnicData, index: widget.index);
      }else{
        await registerMechanic(_mecahnicData);
      }
    }
  }
  Future<void> registerMechanic(Mechanics mecahnicData) async{
    try {
      await _register.regesterMechanic(mecahnicData);
      if(RegisterMechanicQueries.registrationResultMessage == 'Mechanic registered successfully'){
        _valid.validToastMessage(validMessage: RegisterMechanicQueries.registrationResultMessage);
        clear();
        setState(() {
          _isButtonVisible = true;
        });
        Future.delayed(
          new Duration(seconds: 2),
            (){
               Navigator.pop(this.context);
            }
        );
      }
      else{
        _error.errorToastMessage(errorMessage: RegisterMechanicQueries.registrationResultMessage);
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }finally{
      setState(() {
        _isButtonVisible = true;
      });
    }
  }
  Future<void> updateDocument({@required Mechanics mechanics,@required int index}) async{
    try {
      await _register.updateMechanic(mechanics, index);
      if (RegisterMechanicQueries.updateResultMessage == 'Mechanic Information Updated') {
        final _valid = ToastValidMessage();
        _valid.validToastMessage(
            validMessage: RegisterMechanicQueries.updateResultMessage);
        clear();
        setState(() {
          _isButtonVisible = true;
        });
        Future.delayed(
            new Duration(seconds: 2),
                (){
              Navigator.pop(this.context);
            }
        );
      } else {
        final _error = ToastErrorMessage();
        _error.errorToastMessage(
            errorMessage: RegisterMechanicQueries.updateResultMessage);
      }
    }catch(e){
      final _error = ToastErrorMessage();
      _error.errorToastMessage(
          errorMessage: e.toString());
    }finally{
      setState(() {
        _isButtonVisible = true;
      });
    }
  }
  void checkFormStatus(){
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
                      _title(_mechanics),
                      SizedBox(height: 20),
                      _registerWorkshopWidget(nameController: mechanicNameController,contactController: mechanicContactController),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 60,
                          child: RaisedButton(
                            onPressed: _isButtonVisible ? () => {checkFormStatus()} : null,
                            child: Text(
                              _mechanics != null ? 'Update':'Submit',
                              style: GoogleFonts.krub(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            color: Color(0xfff7892b),
                            disabledColor: Colors.grey.shade400,
                            disabledTextColor: Colors.black,
                          ),
                        ),
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
            SpecializationComboBox(),
         ],
        ),
  );
}

Widget _title(Mechanics mec) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
        text: mec != null ? 'Update':'Add',
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

  final _adminData = AdminWorkshopQueries();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _adminData.getWorkshopMechanicSpeciality(),
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
                  hint: "Select Speciality",
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
                      _currentItemselected = value;
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
                  hint: "Select Speciality",
                  searchBoxDecoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5),
                      ),
                    ),
                  ),
                  showSelectedItem: true,
                  items: ['mechanic','Electrician','Both'],
                  // showClearButton: true,
                  onChanged: (value){
                    setState(() {
                      _currentItemselected = value;
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