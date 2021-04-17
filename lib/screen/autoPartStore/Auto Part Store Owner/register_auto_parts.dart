import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'auto_part_store_dashboard_owner.dart';

class RegisterAutoParts extends StatefulWidget {
  @override
  _RegisterAutoPartsState createState() => _RegisterAutoPartsState();
}

class _RegisterAutoPartsState extends State<RegisterAutoParts> {
  int currentIndex;
  String dropdownValue = 'Electrical';


  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
          iconTheme: IconThemeData(color: Color(0xfffbb448)),
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.orange,
              )
          ),
          elevation: 0.0,
        ),
        body: Container(
          child:  Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20,),
                  RichText(
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
                  ),


                  _registerpartWidget(),

                  Padding(
                    padding: const EdgeInsets.only(left:25),
                    child: Text(
                      "Upload Part image",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          onPressed: (){
                            getImage();
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              FontAwesomeIcons.image,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width - 210,
                            height: 150,
                            color: Colors.blue,
                          child: FittedBox(
                          fit: BoxFit.fill,
                            alignment: Alignment.topLeft,
                            child: _image == null
                                ? Text('')
                                : Image.file(_image),
                            ),
                        ),
                      ],
                    ),
                  ),
                  /*
                  **/
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
        ),
      ),
    );
  }
}



Widget _registerpartWidget() {
  return Column(
    children: <Widget>[
      _entryField("Title"),
      SizedBox(height: 10,),
      Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Select",
              style: GoogleFonts.quicksand(
                fontSize: 18,
              ),
            ),
            SizedBox(width:10),
            Text(
              "Category",
              style: GoogleFonts.quicksand(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 15,),
      categoriesComboBox(),
      SizedBox(height: 15,),

      Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Select",
              style: GoogleFonts.quicksand(
                fontSize: 18,
              ),
            ),
            SizedBox(width:10),
            Text(
              "Type",
              style: GoogleFonts.quicksand(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 15,),
      TypeComboBox(),

      SizedBox(height: 10,),
      _entryField("Price"),
      SizedBox(height: 20,),

    ],
  );
}



Widget _entryField(String title,)
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
      width: 350,
      height: 50,
      child:  DropdownButton<String>(
        value: dropdownValue,
        icon: Container(
          margin: EdgeInsets.only(left: 160),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value, style: GoogleFonts.quicksand(fontSize: 15),),
            ),
          );
        }).toList(),
      ),
    );
  }
}




class TypeComboBox extends StatefulWidget {
  TypeComboBox({Key key}) : super(key: key);

  @override
  _TypeComboBoxState createState() => _TypeComboBoxState();
}

class _TypeComboBoxState extends State<TypeComboBox> {

  Widget build(BuildContext context) {
    String dropdownValue = 'Local';

    return Container(
      color: Color(0xffe3e3e3),
      width: 350,
      height: 50,
      child:  DropdownButton<String>(
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
        items: <String>['Local', 'Geniune','Others']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value, style: GoogleFonts.quicksand(fontSize: 15),),
            ),
          );
        }).toList(),
      ),
    );
  }
}

