import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:page_transition/page_transition.dart';

class autoPartStoreDashboardPage extends StatefulWidget {
  @override
  _autoPartStoreDashboardPageState createState() => _autoPartStoreDashboardPageState();
}

class _autoPartStoreDashboardPageState extends State<autoPartStoreDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
          elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeAnimation(1, Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                color: Color(0XFF012A4A),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0)
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height:20),
                  CircleAvatar(
                    radius: 55,
                    child: CircleAvatar(
                      radius:50,
                      backgroundColor: Colors.white,
                    ),
                    backgroundColor: Colors.orange,
                  ),
                  SizedBox(width: 15,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Khan Auto Parts",
                          style: GoogleFonts.quicksand(
                            fontSize:20,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "Islamabad",
                          style: GoogleFonts.quicksand(
                            fontSize:18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Transform.translate(
              offset: Offset(0, -35),
              child: FadeAnimation(1.2, Container(
                height: 60,
                padding: EdgeInsets.only(left: 20, top: 8),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[350],
                          blurRadius: 20.0,
                          offset: Offset(0, 10.0)
                      )
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white
                ),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search, color: Colors.black, size: 20.0,),
                      border: InputBorder.none,
                      hintText: 'Search'
                  ),
                ),
              )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1.2,
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Text('Choose category',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: SizedBox(
                          height: 160.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                width: 160.0,
                                color: Colors.red,
                                child: Center(
                                  child: Text("Body"),
                                ),
                              ),
                              Container(
                                width: 160.0,
                                color: Colors.blue,
                                child: Center(
                                  child: Text("Engine"),
                                ),
                              ),

                              Container(
                                width: 160.0,
                                color: Colors.orange,
                                child: Center(
                                  child: Text("Light"),
                                ),
                              ),
                              Container(
                                width: 160.0,
                                color: Colors.orange,
                                child: Center(
                                  child: Text("Frame"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 280,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.only(bottom: 20, left: 20),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FadeAnimation(1.3, makeCard(
                      context: context,
                      startColor: Color.fromRGBO(251, 121, 155, 1),
                      endColor: Color.fromRGBO(251, 53, 105, 1),
                      image: 'assets/socks-one.png'
                  )),
                  FadeAnimation(1.4, makeCard(
                      context: context,
                      startColor: Color.fromRGBO(203, 251, 255, 1),
                      endColor: Color.fromRGBO(81, 223, 234, 1),
                      image: 'assets/socks-two.png'
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeCard({context, startColor, endColor, image}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ViewSocks()));
      },
      child: AspectRatio(
        aspectRatio: 4/5,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  startColor,
                  endColor
                ],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[350],
                    blurRadius: 10,
                    offset: Offset(5, 10)
                )
              ]
          ),
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Center(
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }
}




class ViewSocks extends StatelessWidget {
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
                child: FadeAnimation(1.3, Image.asset('assets/details-page-header.png',)),
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
                          FadeAnimation(1.3, Text('Ranger Sport',
                            style: TextStyle(color: Color.fromRGBO(97, 90, 90, .54), fontSize: 18, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 10,),
                          FadeAnimation(1.3, Text("Ankle Men's Athletic Socks",
                            style: TextStyle(color: Color.fromRGBO(97, 90, 90, 1), fontSize: 23, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 20,),
                          FadeAnimation(1.4, Text("Ranger sport socks are a fusion of materials of the sturdiest quality and versatile design that suits all purposes. Each pair of Ranger socks is knitted from 100% combed cotton yarn running along a reinforced 2-Ply core polyester based elastic through out the socks.", style: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.54), height: 1.4, fontSize: 18,),),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: <Widget>[
                              FadeAnimation(1.2, Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 3, color: Colors.red),
                                    shape: BoxShape.circle,
                                    color: Colors.white
                                ),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black
                                  ),
                                ),
                              )),
                              FadeAnimation(1.3, Container(
                                width: 25,
                                height: 25,
                                margin: EdgeInsets.symmetric(horizontal:20),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(251, 53, 105, 1)
                                ),
                              )),
                              FadeAnimation(1.3, Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(81, 234, 234, 1)
                                ),
                              ))
                            ],
                          ),
                          SizedBox(height: 50,),
                          FadeAnimation(1.2, Text('More option',
                            style: TextStyle(color: Color.fromRGBO(97, 90, 90, .54), fontSize: 18, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 80,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                FadeAnimation(1.3, AspectRatio(
                                  aspectRatio: 3.2 / 1,
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey[300]),
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 56,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              color: Color.fromRGBO(251, 53, 105, 1)
                                          ),
                                          child: Image.asset('assets/socks-icon.png'),
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Ankle Length Socks', style: TextStyle(color: Color.fromRGBO(97, 90, 90, 1), fontWeight: FontWeight.bold),),
                                            SizedBox(height: 2,),
                                            Text('23,345', style: TextStyle(color: Color.fromRGBO(97, 90, 90, .7), fontSize: 13),)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                                FadeAnimation(1.4, AspectRatio(
                                  aspectRatio: 3.2 / 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20),
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey[300]),
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 56,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              color: Color.fromRGBO(81, 234, 234, 1)
                                          ),
                                          child: Image.asset('assets/socks-icon-left.png'),
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Quarter Length Socks', style: TextStyle(color: Color.fromRGBO(97, 90, 90, 1), fontWeight: FontWeight.bold),),
                                            SizedBox(height: 2,),
                                            Text('23,345', style: TextStyle(color: Color.fromRGBO(97, 90, 90, .7), fontSize: 13),)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          SizedBox(height: 50,),
                          FadeAnimation(1.5, Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 10,
                                      offset: Offset(0, 10)
                                  )
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(251, 121, 155, 1),
                                      Color.fromRGBO(251, 53, 105, 1)
                                    ]
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text('\$14.', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                                    Text('54', style: TextStyle(color: Colors.white, )),
                                  ],),
                                Text('Pay', style: TextStyle(color: Colors.white, fontSize: 25),),
                              ],
                            ),
                          )),
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