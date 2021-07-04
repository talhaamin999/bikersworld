import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/search_queries/serach_workshop.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/rating_bar.dart';

class WorkshopDashboardReviews extends StatefulWidget {

  final String id;
  WorkshopDashboardReviews({@required this.id});

  @override
  _WorkshopDashboardReviewsState createState() => _WorkshopDashboardReviewsState();
}

class _WorkshopDashboardReviewsState extends State<WorkshopDashboardReviews> {
  int currentIndex;

  TextEditingController _textFieldController = new TextEditingController();
  TabController _tabController;
  final _error = ToastErrorMessage();
  final _shopReview = SearchWorkshop();

  @override
  void initState() {
    super.initState();
    currentIndex = 0;

  }

  Stream<List<WorkshopReviews>> getReviews(){
    try{
      if(widget.id != null){
        return _shopReview.fetchWorkshopReviews(workshopId: widget.id);
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
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
            )        ),
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
                            text: 'Workshop',
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
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "4.0",
                      style: GoogleFonts.hindSiliguri(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RatingsBar(30),
                  SizedBox(
                    height: 20,
                  ),
                  Container(

                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30,),
                    alignment: Alignment.topLeft,
                    child: Text("Customer Reviews", style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  StreamBuilder(
                    stream: getReviews(),
                    builder: (BuildContext context, AsyncSnapshot<List<WorkshopReviews>> snapshot) {
                      if(snapshot.hasData && snapshot.data.isNotEmpty){
                        return ListView.builder(
                            shrinkWrap: true,
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
                                    title: Column(
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
                                        SizedBox(height: 10,),
                                        RatingsBar(20,userRating: snapshot.data[index].starRating,),
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
                            }
                        );
                      }
                      else if(snapshot.hasData && snapshot.data.isEmpty){
                        return Center(child: Text('NO REVIEWS FOUND'),);
                      }
                      else if(snapshot.hasError){
                        return Center(child: Text(snapshot.error.toString(),));
                      }
                      return CircularProgressIndicator();
                    },

                  )

                ],
              ),
            ),
          ),
        ),
        //drawer: Drawer(),
      ),
    );
  }
}

