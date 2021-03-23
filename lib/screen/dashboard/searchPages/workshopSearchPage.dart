import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bikersworld/screen/dashboard/normalUser/workshopDashboard.dart';
import 'package:bikersworld/widgets/search_text_field.dart';
import 'package:bikersworld/widgets/diaload_box.dart';

class workshopSearchPage extends StatefulWidget {
  @override
  _workshopSearchPageState createState() => _workshopSearchPageState();
}

class _workshopSearchPageState extends State<workshopSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0XFF012A4A),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 15),
                    child: Container(
                      child: SearchTextField(),
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Result 2",
                        style: GoogleFonts.varelaRound(
                          fontSize: 15,

                        ),
                      ),
                    ),
                    SizedBox(width: 90,),
                    FlatButton(
                      onPressed: (){

                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Filter",
                              style: GoogleFonts.varelaRound(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(
                                FontAwesomeIcons.filter,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: (){
                        print('Alphabetically sort');
                      },
                      child: Container(
                        child:Row(
                          children: <Widget>[
                            Text(
                              "Sort",
                              style: GoogleFonts.varelaRound(
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(width: 2,),
                            Icon(
                              FontAwesomeIcons.sortAlphaUp,
                              size: 17,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Search Result", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),

              SizedBox(height: 20,),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => normalUserWorkshopDashboard()));

                },
                child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 110,
                            child: Image(
                              image: AssetImage("assets/workshop1.webp"),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Automotive Repair",
                                     style: GoogleFonts.quicksand(
                                       fontSize: 18,
                                     ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Text(
                                    "Islamabad",
                                    style: TextStyle(
                                      fontSize: 15
                                    ),
                                  ),
                                ),

                                SizedBox(height: 3,),

                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        "OPEN",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Image(
                            image: AssetImage("assets/workshop2.png"),
                          ),
                        ),
                        SizedBox(width: 10,),
                        FlatButton(
                          onPressed: (){

                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Auto Repair",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Text(
                                    "Rawalpindi",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),

                                SizedBox(height: 3,),

                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        "OFF",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Image(
                            image: AssetImage("assets/workshop3.jpeg"),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Motorcycle Customes",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                child: Text(
                                  "Islamabad",
                                  style: TextStyle(
                                      fontSize: 15
                                  ),
                                ),
                              ),

                              SizedBox(height: 3,),

                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "OFF",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Image(
                            image: AssetImage("assets/workshop4.png"),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "RS Auto Shop",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                child: Text(
                                  "Islamabad",
                                  style: TextStyle(
                                      fontSize: 15
                                  ),
                                ),
                              ),

                              SizedBox(height: 3,),

                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "ON",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Image(
                            image: AssetImage("assets/workshop1.webp"),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Ali Workshop",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                child: Text(
                                  "Islamabad",
                                  style: TextStyle(
                                      fontSize: 15
                                  ),
                                ),
                              ),

                              SizedBox(height: 3,),

                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "ON",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}
