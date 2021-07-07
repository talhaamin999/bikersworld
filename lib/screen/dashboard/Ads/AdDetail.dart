import 'package:bikersworld/model/bike_add_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bikersworld/screen/dashboard/searchPages/ads_search_page.dart';
import 'package:image_slider/image_slider.dart';

class AddDetail extends StatefulWidget {


  final BikeAddModel data;
  AddDetail({@required this.data});
  @override
  _AddDetailState createState() => _AddDetailState();
}

class _AddDetailState extends State<AddDetail>  with SingleTickerProviderStateMixin  {

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.data.images.length, vsync: this);
    links = List<String>.from(widget.data.images);
  }
  TabController tabController;
  static List<String> links;



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
            )
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      child: ImageSlider(
                        showTabIndicator: true,
                        tabIndicatorColor: Colors.white,
                        tabIndicatorSelectedColor: Colors.white,
                        tabIndicatorHeight: 8,
                        tabIndicatorSize: 8,
                        tabController: tabController,
                        curve: Curves.fastOutSlowIn,
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        autoSlide: false,
                        duration: new Duration(seconds: 6),
                        allowManualSlide: true,
                        children: links.map((String link) {
                          return new ClipRRect(
                            child: Image.network(
                              link,
                              width: MediaQuery.of(context).size.width,
                              height: 220,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.data.title,
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "PKR ${widget.data.price}",
                          style: GoogleFonts.roboto(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          child:Text(
                            widget.data.address,
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: Text(
                      "Ad Information",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,

                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.building),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                    "Make",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    widget.data.make,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 60,),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.mapMarkedAlt),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                  "City",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    widget.data.city,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
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
                ),
                SizedBox(height: 15,),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.table),
                            SizedBox(width: 8,),
                            SizedBox(width: 18,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text(
                                  "Modal",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                  Text(
                                    widget.data.model,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.calendar),
                            SizedBox(width: 15,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Year",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    widget.data.year,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
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
                ),

                Padding(
                  padding: const EdgeInsets.only(left:15,top:15,right: 15,bottom: 5),
                  child: Container(
                    child: Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: Container(
                    child: Text(
                      widget.data.description,
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35,),
                Container(
                  height: 180,
                  width: double.infinity,
                  color: Color(0XFF012A4A),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Search for more ads",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Find the best Ads on Bikers World...",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdSearchPage()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 200,
                            padding: EdgeInsets.symmetric(vertical: 13),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.orange, width: 2),
                            ),
                            child: Text(
                              'Find more',
                              style: TextStyle(fontSize: 20, color: Colors.orange),
                            ),
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
       // drawer: Drawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: ListTile(
          //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child:FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        launch(
                            "whatsapp://send?phone=${widget.data.sellerContact}"
                        );
                      },
                      child: Container(
                        height:60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Color(0XFF128C7E),  width: 2),
                          color: Color(0XFF128C7E),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.whatsapp, color: Colors.white,size: 30,),
                            SizedBox(width: 10,),
                            Text("Whatsapp",
                              style: GoogleFonts.quicksand(fontSize: 18, color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                ),
                SizedBox(width: 10,),
                Expanded(
                    child:FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        launch(
                            'tel://${widget.data.sellerContact}'
                        );
                      },
                      child: Container(
                        height:60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Color(0XFF396ca3),  width: 2),
                          color: Color(0XFF396ca3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.phoneAlt, color: Colors.white,),
                            SizedBox(width: 10,),
                            Text("Call Seller",
                              style: GoogleFonts.quicksand(fontSize: 18, color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

/*
*  ListTile(
              //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
              title: Row(
                children: <Widget>[
                  Expanded(child: RaisedButton(onPressed: () {},child: Text("Clear"),color: Colors.black,textColor: Colors.white,)),
                  Expanded(child: RaisedButton(onPressed: () {},child: Text("Filter"),color: Colors.black,textColor: Colors.white,)),
                ],
              ),
            )*/

/*
* FlatButton(
          padding: EdgeInsets.zero,
          onPressed: (){
            launch(
                'tel://${widget.data.sellerContact}'
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width:40,
                    height:60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Color(0XFF396ca3),  width: 2),
                      color: Color(0XFF396ca3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.phoneAlt, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text("Call Seller",
                          style: GoogleFonts.quicksand(fontSize: 15, color: Colors.white),),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
*/