import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/screen/dashboard/normalUser/reviews/reviews_normal_user.dart';

class autoPartStoreDashboardPage  extends StatefulWidget {
  @override
  _autoPartStoreDashboardPageState createState() => _autoPartStoreDashboardPageState();
}


class _autoPartStoreDashboardPageState extends State<autoPartStoreDashboardPage >
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
              leading:  IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
                onPressed:() => Navigator.pop(context),
              )
              ,
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Dashboard",
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
            autoPartStoreDashboardTab(),
            autoPartStoreDashboardReviewTab(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class autoPartStoreDashboardTab extends StatelessWidget {
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
                      "General Auto",
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
                        text: 'Auto Part Store',
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
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text(
              "AutoParts",
              style: GoogleFonts.quicksand(
                fontSize: 20,
              ),
            ),
          ),

          SizedBox(height: 20,),
          divider("Electrical Parts"),
          Container(
            height: 210.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildCard('Head Lights', 'Rs. 1500', 'assets/headlight.png', false, false, context),
                _buildCard('Halogin Lights', 'Rs. 1500', 'assets/helogin.jpeg', true, false, context),
                _buildCard('Bike Silencer', 'Rs. 1500', 'assets/silencer.jpg', true, false, context),

              ],
            ),
          ),

          SizedBox(height: 20,),
          divider("Mechanical Parts"),
          Container(
            height: 210.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildCard('Alyrim', 'Rs. 1500', 'assets/alyrim.jpeg', false, false, context),
                _buildCard('Bike Tank', 'Rs. 1500', 'assets/tank.jpeg', true, false, context),
                _buildCard('Disc Brake', 'Rs. 1500', 'assets/discbrake.jpeg', true, false, context),

              ],
            ),
          ),


          SizedBox(height: 20,),
          divider("Oil and Tuning Parts"),
          Container(
            height: 210.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildCard('Polish Kit', 'Rs. 1500', 'assets/p4.jpeg', false, false, context),
                _buildCard('Flamingo Polish', 'Rs. 1500', 'assets/p2.jpeg', true, false, context),
                _buildCard('Wheel Cleaner', 'Rs. 1500', 'assets/p3.jpeg', false, false, context),
                _buildCard('Polish Kit', 'Rs. 1500', 'assets/p1.jpeg', true, false, context),

              ],
            ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewFromUser()));
              },
            ),
          ),

          SizedBox(height: 20,),
        ],
      ),
    );
  }
}


class autoPartStoreDashboardReviewTab extends StatelessWidget {
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
    return Container(
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



class divider extends StatelessWidget {

  String text;

  divider(this.text);

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
          Text(text, style: GoogleFonts.quicksand(fontSize: 15),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),

        ],
      ),
    );
  }
}






Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Container(
    margin: EdgeInsets.only(left: 20),
    child: Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => partDetail(
                assetPath: imgPath,
                partprice:price,
                partname: name
            ),
            ),
          );
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
          child: Column(children: [
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
            SizedBox(height: 5),
            Text(price,
              style: TextStyle(
                  color: Color(0xfff7892b),
                  fontSize: 17),
            ),
            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Container(
                      child: Text(name,
                        style: TextStyle(
                          color: Color(0xFF575E67),
                          fontSize: 16,
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
  );
}



class partDetail extends StatelessWidget {
  final assetPath, partprice, partname;

  partDetail({this.assetPath, this.partprice, this.partname});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'BIKERSWORLD',
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            backgroundColor: Color(0XFF012A4A),
            leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
              onPressed:() => Navigator.pop(context),
            )        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30,),
              Container(
                child:Center(
                  child: Image(
                    image: AssetImage(assetPath),
                    height: 200,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  partprice,
                  style: GoogleFonts.raleway(
                    fontSize: 20.0,
                    color: Color(0xFFF17532),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Container(
                margin: EdgeInsets.only(left: 20),
                child:  Text(
                  partname,
                  style: GoogleFonts.raleway(
                    fontSize: 20.0,
                    color: Color(0xFF575E67),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child:  Text(
                  "Description",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Color(0xFF575E67),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud v',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Part by: ",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF575E67),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      child: Text(
                        "General Autos",
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          color: Color(0xFF575E67),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Part Review",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF575E67),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 35,
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
