import 'package:bikersworld/model/workshop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/dashboard/normalUser/view_mechanics_normal_user.dart';

class NormalUserWorkshopDashboard extends StatefulWidget {

  final WorkshopDashboardModel workshopData;
  NormalUserWorkshopDashboard({@required this.workshopData});

  @override
  _NormalUserWorkshopDashboardState createState() => _NormalUserWorkshopDashboardState();
}

class _NormalUserWorkshopDashboardState extends State<NormalUserWorkshopDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
              child: Icon(
                Icons.arrow_back,
                color: Colors.orange,
              )
          ),
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
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0XFF012A4A),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:5),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: widget.workshopData.imageURL != null ? NetworkImage(widget.workshopData.imageURL): AssetImage("assets/avatar.jpg"),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.5,
                            child: AutoSizeText(
                              widget.workshopData != null ? widget.workshopData.shopTitle : 'Workshop name',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                      children: [
                                        Icon(Icons.location_on, size: 30, color: Colors.grey,),
                                        Text(
                                          widget.workshopData != null ? widget.workshopData.city : 'Workshop City',
                                          style: GoogleFonts.quicksand(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                                SizedBox(height:10),
                                Container(
                                  child: Row(
                                      children: [
                                        Icon(Icons.phone, size: 25, color: Colors.grey, ),
                                        Text(
                                          widget.workshopData !=null ? widget.workshopData.ownerContact : 'Owner Contact',
                                          style: GoogleFonts.quicksand(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]
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
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 8,
                        color:Colors.orange,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:10),
                              child: Text(
                                "WORKSHOP",
                                style: GoogleFonts.mukta(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10),
                              child: Text(
                                "Dashboard",
                                style: GoogleFonts.varelaRound(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:25),
              FlatButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                      title: new Text("Information", style: GoogleFonts.quicksand(fontSize: 18 , fontWeight:FontWeight.bold),),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(width: 15,),
                        Icon(
                            Icons.info, size: 70 , color: Color(0XFF012A4A)
                        ),
                        SizedBox(width: 20,),
                        Text(
                            'Shop Information', style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width - 5,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMechanicsNormalUser()));
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                      FontAwesomeIcons.user,
                                    size: 60,
                                    color: Color(0XFF012A4A),
                                  ),
                                  SizedBox(height: 15,),
                                  Text(
                                    "Mechanics",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: (){

                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.cogs,
                                    size: 60,
                                    color: Color(0XFF012A4A),
                                  ),
                                  SizedBox(height: 15,),
                                  Text(
                                    "Services",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 16,
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
            ],
          ),
        ),
      ),
    );
  }
}