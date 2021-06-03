import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/bike_add_queries.dart';
import 'package:bikersworld/services/part_store_queries/part_queries.dart';
import 'package:bikersworld/services/part_store_queries/part_store_query.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
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
import 'package:bikersworld/screen/dashboard/Ads/AdDetail.dart';
import 'package:bikersworld/screen/dashboard/searchPages/auto_partstore_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autopart_search_page.dart';
import 'package:bikersworld/widgets/constants.dart';


class HomeDashboard extends StatefulWidget {

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {

  final adds = PostAddQueries();
  final _workshops = RegisterWorkshopQueries();
  final _partStore = RegisterPartStoreQueries();
  final _autoPart = AutoPartQueries();

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
              child: new CustomPaint(
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
                      FadeAnimation(
                        1.3,
                        Padding(
                          padding: const EdgeInsets.only(right: 50,top: 10, left: 15),
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value){
                            },
                            decoration: new InputDecoration(

                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10),
                                ),
                              ),
                              filled: true,
                              hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                              hintText: "Search Anything",
                              contentPadding: EdgeInsets.only(top: 7),
                              prefixIcon: Icon(Icons.search, size: 25,),
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
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
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left:25,top: 20),
                              child: Container(
                                height: 200,
                                child: ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    FlatButton(
                                      padding:EdgeInsets.zero,
                                      onPressed: (){
                                      },
                                      child: Container(
                                        width: 180,
                                        height: 220,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),

                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 10.0 / 10.0,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20.0),
                                                child: Image(
                                                  image: snapshot.data[index].imageURL != null ?
                                                  NetworkImage(
                                                    snapshot.data[index].imageURL,
                                                  ) :
                                                      AssetImage(
                                                          "assets/avatar.jpg",
                                                      ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                ,
                              ),
                            );
                          },
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
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(left:20, top:20),
                                height: 280,
                                child: FlatButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddDetail(data: snapshot.data[index],)));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 80,
                                    child: Card(
                                      color: Color(0xfff2f0f0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
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
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:EdgeInsets.only(left:10,top:10),
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
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(left:10,),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:20,right:20, top:10),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  color: Color(0XFF012A4A),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8,top:8),
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0,bottom:10),
                                          child: Container(
                                            width: 70.0,
                                            height: 70.0,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: snapshot.data[index].imageURL != null ?
                                                    NetworkImage(snapshot.data[index].imageURL)
                                                    : AssetImage("assets/partstore.jpg"),
                                                )
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(snapshot.data[index].shopTitle,
                                              style: TextStyle (
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),
                                            ),
                                            Text(snapshot.data[index].city,
                                              style: TextStyle (
                                                  color: Colors.white,
                                                  fontSize: 12
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 30),
                                          alignment: Alignment.bottomRight,
                                          height:50,
                                          width: 130,
                                          decoration:BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),
                                            color: Colors.orange,
                                          ),
                                          child: Center(
                                            child:Text(
                                              "View",
                                              style: GoogleFonts.raleway(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
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
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    ActiveProjectsCard(
                                      image: "assets/p1.jpeg",
                                      title: snapshot.data[index].title,
                                      subtitle: 'PKR ${snapshot.data[index].price}',
                                    ),
                                  ],
                                ),
                              );
                            },
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),

    );
  }
}






class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;
  final String image;
  ActiveProjectsCard({
    this.cardColor,
    this.title,
    this.subtitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: 225,
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 1,
            color: Color(0xffdedede),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 10.0 / 10.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,bottom:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: GoogleFonts.quicksand(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height:5),
                  Container(
                    child:Row(
                      children: [
                        Text(
                          "PKR",
                          style: GoogleFonts.quicksand(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width:5),
                        Text(
                          subtitle,
                          style: GoogleFonts.quicksand(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
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
      ),
    );
  }
}

