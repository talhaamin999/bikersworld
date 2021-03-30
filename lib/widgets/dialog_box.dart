import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class AlertBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                title: Center(child: Icon(FontAwesomeIcons.exclamationCircle, color: Colors.red, size: 50,)),
                content: Text("Are you sure about the Service Price" ,style: GoogleFonts.varelaRound(fontSize: 20,),),
                actions: <Widget>[
                  Container(
                      child: Row(
                        children: [
                          FlatButton(
                            onPressed: (){
                              print("cancel");
                            },
                            child: Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Close",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: (){
                              print("confirm");
                            },
                            child: Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Confirm",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                ],
              );
  }
}
