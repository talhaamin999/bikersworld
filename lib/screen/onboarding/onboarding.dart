import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:google_fonts/google_fonts.dart';


class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding>{

  @override
  void initState(){
   super.initState();
   Timer(Duration(seconds: 3), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdf8e33),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
        RichText(
        textAlign: TextAlign.center,
          text: TextSpan(
              text: 'BIKERS',
              style: GoogleFonts.quicksand(
                fontSize: 40,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                    text: ' WORLD',
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 40,
                    )
                ),

              ]),
        ),
            SizedBox(height: 70,),
            SpinKitHourGlass(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
