import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:bikersworld/services/bike_add_queries.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/dashboard/Ads/AdDetail.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../postAdsSeller.dart';

enum addOption{updateBikeInfo,upadateSellerInfo,updateImages,delete}



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

  void NavigateToUpdatePage(addOption option,BuildContext context,BikeAddModel data){
    if(option == addOption.updateBikeInfo){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostBikeInfo(data: data,)));
    }
    else if(option == addOption.upadateSellerInfo){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SellerInformation(data: data)));
    }
    else if(option == addOption.updateImages){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostAddImages(data: data)));
    }
  }


  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0XFF012A4A),
        title: new Text("Bikers World", style: GoogleFonts.quicksand(fontSize: 20, color: Colors.white ),),
        elevation: 0.0,
          leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
            onPressed:() => Navigator.pop(context),
          )
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
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(" Your \n Dashboard",
                        style: GoogleFonts.quicksand(
                            fontSize: 25,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 26.0,
                      backgroundColor: Color(0XFF012A4A),
                    )
                  ],
                ),

                SizedBox(height:15),

                Text(" ADVERTISMENTS",
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AddDetail(data: snapshot.data[index],)));
                            },
                            child: Card(
                              color: Color(0xffdedede),
                              margin: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 25.0 / 15.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        snapshot.data[index].images.first,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Container(
                                         child: Row(
                                           mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                           children: [
                                             Expanded(
                                               child: Text(
                                                 snapshot.data[index].title,
                                                 style: GoogleFonts.quicksand(
                                                   fontSize:20,
                                                 ),
                                               ),
                                             ),
                                             PopupMenuButton(
                                                 icon: new Icon(FontAwesomeIcons.ellipsisV,
                                                     color: Colors.grey),
                                                 onSelected: (option){
                                                   NavigateToUpdatePage(option,context,snapshot.data[index]);
                                                 },
                                                 itemBuilder: (_) =>
                                                 <PopupMenuItem<addOption>>[
                                                   new PopupMenuItem<addOption>(
                                                     child: Container(
                                                       child: Row(
                                                         children: [
                                                           Icon(
                                                             FontAwesomeIcons.edit,
                                                             size: 15,
                                                           ),
                                                           SizedBox(width: 10),
                                                           Text(
                                                             "Update Bike Info",
                                                             style: GoogleFonts.quicksand(
                                                               fontSize: 16,
                                                             ),
                                                           ),
                                                         ],
                                                       ),
                                                     ),
                                                     value: addOption.updateBikeInfo,
                                                   ),
                                                   new PopupMenuItem<addOption>(
                                                     child: Container(
                                                       child: Row(
                                                         children: [
                                                           Icon(
                                                             FontAwesomeIcons.edit,
                                                             size: 15,
                                                           ),
                                                           SizedBox(width: 10),
                                                           Text(
                                                             "Update Seller Info",
                                                             style: GoogleFonts.quicksand(
                                                               fontSize: 16,
                                                             ),
                                                           ),
                                                         ],
                                                       ),
                                                     ),
                                                     value: addOption.upadateSellerInfo,
                                                   ),
                                                   new PopupMenuItem<addOption>(
                                                     child: Container(
                                                       child: Row(
                                                         children: [
                                                           Icon(
                                                             FontAwesomeIcons.edit,
                                                             size: 15,
                                                           ),
                                                           SizedBox(width: 10),
                                                           Text(
                                                             "Update Add Images",
                                                             style: GoogleFonts.quicksand(
                                                               fontSize: 16,
                                                             ),
                                                           ),
                                                         ],
                                                       ),
                                                     ),
                                                     value: addOption.updateImages,
                                                   ),
                                                   new PopupMenuItem<addOption>(
                                                     child: FlatButton(
                                                       padding: EdgeInsets.zero,
                                                       onPressed: (){
                                                         Alert(
                                                           context: context,
                                                           type: AlertType.warning,
                                                           title: "Warning",
                                                           desc: "Are you sure you want to delete it...",
                                                           buttons: [
                                                             DialogButton(
                                                               color: Colors.indigo,
                                                               width: 120,
                                                               child: Text(
                                                                 "Cancel",
                                                                 style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                                                               ),
                                                               onPressed: () {
                                                                 //option = 'cancel';
                                                                 //Navigator.of(context,rootNavigator: true).pop();
                                                               },
                                                             ),
                                                             DialogButton(
                                                                 width: 120,
                                                                 child: Text(
                                                                   "Okay",
                                                                   style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                                                                 ),
                                                                 onPressed: () {
                                                                   //option = 'ok';
                                                                   //Navigator.of(context, rootNavigator: true).pop();
                                                                 }
                                                             )
                                                           ],
                                                         ).show();
                                                       },
                                                       child: Container(
                                                         child: Row(
                                                           children: [
                                                             Icon(
                                                               FontAwesomeIcons.minus,
                                                               size: 15,
                                                             ),
                                                             SizedBox(width: 10),
                                                             Text(
                                                               "Delete",
                                                               style: GoogleFonts.quicksand(
                                                                 fontSize: 16,
                                                               ),
                                                             ),
                                                           ],
                                                         ),
                                                       ),
                                                     ),
                                                     value: addOption.delete,
                                                   ),
                                                 ],
                                               ),
                                           ],
                                         ),
                                       ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot.data[index].city,
                                                style: GoogleFonts.quicksand(fontSize: 16,color: Colors.grey),
                                              ),
                                              SizedBox(width: 5,),
                                              Text("|"),
                                              SizedBox(width: 5,),
                                              Text(
                                                "PKR ${snapshot.data[index].price}",
                                                style: GoogleFonts.varelaRound(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
/*
Column(
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      image: NetworkImage(
                                        snapshot.data[index].images.first,
                                      ),
                                    ),
                                  ),
                                ),
**/
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
              ],
            ),
          ),
          color: Colors.transparent,
        ),
      ),
    );
  }
}


class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text('Warning !!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('You can not access this file', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    RaisedButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                      color: Colors.redAccent,
                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 60,
                  child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
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

