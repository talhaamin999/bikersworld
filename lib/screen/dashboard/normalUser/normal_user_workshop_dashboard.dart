import 'package:bikersworld/model/workshop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/dashboard/normalUser/view_mechanics_normal_user.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NormalUserWorkshopDashboard extends StatefulWidget {
  final WorkshopDashboardModel workshopData;
  NormalUserWorkshopDashboard({@required this.workshopData});
  @override
  _NormalUserWorkshopDashboardState createState() => _NormalUserWorkshopDashboardState();
}

class _NormalUserWorkshopDashboardState extends State<NormalUserWorkshopDashboard> {
  int _selectedItemIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.orange,
            )
        ),
        title: Text("BikersWorld"),
        elevation: 0,
        backgroundColor: Color(0XFF012A4A),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0XFF012A4A),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 20, right: 20.0, top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: Color(0XFF00B686),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 8,
                                    spreadRadius: 3)
                              ],
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            padding: EdgeInsets.all(5),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: widget.workshopData.imageURL !=
                                  null ? NetworkImage(
                                  widget.workshopData.imageURL) : AssetImage(
                                  "assets/avatar.jpg"),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.workshopData != null ? widget
                                    .workshopData.shopTitle : 'Workshop name',
                                style: GoogleFonts.quicksand(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    widget.workshopData != null ? widget
                                        .workshopData.city : 'City',
                                    style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    widget.workshopData != null
                                        ? widget.workshopData.ownerContact
                                        : 'Owner contact',
                                    style: GoogleFonts.quicksand(
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
          Positioned(
            top: 130,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.85,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 8,
                    spreadRadius: 3,
                    offset: Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Column(

              ),
            ),
          )
        ],
      ),
    );
  }

}
