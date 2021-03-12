import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/screen/autoPartStore/registerAutoParts.dart';

class RegisterAutoPartStore extends StatefulWidget {
  @override
  _RegisterAutoPartStoreState createState() => _RegisterAutoPartStoreState();
}

class _RegisterAutoPartStoreState extends State<RegisterAutoPartStore> {
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
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                                builder: (context) => registerAutoParts()
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
        drawer: drawer(),
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

Widget _registerWorkshopWidget() {
  return Column(
    children: <Widget>[
      _entryField("Store Name"),
      _entryField("City"),
      _entryField("Specific Area"),

  Container(
  margin: EdgeInsets.symmetric(vertical: 10),
  child: Row(
  children: <Widget>[
  SizedBox(
  width: 20,
  ),
  Expanded(
  child: Padding(
  padding: EdgeInsets.symmetric(horizontal: 10),
  child: Divider(
  thickness: 1,
  ),
  ),
  ),
  Text('Owner Information' ,style: GoogleFonts.quicksand(fontSize: 15),),
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

      _entryField("Owner Name"),
      _entryField("Contact Number"),


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
              text: ' PartStore',
              style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.black,
              )
          ),
        ]),
  );
}
