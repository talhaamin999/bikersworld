import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RefineRearchPage extends StatefulWidget {
  @override
  _RefineRearchPageState createState() => _RefineRearchPageState();
}

class _RefineRearchPageState extends State<RefineRearchPage> {
  bool HighLow = false;
  bool LowHigh = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF012A4A),
        iconTheme: IconThemeData(
          color: Color(0xfffbb448),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          "Refine your Search",
          style: GoogleFonts.quicksand(
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:15),
            child: Center(
              child: Text(
                "Reset",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20, left: 20),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 25,
                        ),
                        radius: 20,
                        backgroundColor: Color(0xffe3e3e3),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Location",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(left:65, top: 15, right: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width -20,
                    height: 50,
                    color: Color(0xffe3e3e3),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.only(top:20, left: 20),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                          child: Icon(
                              FontAwesomeIcons.tag,
                            color: Colors.black,
                            size: 17,
                          ),
                        radius: 20,
                        backgroundColor: Color(0xffe3e3e3),
                      ),
                      SizedBox(width: 20,),
                      Text(
                          "Price Range (PKR)",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width -20,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left:55),
                  child: Row(
                    children: [
                      Container(
                          width: 130,
                          child: TextField(
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey[800]),
                                hintText: "Min",
                                fillColor: Color(0xffe3e3e3)),
                          )
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "to",
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                          width: 130,
                          child: TextField(
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey[800]),
                                hintText: "Max",
                                fillColor: Color(0xffe3e3e3)),
                          )
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:20, left: 20),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          FontAwesomeIcons.sort,
                          color: Colors.black,
                          size: 22,
                        ),
                        radius: 20,
                        backgroundColor: Color(0xffe3e3e3),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Sort",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:60),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: HighLow,
                            onChanged: (bool value) {
                              setState(() {
                                HighLow = value;
                              });
                            },
                          ),
                          Text("High to low",
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: LowHigh,
                            onChanged: (bool value) {
                              setState(() {
                                LowHigh = value;
                              });
                            },
                          ),
                          Text("Low to high",
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            FlatButton(
              onPressed: (){
               // print("filter button");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width-70,
                  height:60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Color(0XFF012A4A),  width: 2),
                    color: Color(0XFF012A4A),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.filter, color: Colors.white,),
                      SizedBox(width: 5,),
                      Text("Apply filter",
                        style: GoogleFonts.quicksand(fontSize: 15, color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}