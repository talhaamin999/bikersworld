import 'package:bikersworld/screen/autoPartStore/autoPartStoreDashboardOwner.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/screen/workshop/add_services.dart';
import 'package:bikersworld/screen/dashboard/AutoPartStore/autoPartStoreDashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class registerAutoParts extends StatefulWidget {
  @override
  _registerAutoPartsState createState() => _registerAutoPartsState();
}


class _registerAutoPartsState extends State<registerAutoParts> {
  int currentIndex;
  String dropdownValue = 'Electrical';
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

                      _registerpartWidget(),
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
                                builder: (context) => AutoPartStoreDashboardOwner()
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //drawer: Drawer(),
      ),
    );
  }
}

Widget _entryField(String title, {bool isPassword = false})
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

Widget _registerpartWidget() {
  return Column(
    children: <Widget>[
      _entryField("Part Quantity"),
      Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Select",
              style: GoogleFonts.quicksand(
                fontSize: 20,
              ),
            ),
            SizedBox(width:10),
            Text(
              "Category",
              style: GoogleFonts.quicksand(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10,),
      categoriesComboBox(),
      SizedBox(height: 20,),
      addPart("1"),
      SizedBox(height: 20,),
      addPart("2"),

    ],
  );
}

class addPart extends StatelessWidget {
  addPart(this.text);

  String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  CircleAvatar(backgroundColor: Color(0XFF012A4A),child: Text(text,style: TextStyle(fontSize: 20),),),
                  _entryField("Title"),
                  _entryField("Price"),
                  SizedBox(height: 15,),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Select",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Type",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:15),
                  typeComboBoxBtn(),
                  SizedBox(height:15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Part",
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "Status",
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      LiteRollingSwitch(
                        value: true,
                        textOn: 'In Stock',
                        textOff: 'Out of stock',
                        colorOn: Colors.greenAccent[700],
                        colorOff: Colors.redAccent[700],
                        iconOn: Icons.done,
                        iconOff: Icons.remove_circle_outline,
                        textSize: 11.0,
                        onChanged: (bool state) {
//Use it to manage the different states
                          print('Current State of SWITCH IS: $state');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
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
              text: ' AutoParts',
              style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.black,
              )
          ),
        ]),
  );
}






class categoriesComboBox extends StatefulWidget {
  categoriesComboBox({Key key}) : super(key: key);

  @override
  _categoriesComboBoxState createState() => _categoriesComboBoxState();
}

class _categoriesComboBoxState extends State<categoriesComboBox> {

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




class autoPartTextfield extends StatelessWidget {
  autoPartTextfield(this.Text,);

  String Text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width - 90,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffe6e6e6),
          border: InputBorder.none,
          labelText: Text,
        ),
      ),
    );
  }
}



class typeComboBoxBtn extends StatefulWidget {
  typeComboBoxBtn({Key key}) : super(key: key);

  @override
  _typeComboBoxBtnState createState() => _typeComboBoxBtnState();
}

class _typeComboBoxBtnState extends State<typeComboBoxBtn> {
  String dropdownValue = 'Local';


  Widget build(BuildContext context) {
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
          items: <String>['Local', 'Geniun', 'Others']
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
