import 'package:bikersworld/model/workshop_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';

class NormalUserWorkshopEmployeeProfile extends StatefulWidget {

  final Mechanics data;
  NormalUserWorkshopEmployeeProfile({@required this.data});

  @override
  _NormalUserWorkshopEmployeeProfileState createState() => _NormalUserWorkshopEmployeeProfileState();
}

class _NormalUserWorkshopEmployeeProfileState extends State<NormalUserWorkshopEmployeeProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20,top: 20),
                      child: CircleAvatar(
                        backgroundColor:Colors.orange,
                        radius: 55,
                        child: CircleAvatar(
                          radius:50,
                          backgroundColor: Color(0xff012a4a),
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              widget.data != null ? widget.data.name : "Ibtasam Ur Rehman",
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              widget.data != null ? widget.data.contact : "03355437782",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              widget.data != null ? widget.data.speciality : "Electrican",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5,),
                            RatingsBar(20),

                            SizedBox(height: 10,),
                            FlatButton(

                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xffedb97e),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(FontAwesomeIcons.edit,color: Colors.white, size: 20,),
                                    SizedBox(width: 10,),
                                    Text("Review", style: GoogleFonts.quicksand(fontSize: 18,color: Colors.white),),
                                  ],
                                ),
                              ),
                              onPressed: (){

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:30,top: 20),
                child: Text(
                  "Reviews",
                  style: GoogleFonts.varelaRound(
                    fontSize:22,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:15,right:15),
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
                          SizedBox(height: 5,),
                          Text(
                            'Ibtasam ur Rehman',
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5,),
                          RatingsBar(18),
                          SizedBox(height: 5,),
                          Text(
                            'Good question you are very good question',
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
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
