import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:bikersworld/widgets/backButton.dart';

class AdDetail extends StatefulWidget {
  @override
  _AdDetailState createState() => _AdDetailState();
}

class _AdDetailState extends State<AdDetail>  with SingleTickerProviderStateMixin {
  int currentIndex;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250.0,
                  width: double.infinity,
                  child: Carousel(
                    images: [
                      AssetImage("assets/Ads/ad1.jpeg",),
                      AssetImage("assets/Ads/ad2.jpeg"),
                      AssetImage("assets/Ads/ad3.jpeg"),
                      AssetImage("assets/Ads/ad4.jpeg"),
                      AssetImage("assets/Ads/ad5.jpeg"),
                      AssetImage("assets/Ads/ad6.jpeg"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Yamaha YBR",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "PKR 1,15000",
                          style: GoogleFonts.roboto(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Bahria Town Rawalpindi",
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.grey
                                ),
                              ),
                              Icon(Icons.location_on),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: Text(
                      "Ad Information",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,

                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.table),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                    "Modal Year",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "2020",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40,),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.table),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                  "Milage",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "18",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),








                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.fill),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                  "Colors",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Blue",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40,),
                      Container(
                        margin: EdgeInsets.only(left: 55),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.mapMarkedAlt),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                  "City",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Islamabad",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.table),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                  "Price",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "1,15000",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40,),
                      Container(
                        margin: EdgeInsets.only(left: 55),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.sortNumericUp),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                  "Number",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "ABC-444",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),








                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.table),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                  "Modal Year",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "2020",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40,),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.table),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                  "Modal Year",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "2020",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: Container(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35,),
                Container(
                  height: 180,
                  width: double.infinity,
                  color: Color(0XFF012A4A),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Get your vechicle",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Find the best Ads on Bikers World...",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDashboard()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 200,
                            padding: EdgeInsets.symmetric(vertical: 13),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 40,),

              ],
            ),
          ),
        ),
        drawer: drawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height:60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Color(0XFF396ca3),  width: 2),
                    color: Color(0XFF396ca3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.phoneAlt, color: Colors.white,),
                      SizedBox(width: 5,),
                      Text("Call Seller",
                        style: GoogleFonts.quicksand(fontSize: 15, color: Colors.white),),
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
