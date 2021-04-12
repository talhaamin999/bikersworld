import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bikersworld/screen/autoPartStore/registerAutoParts.dart';
import 'package:bikersworld/screen/autoPartStore/viewPartsPage.dart';

class AutoPartStoreDashboardOwner extends StatefulWidget {
  @override
  _AutoPartStoreDashboardOwnerState createState() => _AutoPartStoreDashboardOwnerState();
}


class _AutoPartStoreDashboardOwnerState extends State<AutoPartStoreDashboardOwner>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0XFF012A4A),

              title: Text('Bikers World',
                style: GoogleFonts.quicksand(
                    fontSize: 20
                ),
              ),
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Information",
                    icon: Icon(FontAwesomeIcons.infoCircle),
                  ),
                  Tab(
                    text: "Reviews",
                    icon: Icon(FontAwesomeIcons.commentAlt),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            InformationTab(),
            ReviewTab(),
          ],
          controller: _tabController,
        ),
      ),
      drawer: Drawer(),
    );
  }
}

class InformationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0Xff024070),
                borderRadius: BorderRadius.only(
                  topLeft:  const  Radius.circular(20.0),
                  topRight: const  Radius.circular(20.0),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Seghal Motors",
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height:10),
                    Text(
                      "03355478556",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            "Islamabad",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 60,
              color: Color(0XFF012A4A),
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Status",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "OPEN",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child:Center(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Part Store',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: ' Review',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                color: Colors.black,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "4.0",
                    style: GoogleFonts.hindSiliguri(
                      fontSize: 35,
                    ),
                  ),
                ),
                Container(
                  child: RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 5.0,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 23,),
                  alignment: Alignment.topLeft,
                  child: Text("Auto Parts", style: GoogleFonts.quicksand(
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
                        child: Icon(FontAwesomeIcons.cogs, color: Color(0xffc4040e),),
                      ),
                      title: Text("Add Auto Parts"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => registerAutoParts()));
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 23,),
                  alignment: Alignment.topLeft,
                  child: Text("Views Parts", style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: Color(0xffecf0f1),
                        child: Icon(FontAwesomeIcons.eye, color: Colors.black,),
                      ),
                      title: Text("View  Parts"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => viewPartsPage()));
                      },
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

                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30,),
            alignment: Alignment.topLeft,
            child: Text("Customer Reviews", style: GoogleFonts.quicksand(
              color: Colors.black,
              fontSize: 22,
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
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Color(0xffecf0f1),
                  child: Icon(FontAwesomeIcons.user, color: Color(0xfff7892b),),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Sardar Liaqat",
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 50,
                      child:RatingBar.builder(
                        initialRating: 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    SizedBox(height: 5,),

                    Container(
                      child: Text(
                        "Excellent work done by sardar liaqat very well harding qorking person. Am really much impressed may god bless you INSHALLAH ",
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

          SizedBox(height: 30,),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Color(0xffecf0f1),
                  child: Icon(FontAwesomeIcons.user, color: Color(0xfff7892b),),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Ammar Ahmad",
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 50,
                      child:RatingBar.builder(
                        initialRating: 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    SizedBox(height: 5,),

                    Container(
                      child: Text(
                        "Excellent work done by sardar liaqat very well harding qorking person. Am really much impressed may god bless you INSHALLAH ",
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


        ],
      ),
    );
  }
}
