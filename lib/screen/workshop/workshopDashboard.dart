import 'package:bikersworld/screen/workshop/addServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/workshop/services/referenceWorkshop.dart';
import 'package:bikersworld/screen/workshop/addMechanics.dart';
import 'package:bikersworld/screen/workshop/services/electricalService.dart';
import 'package:bikersworld/screen/workshop/services/mechanicalService.dart';
import 'package:bikersworld/screen/workshop/services/oilAndTuning.dart';
import 'package:bikersworld/screen/workshop/addServices.dart';
import 'package:bikersworld/screen/workshop/reviews/reviews.dart';
import 'package:bikersworld/screen/workshop/viewMechanics.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class workshopdashboard extends StatefulWidget {
  @override
  _workshopdashboardState createState() => _workshopdashboardState();
}

class _workshopdashboardState extends State<workshopdashboard> {

  int _checkboxValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        elevation: 0,
        backgroundColor: Color(0XFF012A4A),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: GoogleFonts.kodchasan(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Color(0xfff0f0f0),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color(0XFF012A4A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: Container(
                  child: Column(
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                "Information",
                                style: GoogleFonts.kodchasan(
                                  color: Colors.white,
                                  fontSize: 20,
                                )
                            ),
                            Text(
                              "ISB",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text(
                              "Address",
                              style: GoogleFonts.krub(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF2ecc71),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: Text(
                                "Rating 10",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "F10 Market Islamabad Shop 3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfffbb448),
                        Color(0xfff7892b),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Mechanics", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.userPlus, color: Color(0xffc4040e),),
                    ),
                    title: Text("Add Mechanics"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => addMechanics()));
                    },
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.eye, color: Colors.black,),
                    ),
                    title: Text("View Mechanics"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => viewMechanics()));
                    },
                  ),
                ),
              ),

              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Services", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffecf0f1),
                            child: Icon(FontAwesomeIcons.cogs, color: Color(0xFFf1c40f),),
                          ),
                          title: Text("Mechanical"),

                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => mechanicalService()));
                      },
                    ),

                    SizedBox(height: 10,),

                    FlatButton(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffecf0f1),
                            child: Icon(FontAwesomeIcons.bolt, color: Color(0xFF2980b9),),
                          ),
                          title: Text("Electrical"),

                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => electricalService()));
                      },
                    ),

                    SizedBox(height: 10,),

                    FlatButton(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffecf0f1),
                            child: Icon(FontAwesomeIcons.oilCan, color: Color(0xff2ecc71),),
                          ),
                          title: Text("Oil and Tuning"),

                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => oilTuningService()));
                      },
                    ),

                    SizedBox(height: 10,),

                    FlatButton(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffecf0f1),
                            child: Icon(FontAwesomeIcons.plus, color: Color(0xffc4040e),),
                          ),
                          title: Text("Add Service"),

                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddServices()));
                      },
                    ),

                  ],
                ),
              ),


              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30,),
                alignment: Alignment.topLeft,
                child: Text("Status", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,

                ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 80,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 15 , right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.clock, color: Color(0xfff7892b),),
                        ),

                        SizedBox(width: 60,),
                        LiteRollingSwitch(
                          value: true,
                          textOn: 'ON',
                          textOff: 'OFF',
                          colorOn: Colors.greenAccent[700],
                          colorOff: Colors.redAccent[700],
                          iconOn: Icons.done,
                          iconOff: Icons.remove_circle_outline,
                          textSize: 16.0,
                          onChanged: (bool state) {
//Use it to manage the different states
                            print('Current State of SWITCH IS: $state');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Reference", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
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
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.store, color: Color(0xff322770),),
                    ),
                    title: Text("Make Reference"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => referenceWorkshop()));
                    },
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Check Reviews", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.comments, color: Colors.black,),
                    ),
                    title: Text("Reviews"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => reviews()));
                    },
                  ),
                ),
              ),
              SizedBox(height:20,),
            ],
          ),
        ),
      ),


    );
  }
}
//
//Container(
//height: 85,
//width: 360,
//color:Color(0xffecf0f1),
//child: Card(
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(8),
//),
//child: Container(
//margin: EdgeInsets.only(left: 15),
//child: Row(
//children: <Widget>[
//CircleAvatar(
//backgroundColor: Color(0xffecf0f1),
//child: Icon(FontAwesomeIcons.clock, color: Color(0xfff7892b),),
//),
//
//SizedBox(width: 60,),
//LiteRollingSwitch(
//value: true,
//textOn: 'ON',
//textOff: 'OFF',
//colorOn: Colors.greenAccent[700],
//colorOff: Colors.redAccent[700],
//iconOn: Icons.done,
//iconOff: Icons.remove_circle_outline,
//textSize: 16.0,
//onChanged: (bool state) {
////Use it to manage the different states
//print('Current State of SWITCH IS: $state');
//},
//),
//],
//),
//),
//),
//),
