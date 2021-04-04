import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/loginSignup/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:bikersworld/screen/dashboard/Ads/postAdsSeller.dart';
import 'package:bikersworld/screen/dashboard/searchPages/ads_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autopart_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/auto_partstore_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/workshop_search_page.dart';


class findMore extends StatefulWidget {
  @override
  _findMoreState createState() => _findMoreState();
}

class _findMoreState extends State<findMore> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:SingleChildScrollView(
          child:Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(

              children: <Widget>[
                _title(),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child:Text(
                    "Our Products",
                    style: GoogleFonts.quicksand(
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  color: Color(0xffededed),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      FlatButton(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              leading: CircleAvatar(
                                backgroundColor: Color(0xffecf0f1),
                                child: Icon(FontAwesomeIcons.building, color: Colors.redAccent,),
                              ),
                              title:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Find Auto Part Store"),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => autoPartStoreSearchPage()));
                        },
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
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              leading: CircleAvatar(
                                backgroundColor: Color(0xffecf0f1),
                                child: Icon(FontAwesomeIcons.store, color: Color(0xffe88c1c),),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Find Workshops"),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),

                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopSearchPage()));
                        },
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
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              leading: CircleAvatar(
                                backgroundColor: Color(0xffecf0f1),
                                child: Icon(FontAwesomeIcons.ad, color: Color(0xff1b2c75),),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Find Ads"),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),

                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => adSearchPage()));
                        },
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
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              leading: CircleAvatar(
                                backgroundColor: Color(0xffecf0f1),
                                child: Icon(FontAwesomeIcons.tools, color: Colors.teal,),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Find Auto Parts"),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),

                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartSearchPage()));
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50,),
                Container(
                  child:  FlatButton(
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
                        'Back',
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 30,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget _title() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'BIKERS',
        style: GoogleFonts.quicksand(
          fontSize: 40,
          color: Color(0xfff7892b),
        ),
        children: [
          TextSpan(
              text: 'WORLD',
              style: GoogleFonts.quicksand(
                color: Color(0xffdf8e33).withAlpha(100),
                fontSize: 40,
              )
          ),

        ]),
  );
}
