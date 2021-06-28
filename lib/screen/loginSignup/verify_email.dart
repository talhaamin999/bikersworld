import 'dart:async';
import 'package:bikersworld/widgets/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/user_role_option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifyEmail extends StatefulWidget {
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  final _firebaseAuth = FirebaseAuth.instance;
  Timer _timer;
  bool _isEmailVerified = false;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
     checkEmailVerfied();
    });
    super.initState();
  }
  Future<void> checkEmailVerfied() async{
    User _user = _firebaseAuth.currentUser;
    await _user.reload();
    if(_user.emailVerified){
      _timer.cancel();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GenericOptionScreen()));
    }
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery.of(context).size.width * .5,
                    child: BezierContainer()
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/email.png",
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Verify',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 27,
                                    color: Color(0xfff7892b),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' Email',
                                      style: GoogleFonts.quicksand(
                                        fontSize: 27,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]
                                  ,),
                              ),

                              SizedBox(height: 30,),
                              Text("Verification Email Send To ${_firebaseAuth.currentUser.email}",
                                style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  color: Colors.black,

                                )
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black,
                            ),
                          ),
                          Text('Back',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
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

/*
 Text("Verification Email Send To ${_firebaseAuth.currentUser.email}"),*/

