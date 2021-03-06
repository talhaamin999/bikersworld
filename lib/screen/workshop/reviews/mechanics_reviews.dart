import 'package:bikersworld/model/review_model.dart';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/search_queries/search_workshop_mechanics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/rating_bar.dart';


class WorkshopkMechanicsReviews extends StatefulWidget {
  final String workshopId;
  final Mechanics mechanic;

  WorkshopkMechanicsReviews({@required this.mechanic,@required this.workshopId});

  @override
  _WorkshopkMechanicsReviewsState createState() => _WorkshopkMechanicsReviewsState();
}

class _WorkshopkMechanicsReviewsState extends State<WorkshopkMechanicsReviews> {
  int currentIndex;
  final _mechanicReviews = SearchWorkshopMechanics();

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
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Container(
                    child:RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Mechanic ',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Color(0xfff7892b),
                        ),
                        children: [
                          TextSpan(
                              text: 'Reviews',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                color: Colors.black,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      widget.mechanic.name,
                      style: GoogleFonts.quicksand(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      widget.mechanic.contact,
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      widget.mechanic.speciality,
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  FutureBuilder(
                    future: _mechanicReviews.getAverageReviewOfMechanics(mechanicId: widget.mechanic.id, workshopId: widget.workshopId),
                    builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                      if(snapshot.hasData && snapshot.data.sign == 1.0){
                        return Container(
                          child: Text(
                            "${snapshot.data.toStringAsFixed(1)} / 5",
                            style: GoogleFonts.quicksand(
                              fontSize: 30,
                            ),
                          ),
                        );
                      }
                      else{
                        return Container(
                          child: Center(
                            child: Text(
                              "NO MECHANIC REVIEW YET",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30,),
                    alignment: Alignment.topLeft,
                    child: Text("Customer Comments", style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                  ),
                  SizedBox(height: 10,),
// ammar.ahmad0168@gmal.com   ammar123
                  StreamBuilder(
                  stream: _mechanicReviews.fetchWorkshopMechanicsReviews(mechanicId: widget.mechanic.id, workshopId: widget.workshopId),
                  builder: (BuildContext context, AsyncSnapshot<List<Reviews>> snapshot) {
                    if(snapshot.hasData && snapshot.data.isNotEmpty){
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
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
                                title: Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          snapshot.data[index].title,
                                          style: GoogleFonts.raleway(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      RatingsBar(20,userRating: snapshot.data[index].starRating,),
                                      SizedBox(height: 5,),
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
                            ),
                          );
                        },
                      );
                    }else if(snapshot.hasData && snapshot.data.isEmpty){
                      return Center(child: Text('NO REVIEWS FOUND'),);
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }
                    return CircularProgressIndicator();
                  },


                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
