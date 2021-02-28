import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bikersworld/screen/dashboard/normalUser/mechanicsReviewNormalUser.dart';
import 'package:bikersworld/screen/dashboard/normalUser/reviews/reviewsNormalUser.dart';

class normalUserWorkshopDashboard extends StatefulWidget {
  @override
  _normalUserWorkshopDashboardState createState() => _normalUserWorkshopDashboardState();
}


class _normalUserWorkshopDashboardState extends State<normalUserWorkshopDashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
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
                  Tab(
                    text: "Services",
                    icon: Icon(FontAwesomeIcons.tools),
                  )
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            informationTab(),
            ReviewTab(),
            services(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class informationTab extends StatelessWidget {
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
                        text: 'Workshop',
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
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text(
              "Mecahnics",
              style: GoogleFonts.quicksand(
                fontSize: 20,
              ),
            ),
          ),
          FlatButton(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xffecf0f1),
                    child: Icon(FontAwesomeIcons.user, color: Color(0xffc4040e),),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              child: Text(
                                "Hasham Ur Rehman",
                                style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        child: Text(
                          "03355437782",
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ratingBar(),
                    ],
                  ),
                ),
              ),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => mechanicsReviewsNormalUser()));
            },
          ),

          FlatButton(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xffecf0f1),
                    child: Icon(FontAwesomeIcons.user, color: Color(0xffc4040e),),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              child: Text(
                                "Hasham Ur Rehman",
                                style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        child: Text(
                          "03355437782",
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ratingBar(),
                    ],
                  ),
                ),
              ),
            ),
            onPressed: (){
            },
          ),
          FlatButton(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xffecf0f1),
                    child: Icon(FontAwesomeIcons.user, color: Color(0xffc4040e),),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              child: Text(
                                "Hasham Ur Rehman",
                                style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        child: Text(
                          "03355437782",
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ratingBar(),
                    ],
                  ),
                ),
              ),
            ),
            onPressed: (){
            },
          ),

          SizedBox(height: 30,),
          Container(
            child: FlatButton(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xfffbb448), Color(0xfff7892b),
                    ],
                  ),
                ),
                child: Text(
                  'Add Reviews',
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => reviewFromUser()));
              },
            ),
          ),
          SizedBox(height: 20,),

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

class services extends StatefulWidget {
  @override
  _servicesState createState() => _servicesState();
}

class _servicesState extends State<services> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
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
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text(
                    "Mechnical",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et d at volutpat . Blandit libero volutpat sed cras ornare arcu dui. ",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: Color(0xffecf0f1),
                child: Icon(FontAwesomeIcons.bolt, color: Color(0xFF2980b9),),
              ),
              title:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Electrical",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et d at volutpat . Blandit libero volutpat sed cras ornare arcu dui. ",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: Color(0xffecf0f1),
                child: Icon(FontAwesomeIcons.oilCan, color: Color(0xff2ecc71),),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Oil and Tuning",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et d at volutpat . Blandit libero volutpat sed cras ornare arcu dui. ",
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
    );
  }
}


class ratingBar extends StatelessWidget {
  const ratingBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35),
      child: RatingBar.builder(
        initialRating: 4,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 15,
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
          size: 5.0,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}


