import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/auto_part_ptore_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/loginSignup/login_page.dart';
import 'package:bikersworld/screen/loginSignup/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'dart:async';

class CurvedLeftShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: ClipPath(
        clipper: LeftShadowClipper(),
        child: Container(
          height: 320.0,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(243, 169, 95, 0.3),
                Color.fromRGBO(235, 101, 91, 0.3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeftShadowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 10);
    path.quadraticBezierTo(35, size.height - 10, 45, size.height - 50);
    path.quadraticBezierTo(90, 90, size.width - 120, 80);
    path.quadraticBezierTo(size.width, 70, size.width, 25);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}



class CurvedLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ClipPath(
        clipper: LeftClipper(),
        child: Container(
          height: 300.0,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xfffbb448),
                Color(0xfff7892b),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(30, size.height, 40, size.height - 40);
    path.quadraticBezierTo(80, 80, size.width - 120, 70);
    path.quadraticBezierTo(size.width, 60, size.width, 0);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class CurvedRightShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: ClipPath(
        clipper: RightShadowClipper(),
        child: Container(
          height: 270.0,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(86, 201, 251, 0.3),
                Color.fromRGBO(76, 170, 251, 0.3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RightShadowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(20, size.height);
    path.quadraticBezierTo(
      40,
      size.height - 35,
      130,
      size.height - 47,
    );
    path.quadraticBezierTo(
      size.width - 60,
      size.height - 90,
      size.width - 25,
      40,
    );
    path.quadraticBezierTo(
      size.width - 10,
      0,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(20, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}



class CurvedRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: ClipPath(
        clipper: RightClipper(),
        child: Container(
          height: 250.0,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0XFF012A4A),
                Color(0xff4e4376),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(35, size.height);
    path.quadraticBezierTo(
      40,
      size.height - 25,
      110,
      size.height - 35,
    );
    path.quadraticBezierTo(
      size.width - 60,
      size.height - 70,
      size.width - 19,
      35,
    );
    path.quadraticBezierTo(
      size.width - 10,
      0,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(35, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  CurvedLeftShadow(),
                  CurvedLeft(),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BIKERS",
                    style: GoogleFonts.quicksand(
                      fontSize: 26,
                      color: Color(0XFF012A4A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    "WORLD",
                    style: GoogleFonts.quicksand(
                      fontSize: 26,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30,),
            FadeAnimation(
              1.3,
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xfffbb448),
                        Color(0xfff7892b),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.quicksand(
                        fontSize: 21,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            FadeAnimation(1.3,
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Color(0xff585859), width: 2),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.quicksand(
                        fontSize: 21,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

/*
* Positioned(
              top: 170,
              left: 100,
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "BIKERS",
                      style: GoogleFonts.quicksand(
                        fontSize:30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "WORLD",
                      style: GoogleFonts.quicksand(
                        fontSize:30,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
