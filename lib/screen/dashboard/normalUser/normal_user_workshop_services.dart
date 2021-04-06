import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/search_queries/search_workshop_service.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalUserWorkshopServices extends StatefulWidget {

  final String workshopId;
  NormalUserWorkshopServices({@required this.workshopId});
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
                        ElectricalTab(workshopId: widget.workshopId,category: 'Electrical',),
                        MechanicalTab(workshopId: widget.workshopId,category: 'Mechanical'),
                        TuningTab(workshopId: widget.workshopId,category: 'Tuning')
                      ],
                      controller: _tabController,
                    ),
      ),
    );
  }
}

class ElectricalTab extends StatelessWidget {
 final String category;
 final String workshopId;
 ElectricalTab({this.workshopId,this.category});

 final _service = SearchWorkshopServices();

 @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: _service.fetchWorkshopServices(workshopId: workshopId,category: category),
      builder: (BuildContext context, AsyncSnapshot<List<Services>> snapshot) {
        if(snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
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
                            leading: Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Icon(
                                FontAwesomeIcons.wrench,
                                color: Colors.black,
                              ),
                            ),
                            title: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                      snapshot.data[index].title,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 15,),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.tags,
                                                size: 18,
                                                color:Colors.grey
                                              ),
                                              SizedBox(width: 15),
                                              Text(
                                                snapshot.data[index].price.toString(),
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
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
          );
        }
        else if(snapshot.hasData && snapshot.data.isEmpty){
          return Text('No Services Found');
        }
        else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      },

    );
  }
}

class MechanicalTab extends StatelessWidget {

  final String category;
  final String workshopId;
  MechanicalTab({this.workshopId,this.category});

  final _service = SearchWorkshopServices();

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: _service.fetchWorkshopServices(workshopId: workshopId,category: category),
      builder: (BuildContext context, AsyncSnapshot<List<Services>> snapshot) {
        if(snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
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
                            leading: Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: Icon(
                                FontAwesomeIcons.wrench,
                                color: Colors.black,
                              ),
                            ),
                            title: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                      snapshot.data[index].title,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.tags,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                snapshot.data[index].price.toString(),
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
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
          );
        }
        else if(snapshot.hasData && snapshot.data.isEmpty){
          return Text('No Services Found');
        }
        else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      },

    );
  }
}

class TuningTab extends StatelessWidget {

  final String category;
  final String workshopId;
  TuningTab({this.workshopId,this.category});

  final _service = SearchWorkshopServices();

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: _service.fetchWorkshopServices(workshopId: workshopId,category: category),
      builder: (BuildContext context, AsyncSnapshot<List<Services>> snapshot) {
        if(snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
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
                            leading: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                FontAwesomeIcons.wrench,
                                color: Colors.black,
                              ),
                            ),
                            title: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:10),
                                    child: Text(
                                      snapshot.data[index].title,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.tags,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                snapshot.data[index].price.toString(),
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
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
          );
        }
        else if(snapshot.hasData && snapshot.data.isEmpty){
          return Center(child :Text('No Services Found'));
        }
        else if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }
        return CircularProgressIndicator();
      },

    );
  }
}
