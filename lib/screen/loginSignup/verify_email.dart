import 'dart:async';

import 'package:bikersworld/screen/dashboard/home.dart';
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
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                child: Text("Verification Email Send To ${_firebaseAuth.currentUser.email}"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

