import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

//
//class OnBoarding extends StatefulWidget {
//  @override
//  _OnBoardingState createState() => _OnBoardingState();
//}
//
//class _OnBoardingState extends State<OnBoarding>{
//
//  @override
//  void initState(){
//   super.initState();
//   //Timer(Duration(seconds: 3), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDashboard())));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0xffdf8e33),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//        RichText(
//        textAlign: TextAlign.center,
//          text: TextSpan(
//              text: 'BIKERS',
//              style: GoogleFonts.quicksand(
//                fontSize: 40,
//                color: Colors.white,
//              ),
//              children: [
//                TextSpan(
//                    text: ' WORLD',
//                    style: GoogleFonts.quicksand(
//                      color: Colors.black,
//                      fontSize: 40,
//                    )
//                ),
//
//              ]),
//        ),
//            SizedBox(height: 70,),
//            SpinKitHourGlass(
//              color: Colors.black,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//

//
//class OnBoarding extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
////    Timer(Duration(milliseconds: 2500), () {
////      Navigator.push(
////          context,
////          MaterialPageRoute(
////            builder: (ctx) => HomeDashboard(),
////          ));
////    });
//
//    return Scaffold(
//      backgroundColor:Colors.white,
//      body: Container(
//        child: Center(
//          child: Column(
//            //crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(
//                "WELCOME",
//                style: GoogleFonts.quicksand(
//                  fontSize: 26,
//                  color: Color(0XFF012A4A),
//                ),
//              ),
//             SizedBox(height: 40,),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "BIKERS",
//                     style: GoogleFonts.quicksand(
//                       fontSize: 22,
//                       color: Color(0XFF012A4A),
//                     ),
//                   ),
//                   SizedBox(width: 5,),
//                   Text(
//                     "WORLD",
//                     style: GoogleFonts.quicksand(
//                       fontSize: 22,
//                       color: Color(0XFF012A4A),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//              SizedBox(height: 160,),
//              LinearPercentIndicator(
//                alignment: MainAxisAlignment.center,
//                width: 240.0,
//                lineHeight: 4.0,
//                animation: true,
//                percent: 1.0,
//                animationDuration: 2250,
//                backgroundColor: Color(0XFF012A4A),
//                progressColor: Colors.orange,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

//
//class OnBoarding extends StatefulWidget {
//  @override
//  _OnBoardingState createState() => _OnBoardingState();
//}
//
//class _OnBoardingState extends State<OnBoarding> {
//  @override
//  void initState(){
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//
//    return Scaffold(
//      body: Container(
//        child: Stack(
//          children: <Widget>[
//            Positioned(top: 0, left: 0, child: CurvedLeftShadow()),
//            Positioned(top: 0, left: 0, child: CurvedLeft()),
////            Positioned(bottom: 0, left: 0, child: CurvedRightShadow()),
////            Positioned(bottom: 0, left: 0, child: CurvedRight()),
//            Positioned(
//              bottom: 20,
//              left: 20,
//              child: Container(
//                height: 70,
//                width: MediaQuery.of(context).size.width - 40,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(20),
//                  gradient: LinearGradient(
//                    begin: Alignment.topLeft,
//                    end: Alignment.bottomRight,
//                    colors: [
//                      Color(0xfffbb448),
//                      Color(0xfff7892b),
//                    ],
//                  ),
//                ),
//                child: Center(
//                  child: Text(
//                    "Let's Get Started !",
//                    style: GoogleFonts.quicksand(
//                      fontSize:22,
//                      color: Color(0XFF012A4A),
//                    ),
//                  ),
//                ),
//              ),
//            ),
////            Center(
////              child: Column(
////                mainAxisAlignment: MainAxisAlignment.center,
////                crossAxisAlignment: CrossAxisAlignment.center,
////                children: <Widget>[
////                  SizedBox(height: 100,),
////                  Text(
////                    "WELCOME",
////                    style: GoogleFonts.quicksand(
////                      fontSize: 40,
////                      color: Color(0XFF012A4A),
////                    ),
////                  ),
////                  SizedBox(height: 50,),

////
////                  SizedBox(height: 70,),
////
////                ],
////              ),
////            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//

