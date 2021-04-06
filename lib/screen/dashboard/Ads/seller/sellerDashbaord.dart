import 'package:flutter/material.dart';
import 'package:bikersworld/screen/dashboard/Ads/AdDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bikersworld/screen/dashboard/normalUser/reviews/reviewsNormalUser.dart';

class sellerDashboard extends StatefulWidget {
  @override
  _sellerDashboardState createState() => _sellerDashboardState();
}


class _sellerDashboardState extends State<sellerDashboard>
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
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 23,),
              alignment: Alignment.topLeft,
              child: Text("Seller Dashboard", style: GoogleFonts.quicksand(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),),
            ),
            SizedBox(height: 10,),

            divider("Seller Information"),

            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0Xff024070),
                  borderRadius: BorderRadius.only(
                    topLeft:  const  Radius.circular(10.0),
                    topRight: const  Radius.circular(10.0),
                    bottomLeft:  const  Radius.circular(10.0),
                    bottomRight: const  Radius.circular(10.0),
                  ),
                ),

                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.user , color: Colors.white, size: 20,),
                            SizedBox(width: 10,),
                            Text(
                              "Ibtasam",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height:10),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.phone , color: Colors.white, size: 20,),
                            SizedBox(width: 10,),
                            Text(
                              "0335544882",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.locationArrow , color: Colors.white, size: 20,),
                            SizedBox(width: 10,),
                            Text(
                              "Islamabad",
                              style: GoogleFonts.montserrat(
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
            ),

            SizedBox(height: 40,),

            divider("Your Advertisements"),

            Container(
              child: Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdDetail()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 310,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 30,
                              child: Card(
                                child: Wrap(
                                  children: <Widget>[
                                    Center(
                                      child: Image(
                                        image: AssetImage('assets/bike.jpeg'),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Honda",
                                        style: GoogleFonts.nunito(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "CD - 125",
                                            style: GoogleFonts.nunito(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "View More ",
                                            style: GoogleFonts.nunito(
                                              fontSize: 18,
                                              color: Colors.indigo,
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
                    SizedBox(
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),

      drawer: drawer(),
    );
  }
}

class divider extends StatelessWidget {
  divider(this.text);
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(text ,style: GoogleFonts.quicksand(fontSize: 15),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
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
