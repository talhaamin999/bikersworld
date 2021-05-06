import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/part_store_queries/part_review_query.dart';
import 'package:bikersworld/services/part_store_queries/part_store_review_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/rating_bar.dart';


class AutoPartDetail extends StatefulWidget {
  final AutoPartModel autoPartDetails;
  AutoPartDetail({@required this.autoPartDetails});
  @override
  _AutoPartDetailState createState() => _AutoPartDetailState();
}

class _AutoPartDetailState extends State<AutoPartDetail> {

  final _partReviews = ReviewAutoPartQueries();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Color(0xfff2f2f2),
                child: Image(
                  image: NetworkImage(widget.autoPartDetails.imageURL),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Text(
                        "Information",
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              widget.autoPartDetails.title,
                              style: GoogleFonts.quicksand(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Category",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              widget.autoPartDetails.category,
                              style: GoogleFonts.quicksand(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Type",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              widget.autoPartDetails.type,
                              style: GoogleFonts.quicksand(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Price",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              widget.autoPartDetails.price.toString(),
                              style: GoogleFonts.quicksand(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child:  Text(
                  "Reviews",
                  style: GoogleFonts.varelaRound(
                    fontSize: 20,
                  ),
                ),
              ),

              FutureBuilder(
                future: _partReviews.getAutoPartReviews(partId: widget.autoPartDetails.docId),
                builder: (BuildContext context, AsyncSnapshot<List<AutoPartReviews>> snapshot) {
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              leading: CircleAvatar (
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
                    return Center(child: Text("NO REVIEWS ADDED YET"),);
                  }
                  else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

