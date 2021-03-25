import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bikersworld/screen/dashboard/normalUser/workshopDashboard.dart';
import 'package:bikersworld/widgets/search_text_field.dart';
import 'package:bikersworld/widgets/diaload_box.dart';

class workshopSearchPage extends StatefulWidget {
  @override
  _workshopSearchPageState createState() => _workshopSearchPageState();
}

enum search { City, Name }


class _workshopSearchPageState extends State<workshopSearchPage> {
  search _character = search.Name;

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
    iconTheme: IconThemeData(color: Color(0xfffbb448),
           ),
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
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
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffe8e8e8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 22, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Result 2",
                          style: GoogleFonts.varelaRound(
                            fontSize: 15,

                          ),
                        ),
                      ),
                      SizedBox(width: 90,),
                      FlatButton(
                        onPressed: (){
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 280,
                                color: Color(0xffe8e8e8),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          "Refine Your Search",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      RadioListTile<search>(
                                        title: const Text('Search By Name'),
                                        value: search.Name,
                                        groupValue: _character,
                                        onChanged: (search value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: const Text('Search By City'),
                                        value: search.City,
                                        groupValue: _character,
                                        onChanged: (search value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        },
                                      ),
                                      SizedBox(height: 15,),
                                      Center(
                                        child: FlatButton(
                                          onPressed: (){
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
                                                "Submit",
                                                style: GoogleFonts.raleway(
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              );
                            },
                          );
                        },
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Filter",
                                style: GoogleFonts.varelaRound(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Icon(
                                  FontAwesomeIcons.filter,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Search Result", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),

              SizedBox(height: 20,),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => normalUserWorkshopDashboard()));

                },
                child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 110,
                            child: Image(
                              image: AssetImage("assets/workshop1.webp"),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Automotive Repair",
                                     style: GoogleFonts.quicksand(
                                       fontSize: 18,
                                     ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Text(
                                    "Islamabad",
                                    style: TextStyle(
                                      fontSize: 15
                                    ),
                                  ),
                                ),

                                SizedBox(height: 3,),

                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        "OPEN",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
