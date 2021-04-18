import 'package:bikersworld/screen/autoPartStore/Auto%20Part%20Store%20Normal%20User/autoPartStoreDashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class partDetail extends StatelessWidget {
  final assetPath, partprice, partname , partCateogry , partStauts , partType;

  partDetail({this.assetPath, this.partprice, this.partname , this.partCateogry , this.partStauts, this.partType});
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
            )
        ),
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
                child:Row(
                  children: [
                    Text(
                      "Price",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF575E67),
                      ),
                    ),
                    SizedBox(width:60),
                    Text(
                      partprice,
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        color: Color(0xFFF17532),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Container(
                margin: EdgeInsets.only(left: 20),
                child:Row(
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF575E67),
                      ),
                    ),
                    SizedBox(width:50),
                    Text(
                      partname,
                      style: GoogleFonts.raleway(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child:Row(
                  children: [
                    Text(
                      "Category",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF575E67),
                      ),
                    ),
                    SizedBox(width:20),
                    Text(
                        partCateogry,
                      style: GoogleFonts.raleway(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child:Row(
                  children: [
                    Text(
                      "Part Type",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF575E67),
                      ),
                    ),
                    SizedBox(width:15),
                    Text(
                      partType,
                      style: GoogleFonts.raleway(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                margin: EdgeInsets.only(left: 20),
                child:Row(
                  children: [
                    Text(
                      "Status",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF575E67),
                      ),
                    ),
                    SizedBox(width:45),
                    Text(
                      partStauts,
                      style: GoogleFonts.raleway(
                        fontSize: 20.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:10),

              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Part by ",
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
                        "    Shegal Motor Star",
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
              Container(
                  child: Center(child: ratingBar())
              ),

              Container(
                margin: EdgeInsets.only(left: 20 , top: 20),
                child:  Text(
                  "Reviews",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Color(0xFF575E67),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:10,right:10, top: 10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            leading: CircleAvatar(
                              backgroundColor: Color(0xffecf0f1),
                              child: Icon(FontAwesomeIcons.user, color: Colors.indigo,),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Ibtasam Ur Rehman",
                                  style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height:10),
                                Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                ratingBarReviews(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            leading: CircleAvatar(
                              backgroundColor: Color(0xffecf0f1),
                              child: Icon(FontAwesomeIcons.user, color: Colors.indigo,),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hasnain Hayat",
                                  style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height:10),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                ratingBarReviews(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            leading: CircleAvatar(
                              backgroundColor: Color(0xffecf0f1),
                              child: Icon(FontAwesomeIcons.user, color: Colors.indigo,),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ibtasam Ur Rehman",
                                  style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height:10),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                ratingBarReviews(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            leading: CircleAvatar(
                              backgroundColor: Color(0xffecf0f1),
                              child: Icon(FontAwesomeIcons.user, color: Colors.indigo,),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hasnain Hayat",
                                  style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height:10),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                ratingBarReviews(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => autoPartStoreDashboardPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Color(0xFFF17532)
                          ),
                          child: Center(
                              child: Text('Visit Store',
                                style: GoogleFonts.quicksand(
                                    fontSize: 20.0,
                                    color: Colors.white
                                ),
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
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

class ratingBarReviews extends StatelessWidget {
  const ratingBarReviews({
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
      itemSize: 25,
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
