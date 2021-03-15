import 'dart:async';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/workshop/addServices.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:bikersworld/widgets/constants.dart';

//var data;
WorkshopDashboardModel data;

class Workshopdashboard extends StatefulWidget {
  @override
  _WorkshopdashboardState createState() => _WorkshopdashboardState();

}

class _WorkshopdashboardState extends State<Workshopdashboard> {

  int _checkboxValue;
  static final String _WORKSHOP_COLLECTION = "workshop";
  final _firebaseUser = FirebaseAuth.instance.currentUser;
/*
  Future fetchWorkshopData() async {
    final _firebaseUser = FirebaseAuth.instance.currentUser;
    final CollectionReference _firestoreInstance = FirebaseFirestore.instance.collection(_WORKSHOP_COLLECTION);
    await _firestoreInstance.doc(
        _firebaseUser.uid)
        .snapshots().listen((DocumentSnapshot snapshot) {
        data = WorkshopDashboardData(snapshot.get('title'),snapshot.get('city'),snapshot.get('area'),snapshot.get('owner_name'),snapshot.get('owner_contact'));
    });
  }
  */
  @override
  void initState() {
    super.initState();
    //fetchWorkshopData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BikersWorld"),
        elevation: 0,
        backgroundColor: Color(0XFF012A4A),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.orangeAccent,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(_WORKSHOP_COLLECTION).doc(_firebaseUser.uid).snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data != null){
            data = WorkshopDashboardModel(snapshot.data.get('title'),snapshot.data.get('city'),snapshot.data.get('area'),snapshot.data.get('owner_name'),snapshot.data.get('owner_contact'));
             return Dashboard();
           }
          else if(snapshot.connectionState == ConnectionState.active){
            data = WorkshopDashboardModel(snapshot.data.get('title'),snapshot.data.get('city'),snapshot.data.get('area'),snapshot.data.get('owner_name'),snapshot.data.get('owner_contact'));
               return Dashboard();
           }
          else if(snapshot.hasError){
             return Center(
             child: Text(snapshot.error.toString()),
             );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff0f0f0),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
              decoration: BoxDecoration(
                color: Color(0XFF012A4A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        data.shopTitle,
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      CircleAvatar(
                        radius: 38,
                        backgroundImage: AssetImage('assets/autoPartStore/autoPartStore2.png',),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'DashBoard',
                        style: GoogleFonts.krub(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(height:10),

                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Owner Name',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    data.ownerName,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15.0,
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
                                    'City',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    data.city,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15.0,
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
                                    'Area',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    data.area,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          FlatButton.icon(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            onPressed: () {},
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),

                            icon: const Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),

                            label: Text(
                              'Contact Us',
                              style: Styles.buttonTextStyle,
                            ),

                            textColor: Colors.white,
                          ),

                          FlatButton.icon(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),

                            onPressed: () {},
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),

                            label: Text(
                              'Information',
                              style: Styles.buttonTextStyle,
                            ),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 23),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddMechanics()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMechanics()));
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
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xffecf0f1),
                    child: Icon(FontAwesomeIcons.clock, color: Colors.deepOrange,),
                  ),
                  title: Text("Status"),
                  onTap: (){

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
    );
  }
}