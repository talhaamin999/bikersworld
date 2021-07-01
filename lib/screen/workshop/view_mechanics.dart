import 'dart:async';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/workshop/add_mechanics.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/workshop_queries/mechanic_queries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/workshop/reviews/mechanics_reviews.dart';

class ViewMechanics extends StatefulWidget {
  final String workshopId;
  ViewMechanics({@required this.workshopId});
  @override
  _ViewMechanicsState createState() => _ViewMechanicsState();
}

class _ViewMechanicsState extends State<ViewMechanics> {
  int currentIndex;

  TextEditingController _textFieldController = new TextEditingController();
  TabController _tabController;
  final RegisterMechanicQueries _mechanic = RegisterMechanicQueries();


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

  Future<void> deleteDocument({@required int index}) async {
    try {
      await _mechanic.deleteMechanic(index);
      if (RegisterMechanicQueries.deletionResultMessage ==
          'Mechanic deleted successfully') {
        final _valid = ToastValidMessage();
        _valid.validToastMessage(
            validMessage: RegisterMechanicQueries.deletionResultMessage);
      } else {
        final _error = ToastErrorMessage();
        _error.errorToastMessage(
            errorMessage: RegisterMechanicQueries.deletionResultMessage);
      }
    } catch (e) {
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    bool isVisible = false;

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
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            )),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: RichText(
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
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<List<Mechanics>>(
                  stream: _mechanic.getMechanics(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 15, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              SizedBox(
                                                child: CircleAvatar(
                                                  radius: 25.0,
                                                  backgroundColor: Colors.indigo,
                                                  child: Icon(
                                                    FontAwesomeIcons.user,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15,),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data[index].name,
                                                      style: GoogleFonts.raleway(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0XFF012A4A),
                                                      ),
                                                    ),
                                                    snapshot.data[index].mechanicStatus ? Text(
                                                      "Avaliable",style: GoogleFonts.quicksand(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),
                                                    ):Text(
                                                      "Not Avaliable",style: GoogleFonts.quicksand(fontSize: 15,color: Colors.red, fontWeight: FontWeight.bold),
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
                                  SizedBox(
                                    height: 10,
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
                                              SizedBox(
                                                width: 5,
                                              ),
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WorkshopkMechanicsReviews(mechanic: snapshot.data[index],workshopId: widget.workshopId,)));
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
                                              SizedBox(
                                                width: 5,
                                              ),
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
                                            final Mechanics mec = Mechanics(name: snapshot.data[index].name,contact: snapshot.data[index].contact,speciality: snapshot.data[index].speciality);
                                            Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) => AddMechanics(mechanics: mec,index: index,)));
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
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                "Delete",
                                                style: GoogleFonts.raleway(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            print("hello");
                                            deleteDocument(index: index);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasData && snapshot.data.isEmpty){
                      return Center(
                        child: Text("No Mechanics Added"),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
                SizedBox(height: 30,),
                //SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
