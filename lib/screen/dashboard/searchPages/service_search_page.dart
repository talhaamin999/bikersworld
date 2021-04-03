import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';


class ServiceSearcPage extends StatefulWidget {
  @override
  _ServiceSearcPageState createState() => _ServiceSearcPageState();
}

class _ServiceSearcPageState extends State<ServiceSearcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
                ),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left:20,right:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Result",
                            style: GoogleFonts.varelaRound(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RefineRearchPage()));
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
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 150,
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
                        radius: 40,
                        backgroundColor: Color(0XFF012A4A),
                        backgroundImage: AssetImage("assets/service_avatar.jpg"),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Wheel Bearing', style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.home , size: 18, color: Colors.grey,),
                                  SizedBox(width: 10,),
                                  Text("Mohsin Autoplex",style: GoogleFonts.quicksand(fontSize: 16),),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, size: 19, color: Colors.grey,),
                                  SizedBox(width: 10,),
                                  Text("Islamabad",style: GoogleFonts.quicksand(fontSize: 16),),
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.dollarSign, size: 17, color: Colors.grey,),
                                  SizedBox(width: 10,),
                                  Text("200",style: GoogleFonts.quicksand(fontSize: 16),),
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
      ),
    );
  }
}
