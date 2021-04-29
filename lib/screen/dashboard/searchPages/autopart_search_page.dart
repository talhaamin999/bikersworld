import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:bikersworld/services/search_queries/search_part.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/widgets/customtiextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/widgets/customeTextArea.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bikersworld/screen/dashboard/Autopart/partDetail.dart';



class AutoPartSearchPage extends StatefulWidget {
  @override
  _AutoPartSearchPageState createState() => _AutoPartSearchPageState();
}

class _AutoPartSearchPageState extends State<AutoPartSearchPage> {
  final _controller = TextEditingController();
  final _searchPart = SearchAutoParts();
  final _error = ToastErrorMessage();
  String cityFilterValue,sortFilterValue,typeFilterValue;
  int minRangeFilterValue,maxRangeFilterValue;
  bool partTitleSearchOption = false;
  bool filterCityOption = false;
  bool filterTypeOption = false;
  bool filterSortOption = false;
  bool filterRange = false;


  navigateToFilterPage(BuildContext context) async{
    final RefineSearchResults _result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RefineRearchPage(partsSearchFilter: 'parts',)));
    if(_result != null){
      print('$_result');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        iconTheme: IconThemeData(color: Color(0xfffbb448),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 85,
                width: MediaQuery.of(context).size.width,
                color: Color(0XFF012A4A),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 15),
                  child: Container(
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      controller: _controller,
                      onSubmitted: (value) {
                        print(_controller.text);
                        if(_controller.text.isNotEmpty) {
                          setState(() {
                            partTitleSearchOption = true;
                            filterCityOption = false;
                            filterSortOption = false;
                            filterRange = false;
                            filterTypeOption = false;
                          });
                        }
                        else{
                          setState(() {
                            partTitleSearchOption = false;
                            filterCityOption = false;
                            filterSortOption = false;
                            filterRange = false;
                            filterTypeOption = false;
                          });
                        }
                      },
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50),
                            ),
                          ),
                          filled: true,
                          hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                          hintText: "Type Service Name",
                          prefixIcon: Icon(Icons.search, size: 25,),
                          fillColor: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Result: 2",
                        style: GoogleFonts.varelaRound(
                          fontSize: 15,

                        ),
                      ),
                    ),
                    SizedBox(width: 120,),
                    FlatButton(
                      onPressed: navigateToFilterPage(context),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Filter",
                              style: GoogleFonts.varelaRound(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(
                              FontAwesomeIcons.filter,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child:Row(
                        children: <Widget>[
                          Text(
                            "Sort",
                            style: GoogleFonts.varelaRound(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Icon(
                            FontAwesomeIcons.sortAlphaUp,
                            size: 17,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23,),
                alignment: Alignment.topLeft,
                child: Text("Search Result", style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),

              SizedBox(height: 20,),
              
              Card(
                child: Column(
                  children: <Widget>[
                    _buildCard("Tire", "2000", "assets/part3.jpeg",'Mechanical', 'Geniune','Out of Stock', false, false, context),
                    _buildCard("Hydrulic", "2000", "assets/part4.jpeg",'Mechanical',  'Geniune','Out of Stock', true, false, context),
                    _buildCard("Rim", "2000", "assets/part2.jpeg",'Mechanical',  'Geniune','Out of Stock', false, true, context),

                  ],
                ),
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}





Widget _buildCard(String name, String price, String imgPath,String category, String type, String status, bool added,
    bool isFavorite, context) {
  return Padding(
    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => partDetail(
              assetPath: imgPath,
              partprice:price,
              partname: name,
              partCateogry: category,
            partType: type,
            partStauts: status,
          ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white
        ),
        child: Row(
          children: [
          Hero(
            tag: imgPath,
            child: Container(
              height: 115.0,
              width: 145.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                ),
              ),
            ),
           ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            name,
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
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
                          SizedBox(width: 10,),
                          Text(
                            price,
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
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
                          SizedBox(width: 10,),
                          Text(
                            category,
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      margin: EdgeInsets.only(left: 170),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.indigo,
                      ),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),

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


class ratingBar extends StatelessWidget {
  const ratingBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 4,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}








