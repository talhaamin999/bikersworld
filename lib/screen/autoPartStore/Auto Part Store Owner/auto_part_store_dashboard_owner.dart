import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/view_parts_page.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/register_auto_parts.dart';
class AutoPartStoreDashboardOwner extends StatefulWidget {
  @override
  _AutoPartStoreDashboardOwnerState createState() => _AutoPartStoreDashboardOwnerState();
}

class _AutoPartStoreDashboardOwnerState extends State<AutoPartStoreDashboardOwner> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
        iconTheme: IconThemeData(
          color: Colors.orangeAccent,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
            },
          )
        ],
      ),
      body:  Container(
        color: Color(0xfff0f0f0),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: 280,
                        width: double.infinity,
                        color: Color(0XFF012A4A),
                      ),
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 200),
                                child: FlatButton(
                                  child: Positioned(
                                    bottom: -200,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/partstore.jpg"),
                                      backgroundColor: Colors.black,
                                      radius: 80,
                                    ),
                                  ),
                                  onPressed: (){
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 320,
                                          color: Color(0xffe8e8e8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15, top:15),
                                                child: Text(
                                                  "Select Option",
                                                  style: GoogleFonts.quicksand(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 15,),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10, left:20),
                        child: SizedBox(
                          child: AutoSizeText(
                            "Khan Auto Store",
                            style: GoogleFonts.quicksand(
                              fontSize: 30,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:60,left:20),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.userTie, color: Colors.white70,),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                      "Ibtasam",
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 15,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.mapMarkerAlt, color: Colors.white70,),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                     "Islamabad",
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.phone, color: Colors.white70,),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                      "033554377823",
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 15,),
              Container(
                width:MediaQuery.of(context).size.width - 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                            title: new Text("Working hours", style: GoogleFonts.quicksand(fontSize: 18 , fontWeight:FontWeight.bold),),
                            content: Container(
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: 60,
                          width: 140,
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


                    FlatButton(
                      onPressed: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc){
                              return SingleChildScrollView(
                              );
                            }
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 140,
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
              SizedBox(height:15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Auto Parts", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.cogs, color: Color(0xffc4040e),),
                    ),
                    title: Text("Add Auto Parts"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAutoParts()));
                    },
                  ),
                ),
              ),


              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Views Parts", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.eye, color: Colors.black,),
                    ),
                    title: Text("View  Parts"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPartsPage()));
                    },
                    ),
                  ),
                ),

              SizedBox(height:20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Category", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
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
                            cardColor: Color(0xffcca63b),
                            title: 'Accessories',
                            subtitle: 'Timing',
                            icon: Icon(FontAwesomeIcons.clock , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                        // SizedBox(width: 20.0),
                        FlatButton(
                          onPressed: (){
                          },
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFFF9BE7C),
                            title: 'Air tank',
                            icon: Icon(FontAwesomeIcons.commentDots , size: 55, color: Colors.white,),
                            subtitle: ' fuel delievery',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFF309397),
                            title: 'Body',
                            subtitle: '& frame',
                            icon: Icon(FontAwesomeIcons.cogs , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                        // SizedBox(width: 20.0),
                        FlatButton(
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFF309397),
                            title: 'Brake',
                            subtitle: 'suspension',
                            icon: Icon(FontAwesomeIcons.cogs , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          child: ActiveProjectsCard(
                            cardColor: Color(0xffcca63b),
                            title: 'Decales',
                            subtitle: 'Emblems',
                            icon: Icon(FontAwesomeIcons.clock , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                        // SizedBox(width: 20.0),
                        FlatButton(
                          onPressed: (){
                          },
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFFF9BE7C),
                            title: 'Drivetrain',
                            icon: Icon(FontAwesomeIcons.commentDots , size: 55, color: Colors.white,),
                            subtitle: 'tansmission',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFF309397),
                            title: 'Electrical',
                            subtitle: 'Injection',
                            icon: Icon(FontAwesomeIcons.cogs , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                        // SizedBox(width: 20.0),
                        FlatButton(
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFF309397),
                            title: 'Electrinics',
                            subtitle: 'Naviagation',
                            icon: Icon(FontAwesomeIcons.cogs , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                      ],
                    ),


                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          child: ActiveProjectsCard(
                            cardColor: Color(0xffcca63b),
                            title: 'Engine',
                            subtitle: 'Parts',
                            icon: Icon(FontAwesomeIcons.clock , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                        // SizedBox(width: 20.0),
                        FlatButton(
                          onPressed: (){
                          },
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFFF9BE7C),
                            title: 'Exhauts',
                            icon: Icon(FontAwesomeIcons.commentDots , size: 55, color: Colors.white,),
                            subtitle: 'System',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFF309397),
                            title: 'Electrical',
                            subtitle: 'Injection',
                            icon: Icon(FontAwesomeIcons.cogs , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                        // SizedBox(width: 20.0),
                        FlatButton(
                          child: ActiveProjectsCard(
                            cardColor: Color(0xFF309397),
                            title: 'Lighting',
                            subtitle: 'Indicator',
                            icon: Icon(FontAwesomeIcons.cogs , size: 45, color: Colors.white,),
                          ),
                          onPressed: (){

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






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
    return Padding(
      padding: const EdgeInsets.only(left:1),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(bottom:15, top: 15),
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child:  icon,
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
      ),
    );
  }
}
