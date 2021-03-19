import 'dart:async';

import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/workshop_queries/mechanic_queries.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/workshop/reviews/mechanicsReviews.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ViewMechanics extends StatefulWidget {
  @override
  _ViewMechanicsState createState() => _ViewMechanicsState();
}

class _ViewMechanicsState extends State<ViewMechanics> {
  int currentIndex;

  TextEditingController _textFieldController = new TextEditingController();
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  final RegisterMechanicQueries _mechanic = RegisterMechanicQueries();
  @override
  Widget build(BuildContext context) {

    bool isVisible = false;

    return MaterialApp(
      home: Scaffold(
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
            )
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    child:RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'View',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: ' Mechanics',
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

                SizedBox(height: 10,),
                StreamBuilder<List<Mechanics>>(
                  stream: _mechanic.getMechanics(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                /*      return Container(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text(snapshot.data[0].name,
                                    style: TextStyle(fontSize: 20)),
                                subtitle: Text('03355437782',
                                  style: TextStyle(fontSize: 17),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Colors.orange,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            "Info",
                                            style: GoogleFonts.raleway(
                                              fontSize: 17,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    mechanicsReviews()));
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    RaisedButton(
                                      color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            "Edit",
                                            style: GoogleFonts.raleway(
                                              fontSize: 17,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        /* ... */
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    RaisedButton(
                                      color: Colors.red,
                                      child: Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.userMinus,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 16,),
                                          Text(
                                            "Delete",
                                            style: GoogleFonts.raleway(
                                              fontSize: 17,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        /* ... */
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );*/

                     return ListView.builder(
                         shrinkWrap: true,
                         itemCount: snapshot.data.length,
                         itemBuilder: (context,index){
                            return ListTile(
                                trailing:
                                Icon(Icons.edit, color: Theme.of(context).accentColor),
                           title: Text(snapshot.data[index].name));
                         });
                    }
                    else if(snapshot.connectionState == ConnectionState.active){
                      /*
                      return Container(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text(snapshot.data[0].name,
                                    style: TextStyle(fontSize: 20)),
                                subtitle: Text('03355437782',
                                  style: TextStyle(fontSize: 17),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Colors.orange,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            "Info",
                                            style: GoogleFonts.raleway(
                                              fontSize: 17,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    mechanicsReviews()));
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    RaisedButton(
                                      color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            "Edit",
                                            style: GoogleFonts.raleway(
                                              fontSize: 17,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        /* ... */
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    RaisedButton(
                                      color: Colors.red,
                                      child: Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.userMinus,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 16,),
                                          Text(
                                            "Delete",
                                            style: GoogleFonts.raleway(
                                              fontSize: 17,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        /* ... */
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      */
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                            return ListTile(
                                trailing: Text(snapshot.data[index].name),
                                title: Text(snapshot.data[index].name)
                            );
                          });
                    }
                    return CircularProgressIndicator();
                 },
                ),
                SizedBox(height: 30,),
                FlatButton(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                    child: Text(
                      'Back',
                      style: GoogleFonts.krub(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),

                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
