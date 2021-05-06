import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/reviews_auto_part_form.dart';
import 'package:bikersworld/services/part_store_queries/part_review_query.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auto_part_ptore_dashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AutoPartDetail extends StatelessWidget {
  final AutoPartModel partDetails;
  AutoPartDetail(this.partDetails);

  final _partReviews = ReviewAutoPartQueries();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BIKERSWORLD',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0XFF012A4A),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.orange,),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mediaQuery.size.height / 3.4,
            child: FadeAnimation(
                1.2,
                Container(
                 color: Color(0xfffafafa),
                  child: FadeAnimation(1.3,
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20,),
                        child: Image.network(
                          partDetails.imageURL,
                        ),
                      ),
                    ),
                  ),
                )),
          ),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height / 1.6,
              child: FadeAnimation(
                  1.2,
                  Container(
                      padding: const EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            1.3,
                            Text(
                              partDetails.title,
                              style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: 22,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          FadeAnimation(1.3,
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    "PKR",
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    partDetails.price.toString(),
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),
                          FadeAnimation(1.3,
                              Text(
                                "Accessory Information",
                                style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                          ),
                          SizedBox(height: 15,),
                          FadeAnimation(1.3,
                            Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.cogs),
                                      SizedBox(width: 8,),
                                      SizedBox(width: 18,),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[Text(
                                            "Category",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                            ),
                                          ),
                                            SizedBox(height: 5,),
                                            Text(
                                              partDetails.category,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.tumblrSquare),
                                      SizedBox(width: 18,),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[Text(
                                            "Type",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                            ),
                                          ),
                                            SizedBox(height: 5,),
                                            Text(
                                              partDetails.type,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
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
                          ),
                          SizedBox(height: 20,),

                          FadeAnimation(
                            1.2,
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Reviews',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FlatButton(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Icon(
                                          Icons.plus_one,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReviewAutoPart(
                                                      partDetails.docId)));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                            future: _partReviews.getAutoPartReviews(partId: partDetails.docId),
                            builder: (BuildContext context, AsyncSnapshot<List<AutoPartReviews>> snapshot) {
                              if(snapshot.hasData && snapshot.data.isNotEmpty){
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return FadeAnimation(
                                      1.2,
                                      Container(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            leading: CircleAvatar(
                                              child: CircleAvatar(
                                                backgroundImage:
                                                AssetImage("assets/user.png"),
                                                radius: 25,
                                                backgroundColor: Colors.white,
                                              ),
                                              radius: 30,
                                              backgroundColor: Colors.orange,
                                            ),
                                            title: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  child: Text(
                                                    snapshot.data[index].title,
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                RatingsBar(snapshot.data[index].starRating,userRating: 20, ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  snapshot.data[index].description,
                                                  style: GoogleFonts.raleway(
                                                    fontSize: 15,
                                                    color: Colors.grey,
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
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ))),
              ),
          ),
        ],
      ),
    );
  }
}
