import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/dashboard/Ads/AdDetail.dart';
import 'package:bikersworld/screen/dashboard/searchPages/search_auto_part_detail_page.dart';
import 'package:bikersworld/screen/loginSignup/signup.dart';
import 'package:bikersworld/services/bike_add_queries.dart';
import 'package:bikersworld/services/part_store_queries/part_queries.dart';
import 'package:bikersworld/services/part_store_queries/part_store_query.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/auto_part_ptore_dashboard.dart';
import 'package:bikersworld/screen/dashboard/searchPages/ads_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/workshop_search_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:flutter/rendering.dart';
import 'package:bikersworld/screen/dashboard/findMorePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/bezierContainer.dart';
import 'package:bikersworld/screen/dashboard/searchPages/auto_partstore_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autopart_search_page.dart';

import 'normalUser/normal_user_workshop_dashboard.dart';

class HomeDashboard extends StatefulWidget {

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {

  final adds = PostAddQueries();
  final _workshops = RegisterWorkshopQueries();
  final _partStore = RegisterPartStoreQueries();
  final _autoPart = AutoPartQueries();

  int currentIndex = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0XFF012A4A),
        title: new Text("Bikers World", style: GoogleFonts.quicksand(fontSize: 20, color: Colors.orange),),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xfff5f6f7),  //0xffE8ECF6
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 205,
              width: MediaQuery.of(context).size.width,
              child: FadeAnimation(
                3.5,CustomPaint(
                painter: new CircularBackgroundPainter(
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25,top: 5),
                        child: Text(
                          "Welcome",
                          style: GoogleFonts.quicksand(
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25,top: 5),
                        child: Text(
                          "Dashboard",
                          style: GoogleFonts.montserrat(
                            fontSize: 23,
                            color: Color(0xfff7ce8f),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50,top: 10, left: 15),
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.signOutAlt,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 15,),
                                  Text(
                                    "Join Now",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 18,
                                      color: Colors.grey,
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
                ),
              ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Color(0xffadadad),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FlatButton(
                          padding:EdgeInsets.zero,
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AdSearchPage()));
                          },
                          child: Container(
                            width: 180,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom:20,top: 10,left: 10,right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Advertisments",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/motorcycle.png",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.orange,
                                          blurRadius: 1,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        FlatButton(
                          padding:EdgeInsets.zero,
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => WorkshopSearchPage()));

                          },
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom:20,top: 10,left: 10,right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "    Workshops    ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/car-service.png",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.orange,
                                          blurRadius: 1,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        FlatButton(
                          padding:EdgeInsets.zero,

                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AutoPartSearchPage()));

                          },
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom:20,top: 10,left: 10,right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "    Auto Parts    ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/brake.png",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.orange,
                                          blurRadius: 1,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        FlatButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AutoPartStoreSearchPage()));

                          },
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom:20,top: 10,left: 10,right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Auto Part Store",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/repair-shop.png",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.orange,
                                          blurRadius: 0.9,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    ,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height:210,
              color: Color(0XFF012A4A),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Bikers World",
                              style:GoogleFonts.quicksand(
                                fontSize: 28,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Find the best ads, workshop, auto parts and auto part Store",
                              style:GoogleFonts.quicksand(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => findMore()));
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xfffbb448),
                                Color(0xffed740c),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Find More",
                              style: GoogleFonts.raleway(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:25, top: 30),
                          child: Container(
                            height: 50,
                            width: 8,
                            color:Colors.orange,
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "WORKSHOPS",
                                  style: GoogleFonts.mukta(
                                    fontSize: 20,
                                    color: Color(0XFF012A4A),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:0),
                                  child: Text(
                                    "Find the best we have",
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        CircleAvatar(backgroundColor: Colors.white,),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20,right: 20),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopSearchPage()));
                          },
                          child: Container(
                            height:35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Color(0XFF012A4A),  width: 1),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("View All", textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(fontSize: 15, color: Color(0XFF012A4A),),),
                              ),
                            ),
                          ),
                        ),

  ],
 ),
                  ),
                  FutureBuilder(
                    future: _workshops.getLimitedWorkshops(),
                    builder: (BuildContext context, AsyncSnapshot<List<WorkshopDashboardModel>> snapshot) {
                      if(snapshot.hasData && snapshot.data.isNotEmpty){
                        return Container(
                          height: 275,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics:AlwaysScrollableScrollPhysics(),
                            itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index){
                               return FlatButton(
                                 padding: EdgeInsets.only(left:20,top:10),
                                 onPressed: (){
                                   Navigator.push(context, MaterialPageRoute( builder: (context) => NormalUserWorkshopDashboard(workshopData: snapshot.data[index])));
                                 },
                                 child: Card(
                                   margin: const EdgeInsets.only(left:10, bottom: 10),
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                   child:Padding(
                                     padding: const EdgeInsets.only(bottom:5),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Container(
                                           width: MediaQuery.of(context).size.width - 100,
                                           height: 185,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10),
                                             image: DecorationImage(
                                               fit: BoxFit.fill,
                                               image: snapshot.data[index].imageURL != null ?
                                             NetworkImage(snapshot.data[index].imageURL,) : AssetImage("assets/avatar.jpg",),
                                             ),
                                           ),
                                         ),
                                         Padding(
                                             padding:EdgeInsets.only(left: 10,top:5),
                                             child: Text(
                                             snapshot.data[index].shopTitle,
                                               style: GoogleFonts.mukta(
                                                 fontSize:18,
                                                 color: Colors.black,
                                               ),
                                               softWrap: true,
                                           ),
                                         ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:EdgeInsets.only(left: 10,),
                                                child: Text(
                                                  snapshot.data[index].city,
                                                  style: GoogleFonts.mukta(
                                                    fontSize:16,
                                                    color: Colors.grey,
                                                  ),
                                                  softWrap: true,
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 1.0,
                                                color: Colors.grey,
                                                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                                              ),

                                              Padding(
                                                padding:EdgeInsets.only(left: 1,),
                                                child: Text(
                                                  snapshot.data[index].ownerContact,
                                                  style: GoogleFonts.mukta(
                                                    fontSize:16,
                                                    color: Colors.grey,
                                                  ),
                                                  softWrap: true,
                                                ),
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
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xfff5f6f7),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:25, top: 30),
                            child: Container(
                              height: 50,
                              width: 8,
                              color:Colors.orange,
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ADVERTISEMENTS",
                                    style: GoogleFonts.mukta(
                                      fontSize: 20,
                                      color: Color(0XFF012A4A),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:0),
                                    child: Text(
                                      "Find the best we have",
                                      style: GoogleFonts.varelaRound(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          CircleAvatar(backgroundColor: Colors.white,),
                          FlatButton(
                              padding: EdgeInsets.only(top: 20,right: 20),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AdSearchPage()));

                              },
                              child: Container(
                                height:35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(color: Color(0XFF012A4A),  width: 1),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("View All", textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(fontSize: 15, color: Color(0XFF012A4A),),),
                                  ),
                                ),
                              ),
                            ),

                        ],
                      ),
                    ),

                    FutureBuilder(
                      future: adds.getLimitedAdds(),
                      builder: (BuildContext context, AsyncSnapshot<List<BikeAddModel>> snapshot) {
                        if(snapshot.hasData && snapshot.data.isNotEmpty){
                          return Container(
                            height: 281,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics:AlwaysScrollableScrollPhysics(),
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index){
                                  return FlatButton(
                                    padding: EdgeInsets.only(left:20,top:10,  right: 10),
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetail(data: snapshot.data[index],)));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width - 100,
                                      child: Card(
                                        color: Color(0xfff2f2f2),
                                        margin: const EdgeInsets.only(left:10,top:10 , bottom: 10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child:Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width - 100,
                                              height: 180,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20.0),
                                                child: Image(
                                                  image: NetworkImage(
                                                    snapshot.data[index].images.first,
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:EdgeInsets.only(left:10,top: 5),
                                                child: Text(
                                                  snapshot.data[index].title,
                                                  style: GoogleFonts.mukta(
                                                    fontSize:20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:EdgeInsets.only(left:10,),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot.data[index].city,
                                                    style: GoogleFonts.mukta(fontSize: 16,color: Colors.grey),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Text("|"),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    "PKR ${snapshot.data[index].price}",
                                                    style: GoogleFonts.varelaRound(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 20,),
                                                  Container(
                                                    // margin: EdgeInsets.only(top: 20),
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0XFF012A4A),
                                                      borderRadius: BorderRadius.only(
                                                        bottomRight: Radius.circular(20),
                                                        topLeft: Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                    ),
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
                            ),
                          );
                        }
                        else if(snapshot.hasData && snapshot.data.isEmpty){
                          return Center(child: Text("No Adds Currently Present"));
                        }
                        else if(snapshot.hasError){
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    SizedBox(height:20),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xfff5f6f7),
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0XFF012A4A)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Sell you bike with bikers world",
                                  style: GoogleFonts.varelaRound(
                                    fontSize: 22,
                                    color: Color(0XFF012A4A),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            FontAwesomeIcons.check,
                                                          color:Color(0xff8a8a8a),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Text(
                                                          "Dedicted sale expert to \n sell your bike",
                                                          style: GoogleFonts.krub(
                                                            fontSize: 17,
                                                            color: Color(0xff8a8a8a),
                                                          ),
                                                          softWrap: true,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            FontAwesomeIcons.check,
                                                          color:Color(0xff8a8a8a),

                                                        ),
                                                        SizedBox(width: 10,),
                                                        Text(
                                                          "Dedicted sale expert to \n sell your bike",
                                                          style: GoogleFonts.krub(
                                                            fontSize: 17,
                                                            color: Color(0xff8a8a8a),
                                                          ),
                                                          softWrap: true,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height:10,),

                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            FontAwesomeIcons.check,
                                                          color:Color(0xff8a8a8a),

                                                        ),
                                                        SizedBox(width: 10,),
                                                        Text(
                                                          "Dedicted sale expert to \n sell your bike",
                                                          style: GoogleFonts.krub(
                                                            fontSize: 17,
                                                            color: Color(0xff8a8a8a),
                                                          ),
                                                          softWrap: true,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              )
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:10,left:10),
                                            child: Container(
                                              child: Image(
                                                height: 80,
                                                width: 80,
                                                image: AssetImage(
                                                  "assets/trade.png",
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left:15,right:10,bottom: 15, top:15),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0XFF012A4A),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "Register you bike",
                                    style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ),

                    SizedBox(height: 20,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:25, top: 10),
                            child: Container(
                              height: 50,
                              width: 8,
                              color:Colors.orange,
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "AUTO PART STORES",
                                    style: GoogleFonts.mukta(
                                      fontSize: 20,
                                      color: Color(0XFF012A4A),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:0),
                                    child: Text(
                                      "Find the best we have",
                                      style: GoogleFonts.varelaRound(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          CircleAvatar(backgroundColor: Colors.white,),
                          FlatButton(
                            padding: EdgeInsets.only(top: 20,right: 20),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartStoreSearchPage()));
                            },
                            child: Container(
                              height:35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: Color(0XFF012A4A),  width: 1),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("View All", textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(fontSize: 15, color: Color(0XFF012A4A),),),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: _partStore.getLimitedPartStore(),
                      builder: (BuildContext context, AsyncSnapshot<List<PartstoreDashboardModel>> snapshot) {
                        if(snapshot.hasData && snapshot.data.isNotEmpty){
                          return ListView.builder(
                            shrinkWrap: true,
                            physics:NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return FlatButton(
                                padding: EdgeInsets.zero,
                                onPressed:(){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AutoPartStoreDashboardPageNormalUser(partStoreId: snapshot.data[index].id,)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left:20,right:20, top:5),
                                  child:  Card(
                                    elevation: 8.0,
                                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0XFF012A4A),
                                      ),
                                      child:ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                          leading: Container(
                                            padding: EdgeInsets.only(right: 12.0),
                                            decoration: new BoxDecoration(
                                                border: new Border(
                                                    right: new BorderSide(
                                                        width: 3,
                                                        color: Colors.white24,
                                                    ),
                                                ),
                                            ),
                                            child: Image(
                                              image:snapshot.data[index].imageURL != null ? NetworkImage(snapshot.data[index].imageURL) : AssetImage("assets/partstore.jpg"),
                                            ),
                                          ),
                                          title: Text(
                                            snapshot.data[index].shopTitle,
                                            style: TextStyle (
                                                color: Colors.white,
                                                fontSize: 18
                                            ),
                                          ),

                                          subtitle: Row(
                                            children: <Widget>[
                                              Icon(
                                                  Icons.linear_scale,
                                                  color: Colors.orange,
                                              ),
                                              Text(
                                                snapshot.data[index].city,
                                                style: TextStyle (
                                                    color: Colors.white,
                                                    fontSize: 12
                                                ),
                                              )
                                            ],
                                          ),
                                          trailing:
                                          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        else if(snapshot.hasData && snapshot.data.isEmpty){
                          return Center(child: Text("No PartStores currently Present"));
                        }
                        else if(snapshot.hasError){
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),

                    SizedBox(height: 20,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:25, top: 10),
                            child: Container(
                              height: 50,
                              width: 8,
                              color:Colors.orange,
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "AUTO PART",
                                    style: GoogleFonts.mukta(
                                      fontSize: 20,
                                      color: Color(0XFF012A4A),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:0),
                                    child: Text(
                                      "Find the best we have",
                                      style: GoogleFonts.varelaRound(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          CircleAvatar(backgroundColor: Colors.white,),
                          FlatButton(
                            padding: EdgeInsets.only(top: 20,right: 20),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartSearchPage()));
                            },
                            child: Container(
                              height:35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: Color(0XFF012A4A),  width: 1),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("View All", textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(fontSize: 15, color: Color(0XFF012A4A),),),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    FutureBuilder(
                      future: _autoPart.getLimitedAutoPart(),
                      builder: (BuildContext context, AsyncSnapshot<List<AutoPartModel>> snapshot) {
                        if(snapshot.hasData && snapshot.data.isNotEmpty){
                          return  Container(
                            height: 248,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics:AlwaysScrollableScrollPhysics(),
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index){
                                  return FlatButton(
                                    padding: EdgeInsets.only(left:20,top:10, right: 10),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchAutoPartDetailPage(partDetail: snapshot.data[index],)));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -200,
                                      child: Card(
                                        color: Color(0xfff2f2f2),
                                        margin: const EdgeInsets.only(left:10,),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child:Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width - 100,
                                              height: 160,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image(
                                                    image: NetworkImage(
                                                      snapshot.data[index].imageURL,
                                                    ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:5,top: 5),
                                              child: Text(
                                                snapshot.data[index].title,
                                                style: GoogleFonts.mukta(
                                                  fontSize:20,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child:Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "PKR",
                                                          style: GoogleFonts.quicksand(
                                                            fontSize: 15,
                                                            color: Colors.grey,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data[index].price.toString(),
                                                          style: GoogleFonts.quicksand(
                                                            fontSize: 15,
                                                            color: Colors.grey,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // margin: EdgeInsets.only(top: 20),
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0XFF012A4A),
                                                      borderRadius: BorderRadius.only(
                                                        bottomRight: Radius.circular(10),
                                                        topLeft: Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                    ),
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
                            ),
                          );
                        }
                        else if(snapshot.hasData && snapshot.data.isEmpty){
                          return Center(child: Text("No Parts currently Present"));
                        }
                        else if(snapshot.hasError){
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    SizedBox(height:15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
//      floatingActionButton: FloatingActionButton(
//        onPressed:(){
//          // for regsiter ads
//          // lakin ads register krny sy phly user register hona chahhiyeh77
//        },
//        child: Icon(Icons.add),
//        backgroundColor: Colors.red,
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//      bottomNavigationBar: BubbleBottomBar(
//        hasNotch: true,
//        fabLocation: BubbleBottomBarFabLocation.end,
//        opacity: .2,
//        currentIndex: currentIndex,
//        onTap: changePage,
//        borderRadius: BorderRadius.vertical(
//            top: Radius.circular(
//                16)), //border radius doesn't work when the notch is enabled.
//        elevation: 8,
//        items: <BubbleBottomBarItem>[
//          BubbleBottomBarItem(
//              backgroundColor: Colors.red,
//              icon: Icon(
//                Icons.home,
//                size:20,
//                color: Colors.black,
//              ),
//              activeIcon: Icon(
//                Icons.home,
//                size:20,
//                color: Colors.red,
//              ),
//              title: Text("Workshop")),
//          BubbleBottomBarItem(
//              backgroundColor: Colors.deepPurple,
//              icon: Icon(
//                FontAwesomeIcons.storeAlt,
//                size:20,
//                color: Colors.black,
//              ),
//              activeIcon: Icon(
//                FontAwesomeIcons.storeAlt,
//                size:20,
//                color: Colors.deepPurple,
//              ),
//              title: Text("Auto Store")),
//          BubbleBottomBarItem(
//              backgroundColor: Colors.indigo,
//              icon: Icon(
//                FontAwesomeIcons.cogs,
//                size:20,
//                color: Colors.black,
//              ),
//              activeIcon: Icon(
//                FontAwesomeIcons.cogs,
//                size:20,
//                color: Colors.indigo,
//              ),
//              title: Text("Auto Parts")),
//          BubbleBottomBarItem(
//              backgroundColor: Colors.green,
//              icon: Icon(
//                FontAwesomeIcons.ad,
//                size:20,
//                color: Colors.black,
//              ),
//              activeIcon: Icon(
//                FontAwesomeIcons.ad,
//                size:20,
//                color: Colors.green,
//              ),
//              title: Text("Ads"))
//        ],
//      ),
    );
  }
}

