import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/workshop/reviews/mechanics_reviews.dart';

class referenceWorkshop extends StatefulWidget {
  @override
  _referenceWorkshopState createState() => _referenceWorkshopState();
}

class _referenceWorkshopState extends State<referenceWorkshop> {
  int currentIndex;

  TextEditingController _textFieldController = new TextEditingController();
  TabController _tabController;
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
              children: <Widget>[
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    child:RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Refered ',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: 'PartStore',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                color: Colors.black,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                FlatButton(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.store, color: Color(0xffc4040e),),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Container(
                                    child: Text(
                                      "Athar Car AC",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: 36),
                              child: Text(
                                "Islamabad F10 Markaz Main Market Service Road",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),

                ),

                SizedBox(height: 10,),

                FlatButton(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.store, color: Color(0xffc4040e),),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Container(
                                    child: Text(
                                      "Zeeshan Autos",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: 36),
                              child: Text(
                                "Islamabad F10 Markaz Main Market Service Road",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),

                ),
                SizedBox(height: 10,),


                FlatButton(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.store, color: Color(0xffc4040e),),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Container(
                                    child: Text(
                                      "Shegal Motor ",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: 36),
                              child: Text(
                                "Islamabad F10 Markaz Main Market Service Road",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),

                ),

                SizedBox(height: 10,),

                FlatButton(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.store, color: Color(0xffc4040e),),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Container(
                                    child: Text(
                                      "khursheed Auto parts",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: 36),
                              child: Text(
                                "Islamabad F10 Markaz Main Market Service Road",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),

                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
        drawer: Drawer(),
      ),
    );
  }
}

