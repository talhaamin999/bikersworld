import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WarningPopUp{

   Future<bool> getWarning(BuildContext context,TextEditingController option){
    return Alert(
      context: context,
      type: AlertType.warning,
      title: "Warning",
      desc: "Are you sure you want to delete it...",
      buttons: [
        DialogButton(
          color: Colors.indigo,
          width: 120,
          child: Text(
            "Cancel",
            style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            option.text = "cancel";
            Navigator.of(context,rootNavigator: true).pop();
          },
        ),
        DialogButton(
            width: 120,
            child: Text(
              "Confirm",
              style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              option.text = 'ok';
              Navigator.of(context, rootNavigator: true).pop();
            }
        )
      ],
    ).show();
  }

}