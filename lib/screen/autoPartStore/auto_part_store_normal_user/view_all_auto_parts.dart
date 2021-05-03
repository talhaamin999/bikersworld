import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';


class ViewAllAutoParts extends StatefulWidget {
  @override
  _ViewAllAutoPartsState createState() => _ViewAllAutoPartsState();
}

class _ViewAllAutoPartsState extends State<ViewAllAutoParts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
          iconTheme: IconThemeData(color: Color(0xfffbb448)),
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.orange,
              )
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:25,top: 15),
                  child: Container(
                    child: Text(
                      "All Auto Parts",
                      style:GoogleFonts.quicksand(
                        fontSize: 23,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: FlatButton(
                    onPressed:(){

                    },
                    child: Card(
                      color: Color(0xfff7f7f7),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/alyrim.jpeg"),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: AutoSizeText(
                                      "Plug",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Body and Frame",
                                            style: TextStyle(
                                                fontSize: 18,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 65,),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xffb8b8b8),
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
      ),
    );
  }
}
