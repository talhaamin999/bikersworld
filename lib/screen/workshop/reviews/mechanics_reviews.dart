import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/rating_bar.dart';


class WorkshopkMechanicsReviews extends StatefulWidget {
  @override
  _WorkshopkMechanicsReviewsState createState() => _WorkshopkMechanicsReviewsState();
}

class _WorkshopkMechanicsReviewsState extends State<WorkshopkMechanicsReviews> {
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
            )
        ),
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
                        text: 'Mechanic ',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: 'Reviews',
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
                      "Muhammad Ali ",
                      style: GoogleFonts.quicksand(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "03355437782",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
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
                    child: Text("Customer Comments", style: GoogleFonts.quicksand(
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
                                "Sardar Liaqat",
                                style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            RatingsBar(25),
                            SizedBox(height: 5,),
                            Container(
                              child: Text(
                                "Excellent work done by sardar liaqat very well harding qorking person. Am really much impressed may god bless you INSHALLAH ",
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
      ),
    );
  }
}
