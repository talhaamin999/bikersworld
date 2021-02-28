import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


class ToastErrorMessage {

  String errorMessage;

  ToastErrorMessage({errorMsg, @required this.errorMessage});

  void errorToastMessage(){

    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}

class ToastValidMessage {

  String validMessage;

  ToastValidMessage({errorMsg, @required this.validMessage});

  void validToastMessage(){

    Fluttertoast.showToast(
        msg: validMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}