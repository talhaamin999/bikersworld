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
import 'package:bikersworld/screen/workshop/reviews/workshop_reviews.dart';
import 'package:bikersworld/screen/workshop/view_mechanics.dart';
import 'package:bikersworld/screen/workshop/register_workshop.dart';
import 'package:bikersworld/screen/workshop/add_workshop_picture.dart';

WorkshopDashboardModel data;
var image;
class WorkshopDashboard extends StatefulWidget {
  @override
  _WorkshopDashboardState createState() => _WorkshopDashboardState();

}

class _WorkshopDashboardState extends State<WorkshopDashboard> {

  static final String WORKSHOP_COLLECTION = "workshop";
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
            color: Colors.orange,
            fontSize: 22,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
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
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection(WORKSHOP_COLLECTION).doc(_firebaseUser.uid).get(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasData && snapshot.data.exists){
            image = snapshot.data.get('image');
            data = WorkshopDashboardModel.fromJson(snapshot.data.data(),snapshot.data.reference.id);
            //print('${snapshot.data.data()}');
             return Dashboard();
           }
          else if(snapshot.hasData && !snapshot.data.exists){
            return Center(
              child: Text("You Don't Have A Workshop Registered"),
            );
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
            Column(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: 260,
                      width: double.infinity,
                      color: Color(0XFF012A4A),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 180),
                            child: FlatButton(
                              child: Positioned(
                                bottom: -190,
                                child:  CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  radius: 78,
                                  child: CircleAvatar(
                                    backgroundImage: image != null ? NetworkImage(image) : AssetImage("assets/avatar.jpg"),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0XFF012A4A),
                                        radius: 17,
                                        child: Icon(
                                          FontAwesomeIcons.camera,
                                          color: Colors.white,
                                          size: 13,
                                        ),
                                      ),
                                    ),
                                    radius: 75,
                                  ),
                                ),
                              ),
                              onPressed: (){
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
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
                                          Visibility(
                                            visible: data.imageURL == null ? true : false,
                                            child: FlatButton(
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
                                          ),
                                          Visibility(
                                            visible:data.imageURL != null ? true:false,
                                            child: FlatButton(
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
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopProfilePhoto()));

                                              },
                                            ),
                                          ),
                                          Visibility(
                                            visible:data.imageURL != null ? true:false,
                                            child: FlatButton(
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
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    ),
//                    SizedBox(
//                      child: FlatButton(
//                        child: CircleAvatar(
//                          radius: 85.0,
//                          backgroundColor: Colors.white,
//                          child:  CircleAvatar(
//                            backgroundImage: image != null ? NetworkImage(image) : AssetImage("assets/avatar.jpg"),
//                            child: Align(
//                              alignment: Alignment.bottomRight,
//                              child: CircleAvatar(
//                                backgroundColor: Colors.red,
//                                radius: 8,
//                                child: Icon(
//                                  FontAwesomeIcons.camera,
//                                ),
//                              ),
//                            ),
//                            radius: 38.0,
//                          ),
//                        ),
//                        onPressed: (){
//                          showModalBottomSheet<void>(
//                            context: context,
//                            builder: (BuildContext context) {
//                              return Container(
//                                height: 320,
//                                color: Color(0xffe8e8e8),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 15, top:15),
//                                      child: Text(
//                                        "Select Option",
//                                        style: GoogleFonts.quicksand(
//                                          fontSize: 20,
//                                          color: Colors.black,
//                                          fontWeight: FontWeight.bold,
//                                        ),
//                                      ),
//                                    ),
//                                    SizedBox(height: 15,),
//                                    Visibility(
//                                      visible: data.imageURL == null ? true : false,
//                                      child: FlatButton(
//                                        child: Padding(
//                                          padding: const EdgeInsets.only(left:15),
//                                          child: Container(
//                                            child: Row(
//                                              children: [
//                                                CircleAvatar(
//                                                  child: Icon(
//                                                    FontAwesomeIcons.image,
//                                                    color: Color(0XFF012A4A),
//                                                  ),
//                                                  backgroundColor: Color(0xffd6d6d6),
//                                                ),
//                                                SizedBox(width:20),
//                                                Text(
//                                                  "Upload Photo",
//                                                  style: GoogleFonts.quicksand(
//                                                    fontSize: 18,
//                                                    color: Colors.black,
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                        onPressed: (){
//                                          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopProfilePhoto()));
//                                        },
//                                      ),
//                                    ),
//                                    Visibility(
//                                      visible:data.imageURL != null ? true:false,
//                                      child: FlatButton(
//                                        child: Padding(
//                                          padding: const EdgeInsets.only(left:15, top:15),
//                                          child: Container(
//                                            child: Row(
//                                              children: [
//                                                CircleAvatar(
//                                                  child: Icon(
//                                                    FontAwesomeIcons.images,
//                                                    color: Colors.orangeAccent,
//                                                  ),
//                                                  backgroundColor: Color(0xffd6d6d6),
//
//                                                ),
//                                                SizedBox(width:20),
//                                                Text(
//                                                  "Update Photo",
//                                                  style: GoogleFonts.quicksand(
//                                                    fontSize: 18,
//                                                    color: Colors.black,
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                        onPressed: (){
//                                          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopProfilePhoto()));
//
//                                        },
//                                      ),
//                                    ),
//                                    Visibility(
//                                      visible:data.imageURL != null ? true:false,
//                                      child: FlatButton(
//                                        child: Padding(
//                                          padding: const EdgeInsets.only(left:15, top:15),
//                                          child: Container(
//                                            child: Row(
//                                              children: [
//                                                CircleAvatar(
//                                                  child: Icon(
//                                                    FontAwesomeIcons.minus,
//                                                    color: Colors.red,
//                                                  ),
//                                                  backgroundColor: Color(0xffd6d6d6),
//                                                ),
//                                                SizedBox(width:20),
//                                                Text(
//                                                  "Delete Photo",
//                                                  style: GoogleFonts.quicksand(
//                                                    fontSize: 18,
//                                                    color: Colors.black,
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                        onPressed: (){
//                                          deleteImage();
//                                        },
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              );
//                            },
//                          );
//                        },
//                      ),
//                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10, left:20),
                    child: Padding(
                      padding: const EdgeInsets.only(top:10,),
                      child: SizedBox(
                        width: 210.0,
                        height: 50.0,
                        child: AutoSizeText(
                          data.shopTitle,
                          style: GoogleFonts.quicksand(
                            color: Colors.white70,
                            fontWeight:FontWeight.bold,
                            fontSize: 25,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:60,left:20),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.userTie, color: Colors.white70,size: 20,),
                                  SizedBox(width: 20,),
                                  SizedBox(
                                    width: 210.0,
                                    height: 20.0,
                                    child: AutoSizeText(
                                      data.ownerName,
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 15,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.mapMarkerAlt, color: Colors.white70,size: 20,),
                                  SizedBox(width: 20,),
                                  SizedBox(
                                    width: 210.0,
                                    height: 20.0,
                                    child: AutoSizeText(
                                      data.area,
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.phone, color: Colors.white70,size: 20,),
                                  SizedBox(width: 20,),
                                  SizedBox(
                                    width: 210.0,
                                    height: 20.0,
                                    child: AutoSizeText(
                                      data.ownerContact,
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
                                      maxLines: 2,
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
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left:10, right:12, top: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                              title: new Text("Working hours", style: GoogleFonts.quicksand(fontSize: 18 , fontWeight:FontWeight.bold),),
                              content: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.orange,
                                        size: 30,
                                      ),
                                      SizedBox(width: 10,),

                                      Text(
                                        data.openTime,
                                        style: GoogleFonts.quicksand(
                                          fontSize:18,
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        "-"
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        data.closeTime,
                                        style: GoogleFonts.quicksand(
                                          fontSize:18,
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top:5),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Time",
                              style: GoogleFonts.quicksand(
                                fontSize:17,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ),
                    ),


                    FlatButton(
                      onPressed: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc){
                              return SingleChildScrollView(
                                child: Container(
                                  child: new Wrap(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top:15, left:15),
                                        child: Text(
                                          "Working Days",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Container(
                                          child: Row(
                                            children: [
                                              Text("Monday", style: GoogleFonts.quicksand(fontSize: 20, ),),                                          ],
                                          ),
                                        ),
                                        leading: data.monday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,
                                        ),

                                      ),
                                      ListTile(
                                        title: Container(
                                          child: Row(
                                            children: [
                                              Text("Tuesday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                            ],
                                          ),
                                        ),
                                        leading: data.tuesday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                      ),
                                      ListTile(
                                        title: Container(
                                          child: Row(
                                            children: [
                                              Text("Wednesday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                            ],
                                          ),
                                        ),
                                        leading: data.wednesday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                      ),
                                      ListTile(
                                        title: Container(
                                          child: Row(
                                            children: [
                                              Text("Thursday", style: GoogleFonts.quicksand(fontSize: 20, ),),

                                            ],
                                          ),
                                        ),

                                        leading: data.thursday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                      ),
                                      ListTile(
                                        title: Container(
                                          child: Row(
                                            children: [
                                              Text("Friday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                            ],
                                          ),
                                        ),
                                        leading: data.friday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                      ),
                                      ListTile(
                                        title: Container(
                                          child: Row(
                                            children: [
                                              Text("Saturday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                            ],
                                          ),
                                        ),
                                        leading: data.saturday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                      ),
                                      ListTile(
                                        title: Container(
                                          child: Row(
                                            children: [
                                              Text("Sunday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                            ],
                                          ),
                                        ),

                                        leading: data.sunday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                      ),

                                      SizedBox(height: 20,),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:5),
                              child: Icon(
                                FontAwesomeIcons.calendar,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Calender",
                              style: GoogleFonts.quicksand(
                                fontSize:16,
                                color: Colors.white,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMechanics(workshopId: data.id,)));
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

            SizedBox(height: 10,),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopDashboardReviews(id: data.id,)));
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
