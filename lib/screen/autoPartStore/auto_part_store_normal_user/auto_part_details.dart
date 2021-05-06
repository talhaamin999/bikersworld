import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/reviews_auto_part_form.dart';
import 'package:bikersworld/services/part_store_queries/part_review_query.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auto_part_ptore_dashboard.dart';

class AutoPartDetail extends StatelessWidget {
  final AutoPartModel partDetails;
  AutoPartDetail(this.partDetails);

  final _partReviews = ReviewAutoPartQueries();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mediaQuery.size.height / 3,
            child: FadeAnimation(
                1.2,
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          colors: [
                        Color.fromRGBO(251, 121, 155, 1),
                        Color.fromRGBO(251, 53, 105, 1)
                      ])),
                  child: Transform.translate(
                    offset: Offset(30, -30),
                    child:
                        FadeAnimation(1.3, Image.network(partDetails.imageURL)),
                  ),
                )),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height / 1.4,
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                              1.3,
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.tag,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      partDetails.price.toString(),
                                      style: GoogleFonts.varelaRound(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            1.3,
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.cogs,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    partDetails.category,
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            1.4,
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean at elit lectus. Nulla tincidunt sapien non viverra pellentesque. Nam maximus condimentum arcu sit amet hendrerit.",
                              style: GoogleFonts.varelaRound(
                                color: Color.fromRGBO(51, 51, 51, 0.54),
                                height: 1.4,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
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
                                                  height: 10,
                                                ),
                                                RatingsBar(snapshot.data[index].starRating),
                                                SizedBox(
                                                  height: 10,
                                                ),
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
                      ))))),
        ],
      ),
    );
  }
}
