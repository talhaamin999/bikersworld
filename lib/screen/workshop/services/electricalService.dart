import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
class electricalService extends StatefulWidget {
  @override
  _electricalServiceState createState() => _electricalServiceState();
}

class _electricalServiceState extends State<electricalService> {
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
            )        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Electrical ',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: 'Services',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:15, right: 15),
                  child: Container(
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                        },
                        child: SizedBox(
                          width: 360,
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:12),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Name",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Wiring",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(width:72,),
                                      RaisedButton(
                                        color: Colors.blue,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Update",
                                              style: GoogleFonts.raleway(
                                                fontSize: 17,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        onPressed: (){

                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:12),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Price",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "200",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(width: 92,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:22),
                                        child: RaisedButton(
                                          color: Colors.red,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.remove,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Delete",
                                                style: GoogleFonts.raleway(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          onPressed: (){

                                          },
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
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:15, right: 15),
                  child: Container(
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                        },
                        child: SizedBox(
                          width: 360,
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:12),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Name",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Wiring",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(width:72,),
                                      RaisedButton(
                                        color: Colors.blue,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Update",
                                              style: GoogleFonts.raleway(
                                                fontSize: 17,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        onPressed: (){

                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:12),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Price",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "200",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(width: 92,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:22),
                                        child: RaisedButton(
                                          color: Colors.red,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.remove,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Delete",
                                                style: GoogleFonts.raleway(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          onPressed: (){

                                          },
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
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

