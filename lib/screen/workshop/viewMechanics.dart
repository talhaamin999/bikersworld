import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/workshop/reviews/mechanicsReviews.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class viewMechanics extends StatefulWidget {
  @override
  _viewMechanicsState createState() => _viewMechanicsState();
}

class _viewMechanicsState extends State<viewMechanics> {
  int currentIndex;

  TextEditingController _textFieldController = new TextEditingController();
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
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
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    child:RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'View',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: 'Mechanics',
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

                SizedBox(height: 20,),

                FlatButton(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                    width: 15,
                                  ),
                                  Container(
                                    child: AutoSizeText(
                                      "Hasham Ur Rehman",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "03355437782",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => mechanicsReviews()));
                  },
                ),

                SizedBox(height: 10,),

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
                                    width: 15,
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
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "03355437782",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => mechanicsReviews()));

                  },
                ),
                SizedBox(height: 10,),


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
                                    width: 15,
                                  ),
                                  Container(
                                    child: Text(
                                      "Qasim Shah",
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
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "03355437782",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => mechanicsReviews()));

                  },
                ),

                SizedBox(height: 10,),

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
                                    width: 15,
                                  ),
                                  Container(
                                    child: Text(
                                      "Waseem khan",
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
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "03355437782",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => mechanicsReviews()));
                  },
                ),
                SizedBox(height: 30,),
                FlatButton(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 15,right: 15),
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
                            colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                    child: Text(
                      'Back',
                      style: GoogleFonts.krub(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),

                SizedBox(height: 20,),
              ],
            ),
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
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: RatingBar.builder(
        initialRating: 4,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
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


