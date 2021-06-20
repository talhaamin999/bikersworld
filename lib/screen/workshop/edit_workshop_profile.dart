import 'package:bikersworld/model/workshop_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/postAdTextfield.dart';

class EditWorkshopProfile extends StatefulWidget {
  WorkshopDashboardModel worksopData;
  EditWorkshopProfile({@required this.worksopData});
  @override
  _EditWorkshopProfileState createState() => _EditWorkshopProfileState();
}

class _EditWorkshopProfileState extends State<EditWorkshopProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'BIKERSWORLD',
              style: GoogleFonts.quicksand(
                color: Colors.orange,
                fontSize: 18,
              ),
            ),
            backgroundColor: Color(0XFF012A4A),
            leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.white,),
              onPressed:() => Navigator.pop(context),
            )
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:15, left: 30, bottom: 20),
                child: Container(
                  child:RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Update',
                      style: GoogleFonts.quicksand(
                        fontSize: 30,
                        color: Color(0xfff7892b),
                      ),
                      children: [
                        TextSpan(
                            text: ' Profile',
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
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.home),
                    postAdTextfield("Workshop Name"),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.mapMarkerAlt),
                    postAdTextfield("Specific Area"),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.city),
                    postAdTextfield("City"),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Text('Owner Information' ,style: GoogleFonts.quicksand(fontSize: 15),),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.userTie),
                    postAdTextfield("Owner Name"),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.phone),
                    postAdTextfield("Contact Number"),
                  ],
                ),
              ),

              SizedBox(height: 40,),
              Container(
                child: FlatButton(
                  onPressed: (){
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
                      'Update Profile',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );

  }
}
