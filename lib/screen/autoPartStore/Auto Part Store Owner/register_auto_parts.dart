import 'auto_part_store_dashboard_owner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:bikersworld/widgets/city_dropdown.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class RegisterAutoParts extends StatefulWidget {
  @override
  _RegisterAutoPartsState createState() => _RegisterAutoPartsState();
}


class _RegisterAutoPartsState extends State<RegisterAutoParts> {
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
            fillColor: Color(0xffe3e3e3),
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
      _entryField("Title"),
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
      _entryField("Price"),
      SizedBox(height: 20,),
      WorkshopProfilePhoto(),

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
      color: Color(0xffe3e3e3),
      width: 320,
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
          fillColor: Color(0xffe3e3e3),
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
      color: Color(0xffe3e3e3),
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




class WorkshopProfilePhoto extends StatefulWidget {
  @override
  _WorkshopProfilePhotoState createState() => _WorkshopProfilePhotoState();
}

class _WorkshopProfilePhotoState extends State<WorkshopProfilePhoto> {
  File _image;
  bool _isButtonVisible = true;

  Future getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10,),
        Text(
          "Select Profile Photo ",
          style: GoogleFonts.quicksand(
            fontSize: 19,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width - 200,
          height: 200,
          color: Colors.grey,
          child: Center(
            child: _image == null
                ? Text("No Image is picked")
                : Container(width: 220,
              child: Image.file(
                _image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: Color(0XFF012A4A),
                    onPressed: getImagefromcamera,
                    tooltip: "pickImage",
                    child: Icon(Icons.add_a_photo),
                  ),
                  SizedBox(height: 15,),

                  Text(
                    "Camera",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: Color(0XFF012A4A),
                    onPressed: getImagefromGallery,
                    tooltip: "Pick Image",
                    child: Icon(Icons.camera_alt),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    "Gallery",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}