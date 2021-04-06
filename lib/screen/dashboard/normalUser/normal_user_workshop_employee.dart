import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/dashboard/normalUser/normal_user_workhop_employee_profile.dart';

class NormalUserWorkshopEmployee extends StatefulWidget {
  @override
  _NormalUserWorkshopEmployeeState createState() => _NormalUserWorkshopEmployeeState();
}

class _NormalUserWorkshopEmployeeState extends State<NormalUserWorkshopEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'BIKERSWORLD',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0XFF012A4A),
        iconTheme: IconThemeData(color: Color(0xfffbb448)),
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.orange,
            )
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:15, top:15),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Workshop',
                    style: GoogleFonts.quicksand(
                      fontSize: 30,
                      color: Color(0xfff7892b),
                    ),
                    children: [
                      TextSpan(
                          text: ' Mechanics',
                          style: GoogleFonts.quicksand(
                            fontSize: 30,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NormalUserWorkshopEmployeeProfile()));
              },
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ibtasam ur Rehman',
                          style: GoogleFonts.quicksand(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
//                      SizedBox(height: 5,),
//                      Text(
//                        '+92 313-0141046',
//                        style: GoogleFonts.quicksand(
//                          fontSize: 16.0,
//                          color: Colors.grey,
//                        ),
//                      ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
