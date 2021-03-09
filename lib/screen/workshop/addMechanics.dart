import 'package:bikersworld/screen/workshop/workshopDashboard.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/screen/workshop/addServices.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AddMechanics extends StatefulWidget {
  @override
  _AddMechanicsState createState() => _AddMechanicsState();
}

class _AddMechanicsState extends State<AddMechanics> {
  int currentIndex;

  final _formKey = GlobalKey<FormState>();


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
        onPressed:() => Navigator.pop(context),
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
                            'Submit',
                            style: GoogleFonts.krub(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                                builder: (context) => workshopdashboard()
                            ),
                          );
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

Widget _entryField(String title)
{
  final _formKey = GlobalKey<FormState>();

  return Form(
    key: _formKey,
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
          decoration: InputDecoration(
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _entryField("Name"),
      SizedBox(height:15,),
      _entryField("Contact"),
      SizedBox(height:15,),

      Text(
          "Specilization",
          style: GoogleFonts.quicksand(
            fontSize: 18,
          )
      ),
      SizedBox(
        height: 15,
      ),
      specializationComboBox(),
    ],
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


class specializationComboBox extends StatefulWidget {
  specializationComboBox({Key key}) : super(key: key);

  @override
  _specializationComboBoxState createState() => _specializationComboBoxState();
}

class _specializationComboBoxState extends State<specializationComboBox> {

  Widget build(BuildContext context) {
    String dropdownValue = 'Electrical';

    return Container(
      color: Color(0xfff3f3f4),
      width: 380,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Container(
            margin: EdgeInsets.only(left: 200),
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
              dropdownValue = newValue;
            });
          },
          items: <String>['Electrical', 'Mechanical', 'Oil and tuning', 'Others']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: GoogleFonts.quicksand(fontSize: 15),),
            );
          }).toList(),
        ),
      ),
    );
  }
}