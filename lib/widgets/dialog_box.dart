import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlertBox extends StatefulWidget {
  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Center(child: Icon(FontAwesomeIcons.exclamationCircle, color: Colors.red, size: 50,)),
                content: Text("Price is high do you want to continue..." ,style: GoogleFonts.varelaRound(fontSize: 20,),),
                actions: <Widget>[
                  Container(
                      child: Row(
                        children: [
                          FlatButton(
                            onPressed: (){
                              //
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
                              //
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
                                  "Done",
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
              ),
            );
          },
          child: Text("Alert box"),
        ),
      ),
    );
  }
}
