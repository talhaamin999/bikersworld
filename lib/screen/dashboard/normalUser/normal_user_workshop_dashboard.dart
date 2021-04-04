import 'package:bikersworld/model/workshop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/dashboard/normalUser/view_mechanics_normal_user.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class NormalUserWorkshopDashboard extends StatefulWidget {
  final WorkshopDashboardModel workshopData;
  NormalUserWorkshopDashboard({@required this.workshopData});
  @override
  _NormalUserWorkshopDashboardState createState() => _NormalUserWorkshopDashboardState();
}

class _NormalUserWorkshopDashboardState extends State<NormalUserWorkshopDashboard> {
  int _selectedItemIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdbdbdb),
      appBar: AppBar(
        leading: FlatButton(
            onPressed: () {
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
      body: SafeArea(
        child: Column(
          children: <Widget>[

            Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                color: Color(0XFF012A4A),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: widget.workshopData.imageURL != null ? NetworkImage(widget.workshopData.imageURL): AssetImage("assets/avatar.jpg"),
                          ),
                          SizedBox(width:10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.workshopData != null ? widget.workshopData.shopTitle : 'Workshop name',
                                style: GoogleFonts.quicksand(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    widget.workshopData != null ? widget.workshopData.city : 'City',
                                    style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    widget.workshopData != null ? widget.workshopData.ownerContact: 'Owner contact',
                                    style: GoogleFonts.quicksand(
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(top:40),
                      child: Align(
                        alignment: const Alignment(1.0, 1.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 10.0,
                          child: OverflowBox(
                            maxWidth: MediaQuery.of(context).size.width - 20,
                            minHeight: 0.0,
                            maxHeight: 120,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    bottomLeft: Radius.circular(10),
                                  )
                              ),
                              child: Row(
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:20, left: 8,bottom: 20),
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
                        ),
                      ),
                    ),

                  ],
                )
            ),
            SizedBox(height: 70,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  child: VerticalTabs(
                    backgroundColor: Colors.orange,
                    tabsWidth: 70,
                    tabs: <Tab>[
                      Tab(child: Padding(
                        padding: const EdgeInsets.only(top:10,left: 15,right: 15,  bottom: 15),
                        child: Icon(FontAwesomeIcons.cogs , color: Color(0XFF012A4A)),
                      )),
                      Tab(child: Padding(
                        padding: const EdgeInsets.only(top:10,left: 15,right: 15,  bottom: 15),
                        child: Icon(FontAwesomeIcons.user, color: Color(0XFF012A4A)),
                      )),
                      Tab(child: Padding(
                        padding: const EdgeInsets.only(top:10,left: 15,right: 15,  bottom: 15),
                        child: Icon(FontAwesomeIcons.eye , color: Color(0XFF012A4A),),
                      )),


                    ],
                    contents: <Widget>[
                      Container(
                          color: Color(0xfff0f0f0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Service",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 100,
                                  height: 110,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    color: Colors.white,
                                    elevation: 3,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(width: 5,),
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Color(0XFF012A4A),
                                          backgroundImage: AssetImage("assets/service_avatar.jpg"),
                                        ),
                                        SizedBox(width: 20,),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),

                      Container(
                        color: Color(0xfff0f0f0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Mechanics",
                                style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:5),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 100,
                                height: 90,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  color: Colors.white,
                                  elevation: 3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 15,),
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Color(0XFF012A4A),
                                        child: Icon(FontAwesomeIcons.user),
                                      ),
                                      SizedBox(width: 20,),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        color: Color(0xfff0f0f0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Reviews",
                                style: GoogleFonts.quicksand(
                                  fontSize: 20,
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
            ),

          ],
        ),
      ),
    );
  }

}

Widget tabsContent(String caption, [ String description = '' ] ) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(20),
    color: Color(0XFF012A4A),
    child: Column(
      children: <Widget>[
        Text(
          caption,
          style: TextStyle(fontSize: 25),
        ),
        Divider(height: 20, color: Colors.black45,),
        Text(
          description,
          style: TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ],
    ),
  );
}


/*
*   Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "", style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(FontAwesomeIcons.home , size: 18, color: Colors.grey,),
                                                    SizedBox(width: 10,),
                                                    Container(
                                                      child: AutoSizeText(
                                                        "",
                                                        style: GoogleFonts.quicksand(
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.location_on, size: 19, color: Colors.grey,),
                                                    SizedBox(width: 10,),
                                                    Text("",style: GoogleFonts.quicksand(fontSize: 16),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(FontAwesomeIcons.dollarSign, size: 17, color: Colors.grey,),
                                                    SizedBox(width: 10,),
                                                    Text("",style: GoogleFonts.quicksand(fontSize: 16),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),*/