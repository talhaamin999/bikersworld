import 'package:bikersworld/model/workshop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/dashboard/normalUser/reviews/reviewsNormalUser.dart';
import 'package:bikersworld/screen/dashboard/normalUser/normal_user_workshop_employee.dart';
import 'package:bikersworld/screen/dashboard/normalUser/normal_user_workshop_services.dart';

class NormalUserWorkshopDashboard extends StatefulWidget {
  final WorkshopDashboardModel workshopData;
  NormalUserWorkshopDashboard({@required this.workshopData});
  @override
  _NormalUserWorkshopDashboardState createState() => _NormalUserWorkshopDashboardState();
}

class _NormalUserWorkshopDashboardState extends State<NormalUserWorkshopDashboard> {
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
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Color(0XFF012A4A),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: CircleAvatar(
                                  radius: 60,
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundImage: widget.workshopData.imageURL != null ? NetworkImage(widget.workshopData.imageURL): AssetImage("assets/avatar.jpg"),
                                  ),
                                  backgroundColor: Colors.orange,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      widget.workshopData != null ? widget.workshopData.shopTitle : 'Workshop name',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        widget.workshopData != null ? widget.workshopData.city : 'City',
                                        style: GoogleFonts.quicksand(
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        widget.workshopData != null ? widget.workshopData.ownerContact: 'Owner contact',
                                        style: GoogleFonts.quicksand(
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15 , top: 160),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          topLeft: Radius.circular(10),
                        )
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(left:10, right:12,),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                      title: new Text("Working hours", style: GoogleFonts.quicksand(fontSize: 18 , fontWeight:FontWeight.bold),),
                                      content: Container(
                                        child: Row(
                                          children: [
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.only(top:5),
                                          child: Icon(
                                            FontAwesomeIcons.clock,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Time",
                                          style: GoogleFonts.quicksand(
                                            fontSize:17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ),


                            FlatButton(
                              onPressed: (){
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext bc){
                                      return SingleChildScrollView(
                                        child: Container(
                                          child: new Wrap(
                                            children: <Widget>[
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                );
                              },
                              child: Container(
                                height: 60,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:5),
                                      child: Icon(
                                        FontAwesomeIcons.calendar,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Calender",
                                      style: GoogleFonts.quicksand(
                                        fontSize:16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:25,top:15),
              child: Container(
                child: Text(
                  "Information",
                  style: GoogleFonts.varelaRound(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:25,top:15),
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0XFF012A4A),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.quicksand(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.workshopData != null ? widget.workshopData.ownerName: 'Owner Name',
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25,top:15),
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0XFF012A4A),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: GoogleFonts.quicksand(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.workshopData != null ? widget.workshopData.area: 'Address ',
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // subheading('Active Projects'),
                  SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: ActiveProjectsCard(
                          cardColor: Colors.lightGreen,
                          title: 'Workshop',
                          subtitle: 'Timing',
                          icon: Icon(FontAwesomeIcons.clock , size: 45, color: Colors.white,),
                        ),
                        onPressed: (){

                        },
                      ),
                      SizedBox(width: 20.0),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewFromUser(workshopDocId: widget.workshopData.id,)));
                        },
                        child: ActiveProjectsCard(
                          cardColor: Color(0xFFF9BE7C),
                          title: 'Workshop',
                          icon: Icon(FontAwesomeIcons.commentDots , size: 55, color: Colors.white,),
                          subtitle: ' Feedback',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: ActiveProjectsCard(
                          cardColor: Color(0xFF309397),
                          title: 'Workshop',
                          subtitle: 'Services',
                          icon: Icon(FontAwesomeIcons.clock , size: 45, color: Colors.white,),
                        ),
                        onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => NormalUserWorkshopServices(workshopId: widget.workshopData.id,)));

                        },
                      ),
                      SizedBox(width: 20.0),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NormalUserWorkshopEmployee(workshopId: widget.workshopData.id,)));
                        },
                        child: ActiveProjectsCard(
                          cardColor: Color(0xFF6488E4),
                          title: 'Workshop',
                          icon: Icon(FontAwesomeIcons.commentDots , size: 55, color: Colors.white,),
                          subtitle: 'Employees',
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}


/*
* Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NormalUserWorkshopServices()));

                        },
                        child: ActiveProjectsCard(
                          cardColor: Color(0xffdb8651),
                          title: 'Workshop',
                          icon: Icon(FontAwesomeIcons.cogs , size: 55, color: Colors.white,),
                          subtitle: 'Services',
                        ),
                      ),
                      SizedBox(width: 20.0),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NormalUserWorkshopEmployee()));

                        },
                        child: ActiveProjectsCard(
                          cardColor: LightColors.kBlue,
                          title: 'Workshop',
                          icon: Icon(Icons.person , size: 55, color: Colors.white,),
                          subtitle: 'Employees',
                        ),
                      ),
                    ],
                  ),*/


class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;
  final Icon icon;

  ActiveProjectsCard({
    this.cardColor,
    this.title,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.only(top:15,bottom:15),
      height: 150,
      width: 135,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Center(
              child: icon,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(
                  title,
                  style: GoogleFonts.quicksand(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(
                  subtitle,
                  style: GoogleFonts.quicksand(
                    fontSize: 16.0,
                    color: Colors.white54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class LightColors  {
  static const Color kLightYellow = Colors.white;
  static const Color kLightYellow2 = Colors.white;
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  static const Color kPalePink = Color(0xFFFED4D6);

  static const Color kRed = Color(0xFFE46472);
  static const Color kLavender = Color(0xFFD5E4FE);
  static const Color kBlue = Color(0xFF6488E4);
  static const Color kLightGreen = Color(0xFFD9E6DC);
  static const Color kGreen = Color(0xFF309397);

  static const Color kDarkBlue = Color(0xFF0D253F);
}
