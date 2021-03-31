import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BottomModalSheet extends StatefulWidget {
  @override
  _BottomModalSheetState createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  bool Monday = false;
  bool Tuesday = false;
  bool Wednesday = false;
  bool Thursday = false;
  bool Friday = false;
  bool Saturday = false;
  bool Sunday = false;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: FlatButton(
        height: 50,
        minWidth: MediaQuery.of(context).size.width,
        color: Color(0xfff3f3f4),
        child: Text(
          'Working Days',
          style: GoogleFonts.quicksand(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 330,
                color: Color(0xfff3f3f4),
                child:Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(
                    'Select working days',
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: Monday,
                                  onChanged: (bool value) {
                                    setState(() {
                                      Monday = value;
                                    });
                                  },
                                ),
                                Text("Monday" ,style: GoogleFonts.quicksand(fontSize: 16),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: Tuesday,
                                    onChanged: (bool value) {
                                      setState(() {
                                        Tuesday = value;
                                      });
                                    },
                                  ),
                                  Text("Tuesday",style: GoogleFonts.quicksand(fontSize: 16),),
                                ],
                              ),
                            ),
                            SizedBox(width: 40,),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: Wednesday,
                                  onChanged: (bool value) {
                                    setState(() {
                                      Wednesday = value;
                                    });
                                  },
                                ),
                                Text("Wednesday" ,style: GoogleFonts.quicksand(fontSize: 16),),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: Thursday,
                                  onChanged: (bool value) {
                                    setState(() {
                                      Thursday = value;
                                    });
                                  },
                                ),
                                Text("Thursday",style: GoogleFonts.quicksand(fontSize: 16),),
                              ],
                            ),
                            SizedBox(width: 40,),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: Friday,
                                  onChanged: (bool value) {
                                    setState(() {
                                      Friday = value;
                                    });
                                  },
                                ),
                                Text("Friday" ,style: GoogleFonts.quicksand(fontSize: 16),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:40),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: Saturday,
                                    onChanged: (bool value) {
                                      setState(() {
                                        Saturday = value;
                                      });
                                    },
                                  ),
                                  Text("Saturday",style: GoogleFonts.quicksand(fontSize: 16),),
                                ],
                              ),
                            ),
                            SizedBox(width: 40,),

                          ],
                        ),
                      ),


                      Row(
                        children: [
                          Checkbox(
                            value: Wednesday,
                            onChanged: (bool value) {
                              setState(() {
                                Wednesday = value;
                              });
                            },
                          ),
                          Text("Wednesday",style: GoogleFonts.quicksand(fontSize: 16),),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                      Center(
                        child: FlatButton(
                          color: Colors.orange,
                          child: Text(
                            'Submit',
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: (){

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


