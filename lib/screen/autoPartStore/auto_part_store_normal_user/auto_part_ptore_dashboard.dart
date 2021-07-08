import 'package:bikersworld/services/search_queries/search_part.dart';
import 'package:bikersworld/services/search_queries/search_part_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/categories_normal_user.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/view_all_auto_parts.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/normal_user_partstore_review.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/view_category_wise_auto_part.dart';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'auto_part_details.dart';

class AutoPartStoreDashboardPageNormalUser extends StatefulWidget {

  final String partStoreId;

  AutoPartStoreDashboardPageNormalUser({@required this.partStoreId});

  @override
  _AutoPartStoreDashboardPageNormalUserState createState() => _AutoPartStoreDashboardPageNormalUserState();
}

class _AutoPartStoreDashboardPageNormalUserState extends State<AutoPartStoreDashboardPageNormalUser> {
  bool isVisible = false,
      _isButtonVisible = true;

  final _partStore = SearchPartStore();
  final _autoPart = SearchAutoParts();
  final _random = Random();
  final List partCategory = [
    "Body & Frame",
    "Brake & Suspension",
    "Lighting & Indicators",
    "Engine & Parts",
    "Exhaust & System",
    "Aur & Intake",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BIKERSWORLD',
          style: GoogleFonts.quicksand(
            color: Colors.orange,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0XFF012A4A),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: _partStore.getPartStoreById(widget.partStoreId),
          builder: (BuildContext context,
              AsyncSnapshot<PartstoreDashboardModel> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    FadeAnimation(1, Container(
                      height: 180,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: Color(0XFF012A4A),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0)
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20),
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.orange,
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage: snapshot.data.imageURL != null
                                    ? NetworkImage(snapshot.data.imageURL)
                                    : AssetImage("assets/avatar.jpg",)
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 170.0,
                                  height: 30.0,
                                  child: AutoSizeText(
                                    snapshot.data.shopTitle,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                SizedBox(
                                  width: 170.0,
                                  height: 20.0,
                                  child: AutoSizeText(
                                    snapshot.data.city,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                SizedBox(
                                  width: 170.0,
                                  height: 20.0,
                                  child: AutoSizeText(
                                    snapshot.data.ownerContact,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),

                                SizedBox(height: 5,),
                                FadeAnimation(1.5,
                                  Container(
                                    child: Row(
                                      children: [
                                        FlatButton(
                                            padding: EdgeInsets.zero,
                                            child: Container(
                                              width: 70,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                              ),
                                              child: Icon(
                                                FontAwesomeIcons.calendar,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext bc) {
                                                    return SingleChildScrollView(
                                                      child: Container(
                                                        child: new Wrap(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(top: 15,
                                                                  left: 15),
                                                              child: Text(
                                                                "Working Days",
                                                                style: GoogleFonts
                                                                    .quicksand(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            ListTile(
                                                              title: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Text("Monday",
                                                                      style: GoogleFonts
                                                                          .quicksand(
                                                                        fontSize: 20,),),
                                                                  ],
                                                                ),
                                                              ),
                                                              leading: snapshot
                                                                  .data.monday
                                                                  ? Icon(
                                                                FontAwesomeIcons
                                                                    .check,
                                                                color: Colors
                                                                    .green,)
                                                                  : Icon(
                                                                FontAwesomeIcons
                                                                    .times,
                                                                color: Colors.red,
                                                              ),

                                                            ),
                                                            ListTile(
                                                              title: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Tuesday",
                                                                      style: GoogleFonts
                                                                          .quicksand(
                                                                        fontSize: 20,),),
                                                                  ],
                                                                ),
                                                              ),
                                                              leading: snapshot
                                                                  .data.tuesday
                                                                  ? Icon(
                                                                FontAwesomeIcons
                                                                    .check,
                                                                color: Colors
                                                                    .green,)
                                                                  : Icon(
                                                                FontAwesomeIcons
                                                                    .times,
                                                                color: Colors
                                                                    .red,),
                                                            ),
                                                            ListTile(
                                                              title: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Wednesday",
                                                                      style: GoogleFonts
                                                                          .quicksand(
                                                                        fontSize: 20,),),
                                                                  ],
                                                                ),
                                                              ),
                                                              leading: snapshot
                                                                  .data.wednesday
                                                                  ? Icon(
                                                                FontAwesomeIcons
                                                                    .check,
                                                                color: Colors
                                                                    .green,)
                                                                  : Icon(
                                                                FontAwesomeIcons
                                                                    .times,
                                                                color: Colors
                                                                    .red,),

                                                            ),
                                                            ListTile(
                                                              title: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Thursday",
                                                                      style: GoogleFonts
                                                                          .quicksand(
                                                                        fontSize: 20,),),

                                                                  ],
                                                                ),
                                                              ),

                                                              leading: snapshot
                                                                  .data.thursday
                                                                  ? Icon(
                                                                FontAwesomeIcons
                                                                    .check,
                                                                color: Colors
                                                                    .green,)
                                                                  : Icon(
                                                                FontAwesomeIcons
                                                                    .times,
                                                                color: Colors
                                                                    .red,),
                                                            ),
                                                            ListTile(
                                                              title: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Text("Friday",
                                                                      style: GoogleFonts
                                                                          .quicksand(
                                                                        fontSize: 20,),),
                                                                  ],
                                                                ),
                                                              ),
                                                              leading: snapshot
                                                                  .data.friday
                                                                  ? Icon(
                                                                FontAwesomeIcons
                                                                    .check,
                                                                color: Colors
                                                                    .green,)
                                                                  : Icon(
                                                                FontAwesomeIcons
                                                                    .times,
                                                                color: Colors
                                                                    .red,),

                                                            ),
                                                            ListTile(
                                                              title: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Saturday",
                                                                      style: GoogleFonts
                                                                          .quicksand(
                                                                        fontSize: 20,),),
                                                                  ],
                                                                ),
                                                              ),
                                                              leading: snapshot
                                                                  .data.saturday
                                                                  ? Icon(
                                                                FontAwesomeIcons
                                                                    .check,
                                                                color: Colors
                                                                    .green,)
                                                                  : Icon(
                                                                FontAwesomeIcons
                                                                    .times,
                                                                color: Colors
                                                                    .red,),

                                                            ),
                                                            ListTile(
                                                              title: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Text("Sunday",
                                                                      style: GoogleFonts
                                                                          .quicksand(
                                                                        fontSize: 20,),),
                                                                  ],
                                                                ),
                                                              ),

                                                              leading: snapshot
                                                                  .data.sunday
                                                                  ? Icon(
                                                                FontAwesomeIcons
                                                                    .check,
                                                                color: Colors
                                                                    .green,)
                                                                  : Icon(
                                                                FontAwesomeIcons
                                                                    .times,
                                                                color: Colors
                                                                    .red,),
                                                            ),

                                                            SizedBox(height: 20,),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              );
                                            }
                                        ),
                                        FlatButton(
                                            padding: EdgeInsets.zero,
                                            child: Container(
                                              width: 70,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                              ),
                                              child: Icon(
                                                FontAwesomeIcons.clock,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) =>
                                                new AlertDialog(
                                                  title: new Text("Working hours",
                                                    style: GoogleFonts.quicksand(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight
                                                            .bold),),
                                                  content: Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          FontAwesomeIcons.clock,
                                                          color: Colors.orange,
                                                          size: 30,
                                                        ),
                                                        SizedBox(width: 10,),

                                                        Text(
                                                          snapshot.data.openTime,
                                                          style: GoogleFonts
                                                              .quicksand(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Text(
                                                            "-"
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Text(
                                                          snapshot.data.closeTime,
                                                          style: GoogleFonts
                                                              .quicksand(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
//                    Transform.translate(
//                      offset: Offset(0, -35),
//                      child: FadeAnimation(1.2, Container(
//                        height: 60,
//                        padding: EdgeInsets.only(left: 20, top: 8),
//                        margin: EdgeInsets.symmetric(horizontal: 25),
//                        decoration: BoxDecoration(
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Colors.grey[350],
//                                  blurRadius: 20.0,
//                                  offset: Offset(0, 10.0)
//                              )
//                            ],
//                            borderRadius: BorderRadius.circular(5.0),
//                            color: Colors.white
//                        ),
//                        child: TextField(
//                          decoration: InputDecoration(
//                              suffixIcon: Icon(
//                                Icons.search, color: Colors.black, size: 20.0,),
//                              border: InputBorder.none,
//                              hintText: 'Search'
//                          ),
//                        ),
//                      ),
//                      ),
//                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FadeAnimation(1.2,
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 15),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text('Choose category',
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      FlatButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewAllCategoriesNomrmalUser(widget.partStoreId)));
                                        },
                                        child: Text('View all',
                                          style: GoogleFonts.quicksand(
                                            fontSize: 16,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left:20),
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:5 ,
                                  itemBuilder: (context, index) {
                                return FlatButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCategoryWiseAutoPart(partStoreId: widget.partStoreId,partCategory: partCategory[index],)));
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Card(
                                      color: Color(0xffF8F8F8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(15),
                                          color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                                          [_random.nextInt(9) * 100],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              partCategory[index],
                                              style: GoogleFonts.quicksand(
                                                fontSize: 17,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(height: 10),
                    FadeAnimation(1.2,
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Auto Parts',
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          ViewAllAutoParts(widget.partStoreId)));
                                },
                                child: Text(
                                  'View all',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder(
                      future: _autoPart.getAutoPartByLimit(
                          partStoreId: widget.partStoreId),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<AutoPartModel>> snapshot) {
                        if (snapshot.hasData && snapshot.data.isNotEmpty) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics:NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, PageTransition( type: PageTransitionType.fade, child: AutoPartDetail(snapshot.data[index])));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color: Colors.white,
                                    child:Padding(
                                      padding: const EdgeInsets.only(left:10,right: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child:Image.network(snapshot.data[index].imageURL,),
                                          ),
                                          Container(
                                            margin:EdgeInsets.only(left:10),
                                           child:Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               SizedBox(
                                                 width: 150.0,
                                                 height: 20.0,
                                                 child: AutoSizeText(
                                                   snapshot.data[index].title,
                                                   style: GoogleFonts.quicksand(
                                                     color: Colors.black,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 20,
                                                   ),
                                                   maxLines: 2,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Container(
                                                 height: 2,
                                                 width: 80,
                                                 color: Colors.indigo,
                                               ),
                                               SizedBox(
                                                 width: 150.0,
                                                 height: 20.0,
                                                 child: AutoSizeText(
                                                   snapshot.data[index].category,
                                                   style: GoogleFonts.quicksand(
                                                     color: Colors.black,
                                                     fontSize: 16,
                                                   ),
                                                   maxLines: 2,
                                                 ),
                                               ),

                                             ],
                                           ),
                                          ),
                                          Container(
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey,

                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        else if (snapshot.hasData && snapshot.data.isEmpty) {
                          return Center(child: Text("NO PARTS Images To Show"));
                        }
                        else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        return Center(child: CircularProgressIndicator(),);
                      },
                    ),
                  ],
                ),
              );
            }


            else if (snapshot.hasData && snapshot.data == null) {
              return Center(child: Text("No Data Found"));
            }
            else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Center(child: CircularProgressIndicator());
          }
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(

          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                NormalUserPartStoreReivew(partStoreId: widget.partStoreId)));
          },
          child: const Icon(
            FontAwesomeIcons.commentDots, color: Colors.orange, size: 40,),
          backgroundColor: Color(0XFF012A4A),
        ),
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

