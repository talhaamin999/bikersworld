import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class NormalUserWorkshopEmployee extends StatefulWidget {
  @override
  _NormalUserWorkshopEmployeeState createState() => _NormalUserWorkshopEmployeeState();
}

class _NormalUserWorkshopEmployeeState extends State<NormalUserWorkshopEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      ),
    );
  }
}
