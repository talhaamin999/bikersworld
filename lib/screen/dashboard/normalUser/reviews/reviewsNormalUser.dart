import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/screen/dashboard/normalUser/reviews/workshop_feedback_form.dart';

class reviewFromUser extends StatefulWidget {
  @override
  _reviewFromUserState createState() => _reviewFromUserState();
}

class _reviewFromUserState extends State<reviewFromUser> {
  int _checkboxValue;
  @override
  Widget build(BuildContext context) {
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
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:15, top:15),
                child: Container(
                  child: RichText(
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
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:1),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "4.0",
                        style: GoogleFonts.quicksand(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ratingBar(30),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:15,bottom:10),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopFeedbackForm()));
                  },
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child:Text("Add Reviews" , style: GoogleFonts.quicksand(fontSize:20),),
                  ),
                ),
              ),
              Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              size: 25,
                              color: Colors.white,
                            ),
                            radius: 28,
                            backgroundColor: Color(0XFF012A4A),
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(top:8.0),
                            child: Container(
                              child: Column(
                                children: [
                                  ratingBar(20),
                                  Text("Loram Ipsum",),
                                ],
                              ),
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top:5, bottom: 5),
                            child: Text("SA card is a sheet used to represent the information related to each other, such as an album, a geographical loca   heet used to represent the information related to each other, such as an album, a geographical location, contation, contact details,"),
                          ),
                        ),
                      ),

                      Container(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              size: 25,
                              color: Colors.white,
                            ),
                            radius: 28,
                            backgroundColor: Color(0XFF012A4A),
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(top:8.0),
                            child: Text("Loram Ipsum",),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top:5, bottom: 5),
                            child: Text("SA card is a sheet used to represent the information related to each other, such as an album, a geographical loca   heet used to represent the information related to each other, such as an album, a geographical location, contation, contact details,"),
                          ),
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
    );
  }
}

