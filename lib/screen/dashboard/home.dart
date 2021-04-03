import 'package:bikersworld/screen/dashboard/workshop/workshopGrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:flutter/rendering.dart';
import 'package:bikersworld/screen/dashboard/findMorePage.dart';
import 'package:bikersworld/screen/dashboard/Autopart/partGrid.dart';
import 'package:bikersworld/screen/dashboard/searchPages/workshopSearchPage.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autoPartSearchPage.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autoPartStoreSearchPage.dart';
import 'package:bikersworld/screen/dashboard/Ads/AdDetail.dart';
import 'package:bikersworld/screen/dashboard/searchPages/adsSearchPage.dart';
import 'package:bikersworld/screen/loginSignup/signup.dart';
import 'package:bikersworld/screen/dashboard/AutoPartStore/autoPartStoreGrid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/search_text_field.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeDashboard extends StatefulWidget {
  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard>  with SingleTickerProviderStateMixin {
  int currentIndex;
  int activeIndex = 0;
  TextEditingController _textFieldController = new TextEditingController();


  TabController _tabController;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    _tabController = TabController(length: 1, vsync: this);
  }
  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),// left side
      appBar: new AppBar(
        backgroundColor: Color(0XFF012A4A),
        title: new Text("Bikers World", style: GoogleFonts.quicksand(fontSize: 20, color: Colors.orange),),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0XFF012A4A),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20 , left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: new TextField(
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20),
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle: new TextStyle(color: Colors.grey),
                                  hintText: "Type in your text",
                                  fillColor: Color(0xffe6e6e6),
                                  suffixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:15, top: 20),
                                    child: Container(
                                      height: 50,
                                      width: 8,
                                      color:Colors.orange,
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:10, top: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "TRENDING NOW",
                                            style: GoogleFonts.mukta(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:0),
                                            child: Text(
                                              "Find the best we have",
                                              style: GoogleFonts.varelaRound(
                                                fontSize: 16,
                                                color: Colors.grey,
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      height: 340,
                      child: Padding(
                        padding: const EdgeInsets.only(left:10, top:10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              width: 300,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Image(
                                          image: AssetImage(
                                            "assets/1.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Karawasai Ninja",
                                        style: GoogleFonts.varelaRound(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    rating(),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(
                                                FontAwesomeIcons.adn,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width:20),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Modal",
                                                    style: GoogleFonts.mukta(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "H2",
                                                    style: GoogleFonts.varelaRound(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Year",
                                                    style: GoogleFonts.mukta(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "2020",
                                                    style: GoogleFonts.varelaRound(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                    "Make",
                                                    style: GoogleFonts.mukta(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Karasaki",
                                                    style: GoogleFonts.varelaRound(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
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

                            SizedBox(width: 30,),
                            Container(
                              width: 300,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Image(
                                          image: AssetImage(
                                            "assets/1.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Karawasai Ninja H2",
                                        style: GoogleFonts.varelaRound(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    rating(),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(
                                                FontAwesomeIcons.adn,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width:20),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Modal",
                                                    style: GoogleFonts.mukta(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "H2",
                                                    style: GoogleFonts.varelaRound(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Year",
                                                    style: GoogleFonts.mukta(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "2020",
                                                    style: GoogleFonts.varelaRound(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                    "Make",
                                                    style: GoogleFonts.mukta(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Karasaki",
                                                    style: GoogleFonts.varelaRound(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
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
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top:15),
              child: Container(
                height: 485,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20, top:10),
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:15, top: 20),
                              child: Container(
                                height: 50,
                                width: 8,
                                color:Colors.orange,
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:10, top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CATEGOEIRS",
                                      style: GoogleFonts.mukta(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:0),
                                      child: Text(
                                        "Find the best work you want",
                                        style: GoogleFonts.varelaRound(
                                          fontSize: 16,
                                          color: Colors.grey,
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
                    SizedBox(height: 25,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 35,

                            height: 80,
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
                                    radius: 20,
                                    backgroundColor: Color(0XFF012A4A),
                                    child: Icon(FontAwesomeIcons.ad , color: Colors.white),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Advertisements', style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height:12),
                          Container(
                            width: MediaQuery.of(context).size.width - 35,

                            height: 80,
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
                                    radius: 20,
                                    backgroundColor: Color(0XFF012A4A),
                                    child: Icon(FontAwesomeIcons.home , color: Colors.white),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Workshop', style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height:12),

                          Container(
                            width: MediaQuery.of(context).size.width - 35,

                            height: 80,
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
                                    radius: 20,
                                    backgroundColor: Color(0XFF012A4A),
                                    child: Icon(Icons.speed, color: Colors.white) ,
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Auto Parts', style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height:12),

                          Container(
                            width: MediaQuery.of(context).size.width - 35,

                            height: 80,
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
                                    radius: 20,
                                    backgroundColor: Color(0XFF012A4A),
                                    child: Center(child: Icon(FontAwesomeIcons.store , color: Colors.white)),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Auto Stors', style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                                        ),
                                      ],
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
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height:155,
              color: Color(0XFF012A4A),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Bikers World",
                              style:GoogleFonts.quicksand(
                                fontSize: 28,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Find the best ads, workshop, auto parts and auto part Store",
                              style:GoogleFonts.quicksand(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
              ),
            ),

            SizedBox(height: 25,),
            Center(
              child: FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => findMore()));
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
                      "Find More",
                      style: GoogleFonts.raleway(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height:20),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height:20),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left:20, top:10),
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: Container(
                                height: 50,
                                width: 8,
                                color:Colors.orange,
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:10, top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "WORKSHOPS",
                                            style: GoogleFonts.mukta(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
//                                    SizedBox(width:90),
//                                    FlatButton(
//                                      onPressed: (){
//                                        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopSearchPage()));
//                                      },
//                                      child: Container(
//                                        margin: EdgeInsets.only(right: 55),
//                                        child: Text(
//                                          "View All",
//                                          style: GoogleFonts.quicksand(
//                                            fontSize: 18,
//                                            color: Colors.indigo,
//                                          ),
//                                        ),
//                                      ),
//                                    ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top:0),
                                      child: Text(
                                        "Find the best workshop you want",
                                        style: GoogleFonts.varelaRound(
                                          fontSize: 16,
                                          color: Colors.grey,
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
                  ),

                  SizedBox(height:20),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      height: 240,
                      child: workshopGrid(),
                    ),
                  ),
                  SizedBox(height:30),
                ],
              ),
            ),


            SizedBox(height: 20,),

            Container(
              width: double.infinity,
              height: 310,
              color: Color(0XFF012A4A),
              child: Container(
                margin: const EdgeInsets.all(25.0),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Biker World Core values",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "At BikerWorld, we believe that it is or duty to provide our visitor with the best online exprience and this is what our mission speaks for.",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      child:  FlatButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),

                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xfffbb448), Color(0xfff7892b),
                              ],
                            ),
                          ),
                          child: Text(
                            'Sign Up Now',
                            style: GoogleFonts.quicksand(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(height:30),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20, top:10),
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15, top: 20),
                            child: Container(
                              height: 50,
                              width: 8,
                              color:Colors.orange,
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left:10, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ATOPARTS",
                                    style: GoogleFonts.mukta(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:0),
                                    child: Text(
                                      "Find the best auto part",
                                      style: GoogleFonts.varelaRound(
                                        fontSize: 16,
                                        color: Colors.grey,
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

                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Container(
                      height: 220,
                      child: partGrid(),
                    ),
                  ),
                  SizedBox(height:30),
                ],
              ),
            ),


            SizedBox(height: 30,),

            Container(
              width: double.infinity,
              height: 190,
              color: Color(0XFF012A4A),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "BE THE FIRST TO KNOW",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Get all the latest information about bikes, workshop, auto store and auto parts.",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Signup for registeration",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: Colors.white,
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
          ],
        ),
      ),
      drawer: drawer(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){},
          child: Column(
            children: [
              SizedBox(height: 5,),
              Icon(FontAwesomeIcons.bicycle),
              Text(
                "Sell",
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end,
        hasNotch: true,
        hasInk: true ,
        inkColor: Colors.black12,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.build, color: Color(0xffc2c2c2)), activeIcon: Icon(Icons.build, color: Colors.red,), title: Text("Workshop")),
          BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Icon(Icons.speed, color: Color(0xffc2c2c2)), activeIcon: Icon(Icons.speed, color: Colors.deepPurple,), title: Text("AutoParts")),
          BubbleBottomBarItem(backgroundColor: Colors.indigo, icon: Icon(FontAwesomeIcons.ad, color: Color(0xffc2c2c2)), activeIcon: Icon(FontAwesomeIcons.ad, color: Colors.indigo,), title: Text("Ads")),
          BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(FontAwesomeIcons.store, color: Color(0xffc2c2c2)), activeIcon: Icon(FontAwesomeIcons.store, color: Colors.green,), title: Text("Auto Store"))
        ],
      ),
    );
  }
}


/*
* MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff7f7f7),
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
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0XFF012A4A),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 15),
                      child: Container(
                        child: SearchTextField(),
                        ),
                  )
                ),
                Container(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: Color(0xffe0e0e0),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Category",
                            style: GoogleFonts.varelaRound(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.ad,
                                            color: Color(0xffc2c2c2),
                                            size: 40,
                                          ),
                                          Text(
                                            "Adertisement",
                                            style: TextStyle(
                                              color: Color(0xffc2c2c2),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(),
                                    Container(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.build,
                                            color: Color(0xffc2c2c2),
                                            size: 40,
                                          ),
                                          Text(
                                            "Workshops",
                                            style: TextStyle(
                                              color: Color(0xffc2c2c2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height:20),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(left:13),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.speed,
                                            color: Color(0xffc2c2c2),
                                            size: 40,
                                          ),
                                          Text(
                                            "Auto Parts",
                                            style: TextStyle(
                                              color: Color(0xffc2c2c2),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(),
                                    Container(
                                      child: Column(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.store,
                                            color: Color(0xffc2c2c2),
                                            size: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: Text(
                                              "Auto Part Store",
                                              style: TextStyle(
                                                color: Color(0xffc2c2c2),
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
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  width: double.infinity,
                  height:155,
                  color: Color(0XFF012A4A),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Bikers World",
                                  style:GoogleFonts.rubik(
                                    fontSize: 28,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "Find the best ads, workshop, auto parts and auto part Store",
                                  style:GoogleFonts.quicksand(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),

                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25,),
                Center(
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => findMore()));
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
                          "Find More",
                          style: GoogleFonts.raleway(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25,),

                Container(
                  margin: const EdgeInsets.only(left:25,top: 10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Advertisements",
                          style: GoogleFonts.quicksand(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => adSearchPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 25, top: 10),
                          child: Text(
                            "View All",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdDetail()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 330,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage('assets/Ads/ad2.jpeg'),
                                    height: 220,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20 , right: 20, top: 10),
                                  child: ListTile(
                                    title: Text(
                                      "Yamaha",
                                      style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "PKR 115000",
                                          style: GoogleFonts.nunito(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Lahore |",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                " 2017 |",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(width: 5,),

                                              Text(
                                                " 100km",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
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
                        SizedBox(width: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage('assets/Ads/bike1.jpg'),
                                    height: 220,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20 , right: 20, top: 10),
                                  child: ListTile(
                                    title: Text(
                                      "Honda",
                                      style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "PKR 1.5 Lac",
                                          style: GoogleFonts.nunito(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Karachi |",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                " 2020 |",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(width: 5,),

                                              Text(
                                                " 100km",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
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
                      ],
                    ),
                  ),
                ),


                Container(
                  margin: const EdgeInsets.only(left:25,top: 10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Workshops",
                          style: GoogleFonts.quicksand(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopSearchPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 25, top: 10),
                          child: Text(
                            "View All",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: 280,
                    child: workshopGrid(),
                  ),
                ),


                SizedBox(height: 20,),

                Container(
                  width: double.infinity,
                  height: 310,
                  color: Color(0XFF012A4A),
                  child: Container(
                    margin: const EdgeInsets.all(25.0),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Biker World Core values",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "At BikerWorld, we believe that it is or duty to provide our visitor with the best online exprience and this is what our mission speaks for.",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child:  FlatButton(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),

                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Color(0xfffbb448), Color(0xfff7892b),
                                  ],
                                ),
                              ),
                              child: Text(
                                'Sign Up Now',
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left:25,top: 10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Auto Part",
                          style: GoogleFonts.quicksand(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartSearchPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 25, top: 10),
                          child: Text(
                            "View All",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: Container(
                    height: 280,
                    child: partGrid(),
                  ),
                ),


                SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.only(left:25,top: 10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Auto Part Stores",
                          style: GoogleFonts.quicksand(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => autoPartStoreSearchPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 25, top: 10),
                          child: Text(
                            "View All",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: 240,
                    child: autoPartStoreGrid(),
                  ),
                ),

                SizedBox(height: 30,),

                Container(
                  width: double.infinity,
                  height: 190,
                  color: Color(0XFF012A4A),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          "BE THE FIRST TO KNOW",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Get all the latest information about bikes, workshop, auto store and auto parts.",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                  "Signup for registeration",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color: Colors.white,
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

              ],
            ),
          ),
        ),
        drawer: drawer(),


    ),
    );*/


class rating extends StatefulWidget {
  @override
  _ratingState createState() => _ratingState();
}

class _ratingState extends State<rating> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 2,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      itemPadding: EdgeInsets.only(left:2),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );

  }
}
