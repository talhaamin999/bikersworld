import 'package:bikersworld/services/search_queries/search_part_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/reviews_auto_part_form.dart';
import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/categories_normal_user.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/view_all_auto_parts.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/normsl_user_partstore_review.dart';

class AutoPartStoreDashboardPageNormalUser extends StatefulWidget {

  final PartstoreDashboardModel partStoreData;
  final String partStoreId;

  AutoPartStoreDashboardPageNormalUser({this.partStoreData,this.partStoreId});

  @override
  _AutoPartStoreDashboardPageNormalUserState createState() => _AutoPartStoreDashboardPageNormalUserState();
}

class _AutoPartStoreDashboardPageNormalUserState extends State<AutoPartStoreDashboardPageNormalUser> {
  bool isVisible = false,_isButtonVisible = true;
  final _partStore = SearchPartStore();

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
      body: widget.partStoreId != null ?
      FutureBuilder(
        future: _partStore.getPartStoreById(widget.partStoreId),
        builder: (BuildContext context, AsyncSnapshot<PartstoreDashboardModel> snapshot) {
          if(snapshot.hasData && snapshot.data != null){
            return SingleChildScrollView(
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
                          backgroundColor: Colors.orange,
                          child: CircleAvatar(
                              radius: 50,
                              backgroundImage: snapshot.data.imageURL != null ? NetworkImage(snapshot.data.imageURL) : AssetImage("assets/avatar.jpg",)
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.shopTitle,
                                style: GoogleFonts.quicksand(
                                  fontSize:20,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                snapshot.data.city,
                                style: GoogleFonts.quicksand(
                                  fontSize:18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                snapshot.data.ownerContact,
                                style: GoogleFonts.quicksand(
                                  fontSize:13,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                child: Row(
                                  children: [
                                    FlatButton(
                                        padding: EdgeInsets.zero,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width-320,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            FontAwesomeIcons.calendar,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed:(){
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext bc){
                                                return SingleChildScrollView(
                                                  child: Container(
                                                    child: new Wrap(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:15, left:15),
                                                          child: Text(
                                                            "Working Days",
                                                            style: GoogleFonts.quicksand(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                        ListTile(
                                                          title: Container(
                                                            child: Row(
                                                              children: [
                                                                Text("Monday", style: GoogleFonts.quicksand(fontSize: 20, ),),                                          ],
                                                            ),
                                                          ),
                                                          leading: snapshot.data.monday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,
                                                          ),

                                                        ),
                                                        ListTile(
                                                          title: Container(
                                                            child: Row(
                                                              children: [
                                                                Text("Tuesday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                              ],
                                                            ),
                                                          ),
                                                          leading: snapshot.data.tuesday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                                        ),
                                                        ListTile(
                                                          title: Container(
                                                            child: Row(
                                                              children: [
                                                                Text("Wednesday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                              ],
                                                            ),
                                                          ),
                                                          leading: snapshot.data.wednesday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                                        ),
                                                        ListTile(
                                                          title: Container(
                                                            child: Row(
                                                              children: [
                                                                Text("Thursday", style: GoogleFonts.quicksand(fontSize: 20, ),),

                                                              ],
                                                            ),
                                                          ),

                                                          leading: snapshot.data.thursday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                                        ),
                                                        ListTile(
                                                          title: Container(
                                                            child: Row(
                                                              children: [
                                                                Text("Friday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                              ],
                                                            ),
                                                          ),
                                                          leading: snapshot.data.friday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                                        ),
                                                        ListTile(
                                                          title: Container(
                                                            child: Row(
                                                              children: [
                                                                Text("Saturday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                              ],
                                                            ),
                                                          ),
                                                          leading: snapshot.data.saturday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                                        ),
                                                        ListTile(
                                                          title: Container(
                                                            child: Row(
                                                              children: [
                                                                Text("Sunday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                              ],
                                                            ),
                                                          ),

                                                          leading: snapshot.data.sunday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
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
                                    SizedBox(width: 5,),
                                    FlatButton(
                                        padding: EdgeInsets.zero,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width-320,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            FontAwesomeIcons.clock,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed:(){
                                          showDialog(
                                            context: context,
                                            builder: (_) => new AlertDialog(
                                              title: new Text("Working hours", style: GoogleFonts.quicksand(fontSize: 18 , fontWeight:FontWeight.bold),),
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
                                                      style: GoogleFonts.quicksand(
                                                        fontSize:18,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Text(
                                                        "-"
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Text(
                                                      snapshot.data.closeTime,
                                                      style: GoogleFonts.quicksand(
                                                        fontSize:18,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
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
                              padding: const EdgeInsets.only(left:20,right: 15),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Choose category',
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllCategoriesNomrmalUser()));
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
                          ReuseableGrid(partCategory: partCategory),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height:10),
                  FadeAnimation(1.2,
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 15),
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
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => ViewAllAutoParts()));
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
                  SizedBox(height: 10.0,),
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
                          image: '',
                        )),
                        FadeAnimation(1.4, makeCard(
                          context: context,
                          startColor: Color.fromRGBO(203, 251, 255, 1),
                          endColor: Color.fromRGBO(81, 223, 234, 1),
                          image: '',
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          else if(snapshot.hasData && snapshot.data == null){
            return Center(child: Text("No Data Found"));
          }
          else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator());
        }
      )
      : SingleChildScrollView(
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
                    backgroundColor: Colors.orange,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: widget.partStoreData.imageURL != null ? NetworkImage(widget.partStoreData.imageURL) : AssetImage("assets/avatar.jpg",)
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.partStoreData.shopTitle,
                          style: GoogleFonts.quicksand(
                            fontSize:20,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          widget.partStoreData.city,
                          style: GoogleFonts.quicksand(
                            fontSize:18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          widget.partStoreData.ownerContact,
                          style: GoogleFonts.quicksand(
                            fontSize:13,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          child: Row(
                            children: [
                              FlatButton(
                                padding: EdgeInsets.zero,
                                child: Container(
                                  width: MediaQuery.of(context).size.width-320,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.calendar,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed:(){
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext bc){
                                        return SingleChildScrollView(
                                          child: Container(
                                            child: new Wrap(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top:15, left:15),
                                                  child: Text(
                                                    "Working Days",
                                                    style: GoogleFonts.quicksand(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Container(
                                                    child: Row(
                                                      children: [
                                                        Text("Monday", style: GoogleFonts.quicksand(fontSize: 20, ),),                                          ],
                                                    ),
                                                  ),
                                                  leading: widget.partStoreData.monday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,
                                                  ),

                                                ),
                                                ListTile(
                                                  title: Container(
                                                    child: Row(
                                                      children: [
                                                        Text("Tuesday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                      ],
                                                    ),
                                                  ),
                                                  leading: widget.partStoreData.tuesday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                                ),
                                                ListTile(
                                                  title: Container(
                                                    child: Row(
                                                      children: [
                                                        Text("Wednesday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                      ],
                                                    ),
                                                  ),
                                                  leading: widget.partStoreData.wednesday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                                ),
                                                ListTile(
                                                  title: Container(
                                                    child: Row(
                                                      children: [
                                                        Text("Thursday", style: GoogleFonts.quicksand(fontSize: 20, ),),

                                                      ],
                                                    ),
                                                  ),

                                                  leading: widget.partStoreData.thursday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                                ),
                                                ListTile(
                                                  title: Container(
                                                    child: Row(
                                                      children: [
                                                        Text("Friday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                      ],
                                                    ),
                                                  ),
                                                  leading: widget.partStoreData.friday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                                ),
                                                ListTile(
                                                  title: Container(
                                                    child: Row(
                                                      children: [
                                                        Text("Saturday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                      ],
                                                    ),
                                                  ),
                                                  leading: widget.partStoreData.saturday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                                ),
                                                ListTile(
                                                  title: Container(
                                                    child: Row(
                                                      children: [
                                                        Text("Sunday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                      ],
                                                    ),
                                                  ),

                                                  leading: widget.partStoreData.sunday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
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
                              SizedBox(width: 5,),
                              FlatButton(
                                padding: EdgeInsets.zero,
                                child: Container(
                                  width: MediaQuery.of(context).size.width-320,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.clock,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                  onPressed:(){
                                    showDialog(
                                      context: context,
                                      builder: (_) => new AlertDialog(
                                        title: new Text("Working hours", style: GoogleFonts.quicksand(fontSize: 18 , fontWeight:FontWeight.bold),),
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
                                                widget.partStoreData.openTime,
                                                style: GoogleFonts.quicksand(
                                                  fontSize:18,
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                  "-"
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                widget.partStoreData.closeTime,
                                                style: GoogleFonts.quicksand(
                                                  fontSize:18,
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
                        padding: const EdgeInsets.only(left:20,right: 15),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Choose category',
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllCategoriesNomrmalUser()));
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
                    ReuseableGrid(partCategory: partCategory),
                  ],
                )
              ],
            ),

            SizedBox(height:10),
            FadeAnimation(1.2,
              Padding(
                padding: const EdgeInsets.only(left:20,right: 15),
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
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ViewAllAutoParts()));
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
            SizedBox(height: 10.0,),
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
                      image: '',
                  )),
                  FadeAnimation(1.4, makeCard(
                      context: context,
                      startColor: Color.fromRGBO(203, 251, 255, 1),
                      endColor: Color.fromRGBO(81, 223, 234, 1),
                      image: '',
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(

          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NormalUserPartStoreReivew()));
          },
          child: const Icon(FontAwesomeIcons.commentDots, color: Colors.orange, size: 40,),
          backgroundColor: Color(0XFF012A4A),
        ),
      ),
    );
  }

  Widget makeCard({context, startColor, endColor, image}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PartDetail()));
      },
      child: AspectRatio(
        aspectRatio: 1,
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

class ReuseableGrid extends StatelessWidget {

  const ReuseableGrid({
    Key key,
    @required this.partCategory,
  }) : super(key: key);

  final List partCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20, right: 10),
      child: GridView.extent(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          children: partCategory.map((el) => Card(
              child: Center(
                  child:Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text
                      (el,style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Color(0xff8c8b8b),
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ),
          ),
          ).toList()
      )
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewAutoPart()));
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