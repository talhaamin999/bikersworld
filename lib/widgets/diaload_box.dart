import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


showDialogFunc(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 350,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Workshop Information",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    color: Color(0XFF012A4A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 25,),
                            Text(
                              "",
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.warehouse),
                            SizedBox(width: 25,),
                            Text(
                              "",
                              style:  GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.city),
                            SizedBox(width: 25,),
                            Text(
                              "",
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.mapMarkedAlt),
                            SizedBox(width: 25,),
                            Text(
                              "",
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.phone),
                            SizedBox(width: 25,),
                            Text(
                              "",
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.bottomRight,
                  child: FlatButton.icon(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),

                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),


                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}