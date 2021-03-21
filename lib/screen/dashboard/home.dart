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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffe8e8e8),
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
                        child: TextField(
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50),
                                  ),
                                ),
                                filled: true,
                                hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                                hintText: "Search Anything",
                                prefixIcon: Icon(Icons.search, size: 25,),
                                fillColor: Colors.white),
                          ),
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
                        padding: const EdgeInsets.only(top:10),
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
                    height: 320,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => workshopSearchPage()));
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
    );
  }
}
