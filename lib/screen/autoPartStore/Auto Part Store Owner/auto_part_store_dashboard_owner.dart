import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/auto_part_store_review_form.dart';
import 'package:bikersworld/services/part_store_queries/part_store_query.dart';
import 'package:bikersworld/services/part_store_queries/part_store_review_query.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/register_auto_parts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/auto_part_dasboard.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/view_all_categories.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/register_auto_part_store.dart';


class AutoPartStoreDashboardOwner extends StatefulWidget {
  @override
  _AutoPartStoreDashboardOwnerState createState() => _AutoPartStoreDashboardOwnerState();
}

final _autoStore = RegisterPartStoreQueries();
enum userOption{editProfile, workshopWorkingDays, workshopTiming}

class _AutoPartStoreDashboardOwnerState extends State<AutoPartStoreDashboardOwner>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _autoStore.getPartStore(),
        builder: (BuildContext context, AsyncSnapshot<PartstoreDashboardModel> snapshot){
          if(snapshot.hasData && snapshot.data != null){
            return NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Color(0XFF012A4A),
                    title: Text('Bikers World',
                      style: GoogleFonts.quicksand(
                        fontSize: 20,

                      ),
                    ),
                    pinned: true,
                    floating: true,
                    forceElevated: boxIsScrolled,
                    bottom: TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: "Information",
                        ),
                        Tab(
                          text: "Reviews",
                        ),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  InformationTab(partStoreInfo: snapshot.data,),
                  ReviewsTab(partStoreId: snapshot.data.id,),
                ],
                controller: _tabController,
              ),
            );
          }
          else if(snapshot.hasData && snapshot.data == null){
            return Center(child: Text("You Don't have A PartStore Registered"));
          }
          else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
class InformationTab extends StatelessWidget {
  final PartstoreDashboardModel partStoreInfo;
  InformationTab({@required this.partStoreInfo});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0XFF012A4A),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(60),
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:10,top:15),
                              child: CircleAvatar(
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage("assets/partstore.jpg"),
                                ),
                                radius: 65,
                                backgroundColor: Colors.orange,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Text(
                                        partStoreInfo.shopTitle,
                                        style: GoogleFonts.raleway(
                                          color: Colors.white70,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.person, size: 30, color: Colors.grey,),
                                          SizedBox(width: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: Text(
                                              partStoreInfo.ownerName,
                                              style: GoogleFonts.raleway(
                                                color: Colors.white70,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on, size: 30, color: Colors.grey,),
                                          SizedBox(width: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: Text(
                                              partStoreInfo.city,
                                              style: GoogleFonts.raleway(
                                                color: Colors.white70,
                                                fontSize: 18,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  height: 100,
                  color: Colors.transparent,
                  margin: EdgeInsets.symmetric(horizontal: 23,),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(10),
                      ), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width - 20,
                      height: 75,
                      child: Padding(
                        padding: const EdgeInsets.only(left:15,),
                        child: Row(
                          children: [
                            FlatButton(
                              child: Container(
                                height: 60,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Colors.red,
                                ),
                                child: Icon(
                                FontAwesomeIcons.clock,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: (){
                                //working days
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
                                            partStoreInfo.openTime,
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
                                              partStoreInfo.closeTime,
                                            style: GoogleFonts.quicksand(
                                              fontSize:18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(width: 10,),
                            FlatButton(
                              child: Container(
                                height: 60,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Color(0XFF012A4A),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: (){
                                // Calender
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
                                                leading: partStoreInfo.monday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,
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
                                                leading: partStoreInfo.tuesday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                              ),
                                              ListTile(
                                                title: Container(
                                                  child: Row(
                                                    children: [
                                                      Text("Wednesday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                    ],
                                                  ),
                                                ),
                                                leading: partStoreInfo.wednesday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                              ),
                                              ListTile(
                                                title: Container(
                                                  child: Row(
                                                    children: [
                                                      Text("Thursday", style: GoogleFonts.quicksand(fontSize: 20, ),),

                                                    ],
                                                  ),
                                                ),

                                                leading: partStoreInfo.thursday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                              ),
                                              ListTile(
                                                title: Container(
                                                  child: Row(
                                                    children: [
                                                      Text("Friday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                    ],
                                                  ),
                                                ),
                                                leading: partStoreInfo.friday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                              ),
                                              ListTile(
                                                title: Container(
                                                  child: Row(
                                                    children: [
                                                      Text("Saturday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                    ],
                                                  ),
                                                ),
                                                leading: partStoreInfo.saturday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),

                                              ),
                                              ListTile(
                                                title: Container(
                                                  child: Row(
                                                    children: [
                                                      Text("Sunday", style: GoogleFonts.quicksand(fontSize: 20, ),),
                                                    ],
                                                  ),
                                                ),

                                                leading: partStoreInfo.sunday ? Icon(FontAwesomeIcons.check,color: Colors.green,) :  Icon(FontAwesomeIcons.times,color: Colors.red,),
                                              ),

                                              SizedBox(height: 20,),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                );
                              },
                            ),
                            FlatButton(
                              child: Container(
                                height: 60,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Colors.orange,
                                ),
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterAutoPartStore(storeDetails:partStoreInfo,)));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 23,),
                  alignment: Alignment.topLeft,
                  child: Text("Auto Parts", style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:5,right: 5,top: 10),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAutoParts(partStoreId: partStoreInfo.id,partStoreCity: partStoreInfo.city,)));
                    },
                    child: Card (
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width - 20,
                        height: 75,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.indigo,
                                child: Icon(FontAwesomeIcons.cogs, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              "Add Auto Parts",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right:20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Categories',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllCategories(partStoreId: partStoreInfo.id,)));
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
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // subheading('Active Projects'),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.zero,
                            child: ActiveProjectsCard(
                              cardColor: Color(0xffcca63b),
                              title: 'Body',
                              subtitle: 'Frame',
                              icon: Icon(FontAwesomeIcons.motorcycle , size: 45, color: Colors.white,),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDashboard(category: 'Body & Frame',partStoreId: partStoreInfo.id,)));
                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDashboard(category: 'Brake & Suspension',partStoreId: partStoreInfo.id,)));

                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFFF9BE7C),
                              title: 'Brake',
                              icon: Icon(FontAwesomeIcons.bolt , size: 55, color: Colors.white,),
                              subtitle: 'Suspension',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.zero,
                            child: ActiveProjectsCard(
                              cardColor: Colors.deepOrangeAccent,
                              title: 'Lighting &',
                              subtitle: 'Indicators',
                              icon: Icon(FontAwesomeIcons.bolt , size: 45, color: Colors.white,),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDashboard(partStoreId: partStoreInfo.id, category: 'Lighting & Indicators',)));

                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDashboard(partStoreId: partStoreInfo.id, category: 'Air Intake',)));

                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFF1d51b8),
                              title: 'Air',
                              icon: Icon(FontAwesomeIcons.commentDots , size: 55, color: Colors.white,),
                              subtitle: 'Intake',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.zero,
                            child: ActiveProjectsCard(
                              cardColor: Colors.orange,
                              title: 'Engine &',
                              subtitle: 'Engine Parts',
                              icon: Icon(FontAwesomeIcons.clock , size: 45, color: Colors.white,),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDashboard(category: 'Engine & Engine Parts',partStoreId: partStoreInfo.id,)));

                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDashboard(partStoreId: partStoreInfo.id,category: 'Exhaust System',)));

                            },
                            child: ActiveProjectsCard(
                              cardColor: Colors.teal,
                              title: 'Exhaust',
                              icon: Icon(FontAwesomeIcons.commentDots , size: 55, color: Colors.white,),
                              subtitle: 'System',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
    }
  }

