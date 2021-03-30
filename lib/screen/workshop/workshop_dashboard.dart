import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/workshop/add_services.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/workshop/add_mechanics.dart';
import 'package:bikersworld/screen/workshop/services/service_category.dart';
import 'package:bikersworld/screen/workshop/reviews/reviews.dart';
import 'package:bikersworld/screen/workshop/view_mechanics.dart';
import 'package:bikersworld/screen/workshop/register_workshop.dart';
import 'package:bikersworld/screen/workshop/add_profile_picture.dart';

WorkshopDashboardModel data;
var image;

class WorkshopDashboard extends StatefulWidget {
  @override
  _WorkshopDashboardState createState() => _WorkshopDashboardState();

}

class _WorkshopDashboardState extends State<WorkshopDashboard> {

  int _checkboxValue;
  static final String _WORKSHOP_COLLECTION = "workshop";
  final _firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    RegisterWorkshop(data: data,)));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(_WORKSHOP_COLLECTION).doc(_firebaseUser.uid).snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data != null){
            image = snapshot.data.get('image');
            data = WorkshopDashboardModel.fromJson(snapshot.data.data());
            print('${snapshot.data.data()}');
             return Dashboard();
           }
          else if(snapshot.connectionState == ConnectionState.active){
            image = snapshot.data.get('image');
            data = WorkshopDashboardModel.fromJson(snapshot.data.data());
            print('${snapshot.data.data()}');
               return Dashboard();
           }
          else if(snapshot.hasError){
             return Center(
             child: Text(snapshot.error.toString(),),
             );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final _workshop = RegisterWorkshopQueries();
  final _error = ToastErrorMessage();
  final _valid = ToastValidMessage();

  Future deleteImage() async{
    try {
      if(image != null) {
        await _workshop.deleteImage(image);
        if (RegisterWorkshopQueries.deleteImageResult ==
            "Image deleted successfully") {
          await _workshop.uploadWorkshopImage(null);
          if (RegisterWorkshopQueries.imageResult == "Image Uploaded") {
            setState(() {
              image = null;
            });
            _valid.validToastMessage(
                validMessage: 'Image is successfully deleted');
            Future.delayed(
                new Duration(seconds: 1),
                    () {
                  Navigator.pop(context);
                }
            );
          } else {
            _error.errorToastMessage(
                errorMessage: RegisterWorkshopQueries.imageResult);
          }
        } else {
          _error.errorToastMessage(
              errorMessage: RegisterWorkshopQueries.deleteImageResult);
        }
      }else{
        _error.errorToastMessage(errorMessage: 'No Image Found');
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff0f0f0),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(

          children: <Widget>[

            Container(
                height: 310,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0XFF012A4A),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left:15,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            FlatButton(
                              child: CircleAvatar(
                                backgroundImage: image != null ? NetworkImage(image) : AssetImage("assets/workshop1.webp"),
                                radius: 50,
                                backgroundColor: Colors.black,
                              ),
                              onPressed: (){
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context){
                                      return Container(
                                        height: 320,
                                        color: Color(0xffe8e8e8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15, top:15),
                                              child: Text(
                                                "Select Option",
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 15,),
                                            FlatButton(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:15),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        child: Icon(
                                                          FontAwesomeIcons.image,
                                                          color: Color(0XFF012A4A),
                                                        ),
                                                        backgroundColor: Color(0xffd6d6d6),
                                                      ),
                                                      SizedBox(width:20),
                                                      Text(
                                                        "Upload Photo",
                                                        style: GoogleFonts.quicksand(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopProfilePhoto()));
                                              },
                                            ),
                                            FlatButton(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:15, top:15),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        child: Icon(
                                                          FontAwesomeIcons.images,
                                                          color: Colors.orangeAccent,
                                                        ),
                                                        backgroundColor: Color(0xffd6d6d6),

                                                      ),
                                                      SizedBox(width:20),
                                                      Text(
                                                        "Update Photo",
                                                        style: GoogleFonts.quicksand(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onPressed: (){
                                                //
                                              },
                                            ),
                                            FlatButton(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:15, top:15),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        child: Icon(
                                                          FontAwesomeIcons.minus,
                                                          color: Colors.red,
                                                        ),
                                                        backgroundColor: Color(0xffd6d6d6),
                                                      ),
                                                      SizedBox(width:20),
                                                      Text(
                                                        "Delete Photo",
                                                        style: GoogleFonts.quicksand(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onPressed: (){
                                                deleteImage();
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Center(
                                                child: FlatButton(
                                                  onPressed: (){

                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100.0),
                                                      gradient: LinearGradient(
                                                        begin: Alignment.topLeft,
                                                        end: Alignment.bottomRight,
                                                        colors: [
                                                          Color(0xfffbb448),
                                                          Color(0xffed740c),
                                                        ],
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Submit",
                                                        style: GoogleFonts.raleway(
                                                          fontSize: 20.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );

                                    }
                                );
                              }
                            ),
                            Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:25,),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.calendarAlt , color: Colors.white,),
                                            SizedBox(width: 10,),
                                            SizedBox(
                                              child: AutoSizeText(
                                                data.openFrom,
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            Text(
                                              "-",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            SizedBox(
                                              child: AutoSizeText(
                                                data.openTo,
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 55),
                                      child: Container(
                                          child: Row(
                                            children: [
                                              Icon(FontAwesomeIcons.clock , color: Colors.white,),
                                              SizedBox(width: 10,),
                                              SizedBox(
                                                child: AutoSizeText(
                                                  data.openTime,
                                                  style: GoogleFonts.quicksand(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8,),
                                              Text(
                                                "-",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 8,),
                                              SizedBox(
                                                child: AutoSizeText(
                                                  data.closeTime,
                                                  style: GoogleFonts.quicksand(
                                                    fontSize: 18,
                                                    color: Colors.white,
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

                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        child: AutoSizeText(
                          data.shopTitle,
                          style: GoogleFonts.quicksand(
                            fontSize: 30,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.userTie, color: Colors.white70,),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                      data.ownerName,
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 15,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.mapMarkerAlt, color: Colors.white70,),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                      data.area,
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.phone, color: Colors.white70,),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                      data.ownerContact,
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceCategoryInformation(serviceCategory: 'Mechanical',)));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceCategoryInformation(serviceCategory: 'Electrical',)));
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
                        title: Text("Tuning"),

                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceCategoryInformation(serviceCategory: 'Tuning',)));
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
/**
 * Padding(
    padding: const EdgeInsets.only(top:8),
    child: Container(
    child: Row(
    children: [
    Padding(
    padding: const EdgeInsets.only(left:1),
    child: Icon(FontAwesomeIcons.clock , color: Colors.white,),
    ),
    SizedBox(width: 10,),
    SizedBox(
    child: AutoSizeText(
    data.openTime,
    style: GoogleFonts.quicksand(
    fontSize: 18,
    color: Colors.white,
    ),
    ),
    ),
    SizedBox(width: 8,),
    Text(
    "-",
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    SizedBox(width: 8,),
    SizedBox(
    child: AutoSizeText(
    data.closeTime,
    style: GoogleFonts.quicksand(
    fontSize: 18,
    color: Colors.white,
    ),
    ),
    ),
    ],
    ),
    ),
    ),
 */
