import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/reviews_auto_part_form.dart';


class SpeicificCategory extends StatefulWidget {
  @override
  _SpeicificCategoryState createState() => _SpeicificCategoryState();
}

class _SpeicificCategoryState extends State<SpeicificCategory> {
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
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:25,top: 15),
                child: Container(
                  child: Text(
                    "All Parts",
                    style:GoogleFonts.quicksand(
                      fontSize: 23,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PartDetail()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                        height: 70,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left:10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Name", style: GoogleFonts.quicksand(fontSize:16),),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class PartDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mediaQuery.size.height/3,
            child: FadeAnimation(1.2, Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      colors: [
                        Color.fromRGBO(251, 121, 155, 1),
                        Color.fromRGBO(251, 53, 105, 1)
                      ]
                  )
              ),
              child: Transform.translate(
                offset: Offset(30, -30),
                child: FadeAnimation(1.3, Image.asset('',)),
              ),
            )),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height / 1.4,
              child: FadeAnimation(1.2, Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(1.3, Text('Part Name',
                            style: GoogleFonts.quicksand(color: Colors.black ,fontSize: 18, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 10,),
                          FadeAnimation(1.3,
                              Container(
                                child: Row(
                                  children: [
                                    Icon(FontAwesomeIcons.tag , size: 15,color: Colors.black,),
                                    SizedBox(width: 20,),
                                    Text("600",
                                      style: GoogleFonts.varelaRound(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          SizedBox(height: 10,),
                          FadeAnimation(1.3,
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.cogs,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 20,),
                                  Text("Category",
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          FadeAnimation(1.4, Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean at elit lectus. Nulla tincidunt sapien non viverra pellentesque. Nam maximus condimentum arcu sit amet hendrerit.", style: GoogleFonts.varelaRound(color: Color.fromRGBO(51, 51, 51, 0.54), height: 1.4, fontSize: 18,),),
                          ),
                          SizedBox(height: 30,),
                          FadeAnimation(1.2,
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Reviews',
                                    style: GoogleFonts.quicksand(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                                  FlatButton(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.plus_one,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewAutoPart(null)));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          FadeAnimation(
                            1.2,
                            Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  leading: CircleAvatar(
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
                                      RatingsBar(30),
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
                          ),
                          SizedBox(height: 50,),
                        ],
                      )
                  )
              ))
          ),
        ],
      ),
    );
  }
}



class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]),
            child: child
        ),
      ),
    );
  }
}