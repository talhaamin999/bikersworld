import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/rating_bar.dart';


class AutoPartDetail extends StatefulWidget {
  @override
  _AutoPartDetailState createState() => _AutoPartDetailState();
}

class _AutoPartDetailState extends State<AutoPartDetail> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff0f0f0),
        appBar: AppBar(
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Colors.white,
                child: Image(
                  image: AssetImage("assets/helogin.jpeg",),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Text(
                        "Information",
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              "Wheel Bearing",
                              style: GoogleFonts.quicksand(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Category",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              "Body and frame",
                              style: GoogleFonts.quicksand(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Type",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              "Geniune",
                              style: GoogleFonts.quicksand(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Price",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              "200",
                              style: GoogleFonts.quicksand(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child:  Text(
                  "Reviews",
                  style: GoogleFonts.varelaRound(
                    fontSize: 20,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    leading: CircleAvatar(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/user.png"),
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      radius: 30,
                      backgroundColor: Colors.orange,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15,),
                        Container(
                          child: Text(
                            "Ibtasam ur Rehman",
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
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit ",
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
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

