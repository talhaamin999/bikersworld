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
                    text: "Electrical",
                    icon: Icon(FontAwesomeIcons.bolt),
                  ),
                  Tab(
                    text: "Mechanical",
                    icon: Icon(FontAwesomeIcons.cogs),
                  ),
                  Tab(
                    text: "Tuning",
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


      ],
    );
  }
}

