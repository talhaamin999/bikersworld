import 'package:bikersworld/services/toast_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';


class ForgotPassword extends StatefulWidget {

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {

    final _emailController = TextEditingController();
    final height = MediaQuery.of(context).size.height;
    final _error = ToastErrorMessage();
    final _firebaseAuth = FirebaseAuth.instance;

   Future<void> resetPassword() async{
      if(_emailController.text.isNotEmpty){
         await _firebaseAuth.sendPasswordResetEmail(email: _emailController.text.trim());
         Navigator.of(context).pop();
      }else{
        _error.errorToastMessage(errorMessage: 'Enter Your Email');
      }
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'FORGET',
                          style: GoogleFonts.quicksand(
                            fontSize: 25,
                            color: Color(0xfff7892b),
                          ),
                          children: [
                            TextSpan(
                              text: ' PASSWORD',
                              style: GoogleFonts.quicksand(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ]
                          ,),
                      ),

                      SizedBox(height: 40,),

                      Container(
                        child: Center(
                          child: Text(
                            "No Worries! Enter you email and we will send you a reset.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Email',
                              style: GoogleFonts.quicksand(
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),

                      FlatButton(
                        onPressed: (){
                          resetPassword();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xfffbb448), Color(0xfff7892b),
                              ],
                            ),
                          ),
                          child: Text(
                            'Send Request',
                            style: GoogleFonts.quicksand(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),


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
                            fontSize: 12,
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
