import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/part_store_queries/part_store_query.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/register_auto_parts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/category_list.dart';


class AutoPartStoreDashboardOwner extends StatefulWidget {
  @override
  _AutoPartStoreDashboardOwnerState createState() => _AutoPartStoreDashboardOwnerState();
}
final _autoStore = RegisterPartStoreQueries();



enum userOption{editProfile, workshopWorkingDays, workshopTiming}

Future<void> navigateToOtherScreen(userOption option) async{
  if(option == userOption.workshopWorkingDays) {
    var context;
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
                "Time form",
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
                "Time till",
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
}

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
      body: NestedScrollView(
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

              actions: [
                PopupMenuButton(
                  icon: new Icon(FontAwesomeIcons.ellipsisV,
                      color: Colors.white),
                  onSelected: (option){

                  },
                  itemBuilder: (_) =>
                  <PopupMenuItem<userOption>>[
                    new PopupMenuItem<userOption>(
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.edit,
                              size: 15,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Edit Profile",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      value: null,
                    ),
                    new PopupMenuItem<userOption>(
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.calendar,
                              size: 15,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Working Days",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      value: userOption.workshopWorkingDays,
                    ),
                    new PopupMenuItem<userOption>(
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.clock,
                              size: 15,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Timing",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      value: null,
                    )
                  ],
                ),
              ],
            ),

          ];
        },
        body: TabBarView(
          children: <Widget>[
            InformationTab(),
            ReviewsTab(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class InformationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: _autoStore.getPartStore(),
      builder: (BuildContext context, AsyncSnapshot<PartstoreDashboardModel> snapshot){
        if(snapshot.hasData && snapshot.data != null){
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
                                        snapshot.data.shopTitle,
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
                                              snapshot.data.ownerName,
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
                                              snapshot.data.city,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAutoParts(partStoreId: snapshot.data.id,)));
                    },
                    child: Card(
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
                        Text('View all',
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            color: Colors.indigo,
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
                            child: ActiveProjectsCard(
                              cardColor: Color(0xffcca63b),
                              title: 'Body',
                              subtitle: 'Frame',
                              icon: Icon(FontAwesomeIcons.motorcycle , size: 45, color: Colors.white,),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));
                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));

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
                            child: ActiveProjectsCard(
                              cardColor: Colors.deepOrangeAccent,
                              title: 'Electronic',
                              subtitle: 'Light',
                              icon: Icon(FontAwesomeIcons.bolt , size: 45, color: Colors.white,),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));

                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));

                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFF1d51b8),
                              title: 'Air',
                              icon: Icon(FontAwesomeIcons.commentDots , size: 55, color: Colors.white,),
                              subtitle: 'Filter',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: ActiveProjectsCard(
                              cardColor: Colors.orange,
                              title: 'Engine',
                              subtitle: 'Parts',
                              icon: Icon(FontAwesomeIcons.clock , size: 45, color: Colors.white,),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));

                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));

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
        else if(snapshot.data == null){
          Center(child: Text('You are not logged In'));
        }
        else if(!snapshot.hasData){
          Center(child: Text("You Don't have A PartStore Registered"));
        }
        else if(snapshot.hasError){
          Center(child: Text(snapshot.error.toString()));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ReviewsTab extends StatelessWidget {
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
      Container(
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
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(bottom:15, top: 15),
        height: 130,
        width: 130,
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

