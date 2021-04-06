import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/rating_bar.dart';

class reviews extends StatefulWidget {
  @override
  _reviewsState createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
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
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                    Container(
                        child:RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: 'Workshop',
                            style: GoogleFonts.quicksand(
                              fontSize: 30,
                              color: Color(0xfff7892b),
                            ),
                            children: [
                              TextSpan(
                                  text: ' Reviews',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 30,
                                    color: Colors.black,
                                  )
                              ),
                            ],
                          ),
                        ),
                    ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "4.0",
                      style: GoogleFonts.hindSiliguri(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RatingsBar(30),
                  SizedBox(
                    height: 20,
                  ),
                  Container(

                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30,),
                    alignment: Alignment.topLeft,
                    child: Text("Customer Reviews", style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.user, color: Color(0xfff7892b),),
                        ),
                        title: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Muhammad Ali",
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            RatingsBar(20),
                            SizedBox(height: 10,),
                            Container(
                              child: Text(
                                "Its very excellent car it gives mileage of 9 in city and 12 in highway,its comfort is way to better and its metal is also strong because despite being hit many times by vehicles no big dent came but only 1 back light broked.its comfort level is way too good it can easily carry 6 peoples with their bags",
                                style: GoogleFonts.raleway(
                                  fontSize: 15,
                                ),
                              ),
                            ),

                          ],
                        ),

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        drawer: drawer(),
      ),
    );
  }
}

