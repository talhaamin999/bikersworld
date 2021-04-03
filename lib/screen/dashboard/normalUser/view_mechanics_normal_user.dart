import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMechanicsNormalUser extends StatefulWidget {
  @override
  _ViewMechanicsNormalUserState createState() => _ViewMechanicsNormalUserState();
}

class _ViewMechanicsNormalUserState extends State<ViewMechanicsNormalUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.orange,
              )
          ),
          title: Text("BikersWorld"),
          elevation: 0,
          backgroundColor: Color(0XFF012A4A),
          brightness: Brightness.dark,
          textTheme: TextTheme(
            title: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                 child: Row(
                   children: [
                     Text(
                       "View",
                       style: GoogleFonts.quicksand(
                         fontSize: 25,
                         color: Colors.orange
                       ),
                     ),
                     SizedBox(width: 10,),
                     Text(
                       "Mechanics",
                       style: GoogleFonts.quicksand(
                         color: Color(0XFF012A4A),
                         fontSize: 25,
                       ),
                     ),
                   ],
                 ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 100,
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
                        radius: 30,
                        backgroundColor: Color(0XFF012A4A),
                        child: Icon(
                            FontAwesomeIcons.user, size: 25 , color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Ibtasam Ur Rehman', style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                            ),
                            Text(
                              "03355437782",
                                style: GoogleFonts.quicksand(fontSize:15,color: Colors.black)
                            )
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