class ReviewsTab extends StatelessWidget {
  final String partStoreId;
  ReviewsTab({@required this.partStoreId});

  final _reviews = ReviewPartstoreQueries();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left:20),
            child: Container(
              child:RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'Store',
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
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
           FutureBuilder(
             future: _reviews.getPartstoreReview(partStoreId: partStoreId),
             builder: (BuildContext context, AsyncSnapshot<List<PartStoreReviews>> snapshot) {
               if(snapshot.hasData && snapshot.data.isNotEmpty){
                 return ListView.builder(
                   shrinkWrap: true,
                   itemCount: snapshot.data.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Container(
                       margin: EdgeInsets.only(left: 20, right: 20),
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
                                   snapshot.data[index].title,
                                   style: GoogleFonts.raleway(
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                               ),
                               SizedBox(height: 10,),
                               RatingsBar(snapshot.data[index].starRating),
                               SizedBox(height: 10,),
                               Container(
                                 child: Text(
                                   snapshot.data[index].description,
                                   style: GoogleFonts.raleway(
                                     fontSize: 15,
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
                 return Center(child: Text("NO REVIEWS FOUND"),);
               }
               else if(snapshot.hasError){
                 return Center(child: Text(snapshot.error.toString()),);
               }
               return Center(child: CircularProgressIndicator(),);
             },
           ),
          ],
      ),
    );
  }
}


class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;
  final Icon icon;

  ActiveProjectsCard({
    this.cardColor,
    this.title,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left:35,bottom: 15),
        padding: EdgeInsets.only(bottom:15, top: 15),
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child:  icon,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    title,
                    style: GoogleFonts.quicksand(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    subtitle,
                    style: GoogleFonts.quicksand(
                      fontSize: 16.0,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}

