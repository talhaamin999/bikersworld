import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:bikersworld/services/bike_add_queries.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';


class SellerHomeScreen extends StatelessWidget {

  final _user = AuthenticationService();
  final _adds = PostAddQueries();
  final _error = ToastErrorMessage();

  Future<List<BikeAddModel>> getSellerAdds(){
    try {
      if (_user.getCurrentUser()) {
        return _adds.getSellerAdds(_user.getUserId());
      }
      return null;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
   double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0XFF012A4A),
        title: new Text("Bikers World", style: GoogleFonts.quicksand(fontSize: 20, color: Colors.orange),),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xffF5F5F7),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Color(0XFF012A4A),
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),
          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              children: <Widget>[
                // Header - Greetings and Avatar
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Ibtasam\nRehman",
                        style: GoogleFonts.quicksand(
                            fontSize: 25,
                            color: Colors.white
                        ),
                      ),
                    ),
                    CircleAvatar(
                        radius: 26.0,
                      backgroundColor: Color(0XFF012A4A),
                    )
                  ],
                ),

                SizedBox(height: 50),

                // Main Cards - Heartbeat and Blood Pressure
                Container(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardMain(
                        image: AssetImage(''),
                        title: "",
                        value: "",
                        unit: "",
                        color: Constants.lightGreen,
                      ),
                      CardMain(
                          image: AssetImage(''),
                          title: "",
                          value: "",
                          unit: "",
                          color: Constants.lightYellow
                      )
                    ],
                  ),
                ),

                // Section Cards - Daily Medication
                SizedBox(height: 10),

                Text("YOUR ADVERTISMENTS",
                  style: GoogleFonts.quicksand(
                    color:Color(0xff808080),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20,),
                FutureBuilder(
                  future: getSellerAdds(),
                  builder: (BuildContext context, AsyncSnapshot<List<BikeAddModel>> snapshot) {
                    if(snapshot.hasData && snapshot.data.isNotEmpty){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 240,
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // This next line does the trick.
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  width: 230.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffe6e9ed),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          image: NetworkImage(
                                            snapshot.data[index].images.first,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 10),
                                        child: Text(
                                          snapshot.data[index].title,
                                          style: GoogleFonts.quicksand(fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 5),
                                        child: Text(
                                          snapshot.data[index].city,
                                          style: GoogleFonts.quicksand(fontSize: 15,color: Colors.grey),
                                        ),
                                      ),

                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10,top: 5),
                                              child: Text(
                                                "PKR ${snapshot.data[index].price}",
                                                style: GoogleFonts.varelaRound(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right:8.0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
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
                          );
                        },
                      );
                    }
                    else if(snapshot.hasData && snapshot.data.isEmpty){
                      return Center(child: Text("No Adds Found"));
                    }
                    else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class Constants {

  static Color darkGreen = Color(0xFF3ABD6F);
  static Color lightGreen = Color(0xFFA1ECBF);

  // Yellow
  static Color darkYellow = Color(0xFF3ABD6F);
  static Color lightYellow = Color(0xFFFFDA7A);

  static Color darkOrange = Color(0xFFFFB74D);

  static ThemeData lighTheme(BuildContext context) {
    return ThemeData(

      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      appBarTheme: AppBarTheme(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),

      ),
    );
  }

  static double headerHeight = 228.5;
  static double paddingSide = 30.0;
}


class CardItems extends StatelessWidget {
  final Image image;
  final String title;
  final String value;
  final String unit;
  final Color color;
  final int progress;

  CardItems({
    Key key,
    @required this.image,
    @required this.title,
    @required this.value,
    @required this.unit,
    @required this.color,
    @required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 100,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: ClipPath(
              clipper: MyCustomClipper(clipType: ClipType.halfCircle),
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: color.withOpacity(0.1),
                ),
                height: 100,
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class CardMain extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String value;
  final String unit;
  final Color color;

  CardMain(
      {Key key,
        @required this.image,
        @required this.title,
        @required this.value,
        @required this.unit,
        @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        width: (
            (MediaQuery.of(context).size.width - (Constants.paddingSide * 2 + Constants.paddingSide / 2)) /
                2),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: color,
        ),
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Positioned(
                  child: ClipPath(
                    clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black.withOpacity(0.03),
                      ),
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
//                Padding(
//                  padding: EdgeInsets.all(20.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      // Icon and Hearbeat
//                      Row(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Image(
//                              width: 32,
//                              height: 32,
//                              image: image
//                          ),
//                          SizedBox(
//                            width: 10,
//                          ),
//                          Expanded(
//                            child: Text(
//                              title,
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(
//                                  fontSize: 13,
//                                  color: Constants.textDark
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                      SizedBox(height: 10),
//                      Text(value,
//                        style: TextStyle(
//                          fontSize: 30,
//                          fontWeight: FontWeight.w900,
//                          color: Constants.textDark,
//                        ),
//                      ),
//                      Text(
//                        unit,
//                        style: TextStyle(
//                            fontSize: 15,
//                            color: Constants.textDark
//                        ),
//                      ),
//                    ],
//                  ),
//                )
              ],
            ),
          ),
          color: Colors.transparent,
        ),
      ),
    );
  }
}



enum ClipType { bottom, semiCircle, halfCircle, multiple }

class MyCustomClipper extends CustomClipper<Path> {
  ClipType clipType;

  MyCustomClipper({this.clipType});

  @override
  getClip(Size size) {
    var path = new Path();
    if (clipType == ClipType.bottom) {
      createBottom(size, path);
    } else if (clipType == ClipType.semiCircle) {
      createSemiCirle(size, path);
    } else if (clipType == ClipType.halfCircle) {
      createHalfCircle(size, path);
    } else if (clipType == ClipType.multiple) {
      createMultiple(size, path);
    }
    path.close();
    return path;
  }

  createSemiCirle(Size size, Path path) {
    path.lineTo(size.width / 1.40, 0);

    var firstControlPoint = new Offset(size.width / 1.30, size.height / 2.5);
    var firstEndPoint = new Offset(size.width / 1.85, size.height / 1.85);

    var secondControlPoint = new Offset(size.width / 4, size.height / 1.45);
    var secondEndPoint = new Offset(0, size.height / 1.75);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(0, size.height / 1.75);
  }

  createBottom(Size size, Path path) {
    path.lineTo(0, size.height / 1.19);
    var secondControlPoint = new Offset((size.width / 2), size.height);
    var secondEndPoint = new Offset(size.width, size.height / 1.19);

    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
  }

  createHalfCircle(Size size, Path path) {
    path.lineTo(size.width / 2, 0);
    var firstControlPoint = new Offset(size.width / 1.10, size.height / 2);
    var firstEndPoint = new Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(0, size.height);
  }

  createMultiple(Size size, Path path) {
    path.lineTo(0, size.height);

    var curXPos = 0.0;
    var curYPos = size.height;
    Random rnd = new Random();

    var increment = size.width / 40;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - rnd.nextInt(50 - 0) : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

