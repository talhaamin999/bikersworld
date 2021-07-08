import 'package:bikersworld/model/review_model.dart';
import 'package:bikersworld/services/part_store_queries/part_review_query.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/auto_part_ptore_dashboard.dart';

class SearchAutoPartDetailPage extends StatefulWidget {

  final AutoPartModel partDetail;
  SearchAutoPartDetailPage({this.partDetail});

  @override
  _SearchAutoPartDetailPageState createState() => _SearchAutoPartDetailPageState();
}

class _SearchAutoPartDetailPageState extends State<SearchAutoPartDetailPage> {

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
              color: Colors.orange,
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
                color: Colors.white,
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
                  image: NetworkImage(widget.partDetail.imageURL),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Container(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.partDetail.title,
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
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
                                    widget.partDetail.price.toString(),
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "Accessory Information",
                              style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              child:  Row(
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
                                                widget.partDetail.category,
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
                                                widget.partDetail.type,
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
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reviews",
                      style: GoogleFonts.varelaRound(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "4.0 / 5",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              StreamBuilder(
                stream: _partReviews.getAutoPartReviews(partId: widget.partDetail.docId),
                builder: (BuildContext context, AsyncSnapshot<List<Reviews>> snapshot) {
                  if(snapshot.hasData && snapshot.data.isNotEmpty){
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: Container(
         // margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AutoPartStoreDashboardPageNormalUser(partStoreId: widget.partDetail.partStoreId,)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height:60,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Color(0XFF396ca3),  width: 2),
                    color: Color(0XFF396ca3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.home, color: Colors.white,),
                      SizedBox(width: 15,),
                      Text("Check Store",
                        style: GoogleFonts.quicksand(fontSize: 20, color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
