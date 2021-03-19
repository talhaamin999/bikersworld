import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class WorkshopStatus extends StatefulWidget {
  @override
  _WorkshopStatusState createState() => _WorkshopStatusState();
}

class _WorkshopStatusState extends State<WorkshopStatus> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'BIKERSWORLD',
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            backgroundColor: Color(0XFF012A4A),
            leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
              onPressed:() => Navigator.pop(context),
            )
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    child:RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Workshop',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: ' Status',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                color: Colors.black,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:20, left: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 125,
                          child: LiteRollingSwitch(
                            value: true,
                            textOn: 'OPEN',
                            textOff: 'CLOSE',
                            colorOn: Colors.greenAccent[700],
                            colorOff: Colors.redAccent[700],
                            iconOn: Icons.done,
                            iconOff: Icons.remove_circle_outline,
                            textSize: 16.0,
                            onChanged: (bool state) {
//Use it to manage the different states
                              print('Current State of SWITCH IS: $state');
                            },
                          ),
                        ),
                        SizedBox(width: 50,),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: _StatusWidget(),
                  ),
                ),

                SizedBox(height: 20,),
                FlatButton(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 15,right: 15),
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
                            colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                    child: Text(
                      'Back',
                      style: GoogleFonts.krub(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),

                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




Widget _entryField(String title,)
{
  final _formKey = GlobalKey<FormState>();

  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            title,
            style: GoogleFonts.quicksand(
              fontSize: 18,
            )
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Color(0xfff3f3f4),
            filled: true,
          ),

        ),
      ],
    ),
  );
}


Widget _StatusWidget() {
  return Column(
    children: <Widget>[
      _entryField("To"),
      SizedBox(height:15,),
      _entryField("From"),
    ],
  );
}
