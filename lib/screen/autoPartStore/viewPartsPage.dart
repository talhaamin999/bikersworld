import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class viewPartsPage extends StatefulWidget {
  @override
  _viewPartsPageState createState() => _viewPartsPageState();
}


class _viewPartsPageState extends State<viewPartsPage>
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
                    text: "Electrical",
                    icon: Icon(FontAwesomeIcons.lightbulb),
                  ),
                  Tab(
                    text: "Mechanical",
                    icon: Icon(FontAwesomeIcons.cogs),
                  ),
                  Tab(
                    text: "Others",
                    icon: Icon(FontAwesomeIcons.wrench),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            electricalTab(),
            mechanicalTab(),
            othersTab(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class electricalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 25, top: 25),
            alignment: Alignment.topLeft,
            child: Text("Electical Parts", style: GoogleFonts.quicksand(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            ),
          ),
          SizedBox(height: 20,),
          Card(
            child: Column(
              children: <Widget>[
                _buildCard("Head Light", "2000", "assets/headlight.png", false, false, context),
                _buildCard("Halogen Light", "2000", "assets/helogin.jpeg", true, false, context),
                _buildCard('Bike Silencer', 'Rs. 1500', 'assets/silencer.jpg', false, true, context),

              ],
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}

class mechanicalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 25, top: 25),
            alignment: Alignment.topLeft,
            child: Text("Mechaical Parts", style: GoogleFonts.quicksand(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            ),
          ),
          SizedBox(height: 20,),
          Card(
            child: Column(
              children: <Widget>[
                _buildCard("Disc Brake", "2000", "assets/discbrake.jpeg", false, false, context),
                _buildCard("Bike Rims", "2000", "assets/alyrim.jpeg", true, false, context),
                _buildCard("Tank", "2000", "assets/tank.jpeg", false, true, context),

              ],
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}


class othersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 25, top: 25),
            alignment: Alignment.topLeft,
            child: Text("Other Accessories", style: GoogleFonts.quicksand(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            ),
          ),
          SizedBox(height: 20,),
          Card(
            child: Column(
              children: <Widget>[
                _buildCard("Tire", "2000", "assets/part3.jpeg", false, false, context),
                _buildCard("Spray kit", "2000", "assets/p4.jpeg", true, false, context),
                _buildCard('Flamingo Polish', 'Rs. 1500', 'assets/p2.jpeg', true, false, context),
                _buildCard('Wheel Cleaner', 'Rs. 1500', 'assets/p3.jpeg', false, false, context),

              ],
            ),
          ),
          SizedBox(height: 30,),
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
    return RatingBar.builder(
      initialRating: 4,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
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








Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
    child: InkWell(
      onTap: () {
//        Navigator.of(context).push(
//          MaterialPageRoute(builder: (context) => partDetail(
//              assetPath: imgPath,
//              partprice:price,
//              partname: name
//          ),
//          ),
//        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white
        ),
        child: Row(
          children: [
            Hero(
              tag: imgPath,
              child: Container(
                height: 115.0,
                width: 145.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    price,
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10,),
                  ratingBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

