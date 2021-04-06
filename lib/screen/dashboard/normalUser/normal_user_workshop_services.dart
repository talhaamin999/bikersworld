import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalUserWorkshopServices extends StatefulWidget {
  @override
  _NormalUserWorkshopServicesState createState() => _NormalUserWorkshopServicesState();
}


class _NormalUserWorkshopServicesState extends State<NormalUserWorkshopServices>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
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
              iconTheme: IconThemeData(color: Color(0xfffbb448)),
              leading: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.orange,
                  )
              ),
              backgroundColor: Color(0XFF012A4A),
              title: Text('Bikers World',
                style: GoogleFonts.quicksand(
                    fontSize: 20
                ),
              ),
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child:Text("Electrical" , style: GoogleFonts.quicksand(fontSize:18),),
                    icon: Icon(FontAwesomeIcons.bolt),
                  ),
                  Tab(
                    child:Text("Mechanical",style: GoogleFonts.quicksand(fontSize:18),),
                    icon: Icon(FontAwesomeIcons.cogs),
                  ),
                  Tab(
                    child:Text("Tuning",style: GoogleFonts.quicksand(fontSize:18),),
                    icon: Icon(Icons.speed),
                  )
                ],
                controller: _tabController,
              ),
            ),

          ];
        },
        body: TabBarView(
          children: <Widget>[
            ElectricalTab(),
            MechanicalTab(),
            TuningTab(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class ElectricalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.wrench,
                  color: Colors.black,
                ),
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wiring',
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Hasham Autoplex",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 1,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.tags,
                                    size: 18,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "200",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 22,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Islamabad",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
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
    );
  }
}

class MechanicalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.wrench,
                  color: Colors.black,
                ),
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wheel bearing',
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Hasham Autoplex",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 1,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.tags,
                                    size: 18,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "200",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 22,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Islamabad",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
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
    );
  }
}

class TuningTab extends StatefulWidget {
  @override
  _TuningTabState createState() => _TuningTabState();
}

class _TuningTabState extends State<TuningTab> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListTile(
              leading: Icon(
                FontAwesomeIcons.wrench,
                color: Colors.black,
              ),
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tuning',
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Hasham Autoplex",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Icon(
                                  FontAwesomeIcons.tags,
                                  size: 18,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "200",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 22,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Islamabad",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

