import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/screen/dashboard/normalUser/reviews/workshop_feedback_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ReviewFromUser extends StatefulWidget {
  final String workshopDocId;
  ReviewFromUser({this.workshopDocId});
  @override
  _ReviewFromUserState createState() => _ReviewFromUserState();
}

class _ReviewFromUserState extends State<ReviewFromUser> {
  int _checkboxValue;
  String id;
  final _workshopCollection = 'workshop';
  final _workshopReviewsCollection = 'workshop_reviews';
  final _error = ToastErrorMessage();

  void mapId(){
    if(widget.workshopDocId != null){
      id = widget.workshopDocId;
    }
  }
  @override
  void initState() {
    mapId();
    super.initState();
  }

  Stream<List<WorkshopReviews>> getReviews(){
    final CollectionReference _collectionReference = FirebaseFirestore.instance
        .collection(_workshopCollection)
        .doc(id)
        .collection(_workshopReviewsCollection);
    try {
      return _collectionReference
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
          .map((doc) => WorkshopReviews.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff0f0f0),
      appBar:AppBar(
        title: Text(
          'BIKERSWORLD',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0XFF012A4A),
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
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:15, top:15),
                child: Container(
                  child: RichText(
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
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:1),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "4.0",
                        style: GoogleFonts.quicksand(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingsBar(30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(right:15,bottom:10),
                child: FlatButton(
                  onPressed: (){
                    print(id);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopFeedbackForm(workshopDocId: id,)));
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffedb97e),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.edit,color: Colors.white, size: 20,),
                        SizedBox(width: 10,),
                        Text("Review", style: GoogleFonts.quicksand(fontSize: 18,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height:15),

                  StreamBuilder(
                    stream: getReviews(),
                    builder: (BuildContext context, AsyncSnapshot<List<WorkshopReviews>> snapshot) {
                      if(snapshot.hasData && snapshot.data.isNotEmpty){
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: EdgeInsets.only(left:10,right:10,bottom:5),
                                child: Center(
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[

                                        Container(
                                          child:ListTile(
                                            leading: CircleAvatar(
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage("assets/user.png"),
                                                radius: 25,
                                                backgroundColor: Colors.white,
                                              ),
                                              radius: 30,
                                              backgroundColor: Colors.orange,
                                            ),
                                            title: snapshot.data != null ?
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 15,),
                                                  Text(snapshot.data[index].title, style:GoogleFonts.quicksand(fontSize:18, fontWeight: FontWeight.bold),),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:2,bottom: 5),
                                                    child: RatingsBar(25,userRating: snapshot.data[index].starRating,),
                                                  ),
                                                ],
                                              ),
                                            ):
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("title"),
                                                  RatingsBar(25),
                                                ],
                                              ),
                                            ),
                                            subtitle: snapshot.data != null ? Text(snapshot.data[index].description , style: GoogleFonts.quicksand(fontSize:18),) : Text("SA card is a sheet used to represent the information related to each other, such as an album, a geographical loca   heet used to represent the information related to each other, such as an album, a geographical location, contation, contact details,"),
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
                        return Center(child: Text('No Reviews Yet'),);
                      }
                      else if(snapshot.hasError){
                        return Center(child: Text(snapshot.error.toString()),);
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
              SizedBox(height: 30,),

            ],
          ),
      ),
      ),
    );
  }
}