//
//class LoadingScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
////    Timer(Duration(milliseconds: 2500), () {
////      Navigator.push(
////          context,
////          MaterialPageRoute(
////            builder: (ctx) => HomeDashboard(),
////          ));
////    });
//
//
//    return Scaffold(
//      body: Container(
//        child: Stack(
//          children: [
//            Positioned(top: 0, left: 0, child: CurvedLeftShadow()),
//            Positioned(top: 0, left: 0, child: CurvedLeft()),
//
//            Container(
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Container(
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          "BIKERS",
//                          style: GoogleFonts.quicksand(
//                            fontSize: 35,
//                            color: Color(0XFF012A4A),
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                        SizedBox(width: 5,),
//                        Text(
//                          "WORLD",
//                          style: GoogleFonts.quicksand(
//                            fontSize: 35,
//                            color: Colors.orange,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  SizedBox(height: 60,),
//                  LinearPercentIndicator(
//                    alignment: MainAxisAlignment.center,
//                    width: 300.0,
//                    lineHeight: 7.0,
//                    animation: true,
//                    percent: 1.0,
//                    animationDuration: 3000,
//                    backgroundColor: Color(0XFF012A4A),
//                    progressColor: Colors.orange,
//                  )
//                ],
//              ),
//            ),
//            Positioned(bottom: 0, left: 0, child: CurvedRightShadow()),
//            Positioned(bottom: 0, left: 0, child: CurvedRight()),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class CurvedLeftShadow extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//
//    return Container(
//      child: ClipPath(
//        clipper: LeftShadowClipper(),
//        child: Container(
//          height: 320.0,
//          width: size.width,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//              begin: Alignment.topLeft,
//              end: Alignment.bottomRight,
//              colors: [
//                Color.fromRGBO(243, 169, 95, 0.3),
//                Color.fromRGBO(235, 101, 91, 0.3)
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class LeftShadowClipper extends CustomClipper<Path> {
//  @override
//  Path getClip(Size size) {
//    Path path = Path();
//
//    path.lineTo(0, 0);
//    path.lineTo(0, size.height - 10);
//    path.quadraticBezierTo(35, size.height - 10, 45, size.height - 50);
//    path.quadraticBezierTo(90, 90, size.width - 120, 80);
//    path.quadraticBezierTo(size.width, 70, size.width, 25);
//    path.lineTo(size.width, 0);
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) {
//    return false;
//  }
//}
//
//
//
//class CurvedLeft extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    return Container(
//      child: ClipPath(
//        clipper: LeftClipper(),
//        child: Container(
//          height: 300.0,
//          width: size.width,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//              begin: Alignment.topLeft,
//              end: Alignment.bottomRight,
//              colors: [
//                Color(0xfffbb448),
//                Color(0xfff7892b),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class LeftClipper extends CustomClipper<Path> {
//  @override
//  Path getClip(Size size) {
//    Path path = Path();
//
//    path.lineTo(0, 0);
//    path.lineTo(0, size.height);
//    path.quadraticBezierTo(30, size.height, 40, size.height - 40);
//    path.quadraticBezierTo(80, 80, size.width - 120, 70);
//    path.quadraticBezierTo(size.width, 60, size.width, 0);
//    path.lineTo(size.width, 0);
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) {
//    return false;
//  }
//}
//
//
//class CurvedRightShadow extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//
//    return Container(
//      child: ClipPath(
//        clipper: RightShadowClipper(),
//        child: Container(
//          height: 270.0,
//          width: size.width,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//              begin: Alignment.bottomLeft,
//              end: Alignment.topRight,
//              colors: [
//                Color.fromRGBO(86, 201, 251, 0.3),
//                Color.fromRGBO(76, 170, 251, 0.3)
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class RightShadowClipper extends CustomClipper<Path> {
//  @override
//  Path getClip(Size size) {
//    Path path = Path();
//
//    path.lineTo(20, size.height);
//    path.quadraticBezierTo(
//      40,
//      size.height - 35,
//      130,
//      size.height - 47,
//    );
//    path.quadraticBezierTo(
//      size.width - 60,
//      size.height - 90,
//      size.width - 25,
//      40,
//    );
//    path.quadraticBezierTo(
//      size.width - 10,
//      0,
//      size.width,
//      0,
//    );
//    path.lineTo(size.width, size.height);
//    path.lineTo(20, size.height);
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) {
//    return true;
//  }
//}
//
//
//
//class CurvedRight extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//
//    return Container(
//      child: ClipPath(
//        clipper: RightClipper(),
//        child: Container(
//          height: 250.0,
//          width: size.width,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//              begin: Alignment.bottomLeft,
//              end: Alignment.topRight,
//              colors: [
//                Color(0XFF2A5470),
//                Color(0xff4C4177),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class RightClipper extends CustomClipper<Path> {
//  @override
//  Path getClip(Size size) {
//    Path path = Path();
//
//    path.lineTo(35, size.height);
//    path.quadraticBezierTo(
//      40,
//      size.height - 25,
//      110,
//      size.height - 35,
//    );
//    path.quadraticBezierTo(
//      size.width - 60,
//      size.height - 70,
//      size.width - 19,
//      35,
//    );
//    path.quadraticBezierTo(
//      size.width - 10,
//      0,
//      size.width,
//      0,
//    );
//    path.lineTo(size.width, size.height);
//    path.lineTo(35, size.height);
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) {
//    return false;
//  }
//}


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  SpinKitSquareCircle spinkit;

  @override
  void initState() {
    super.initState();

    spinkit = SpinKitSquareCircle(
      color: Color(0XFF244661),
      size: 120.0,
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000)),
    );

    Future.delayed(const Duration(seconds: 10), () async {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomeDashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      backgroundColor: Color(0xff042A4E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            spinkit,
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BIKERS",
                    style: GoogleFonts.quicksand(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    "WORLD",
                    style: GoogleFonts.quicksand(
                      fontSize: 30,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
