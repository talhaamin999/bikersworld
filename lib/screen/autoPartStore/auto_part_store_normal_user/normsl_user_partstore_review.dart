import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/auto_part_store_review_form.dart';

class NormalUserPartStoreReivew extends StatefulWidget {
  @override
  _NormalUserPartStoreReivewState createState() => _NormalUserPartStoreReivewState();
}

class _NormalUserPartStoreReivewState extends State<NormalUserPartStoreReivew> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff0f0f0),
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
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:15, top:15),
                child: Container(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Part Store',
                      style: GoogleFonts.quicksand(
                        fontSize: 30,
                        color: Color(0xfff7892b),
                      ),
                      children: [
                        TextSpan(
                            text: ' Reviews',
                            style: GoogleFonts.quicksand(
                              fontSize: 30,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:1),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "4.0",
                        style: GoogleFonts.quicksand(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingsBar(30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(right:15,bottom:10),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewAutoPartStore()));
                  },
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
                ),
              ),
              SizedBox(height:15),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    leading: CircleAvatar (
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/user.png"),
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      radius: 30,
                      backgroundColor: Colors.orange,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15,),
                        Container(
                          child: Text(
                            "Ibtasam ur Rehman",
                            style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        RatingsBar(20),
                        SizedBox(height: 10,),
                        Container(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit ",
                            style: GoogleFonts.raleway(
                              fontSize: 15,
                            ),
                          ),
                        ),

                      ],
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
