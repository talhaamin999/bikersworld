import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:bikersworld/services/search_queries/search_part.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';



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
        .push(MaterialPageRoute(builder: (context) => RefineRearchPage(partsSearchFilter: 'auto_parts',)));
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
            color: Colors.orange,
            fontSize: 18,

          ),
        ),
        backgroundColor: Color(0XFF012A4A),
        elevation:0,
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
                margin: EdgeInsets.only(left: 22, right: 30,top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Result: 2",
                        style: GoogleFonts.varelaRound(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 120,),
                    FlatButton(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Filter",
                              style: GoogleFonts.varelaRound(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(
                              FontAwesomeIcons.filter,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      onPressed: (){
                        onPressed: navigateToFilterPage(context);
                      },
                    ),
                  ],
                ),
              ),
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: FlatButton(
              onPressed:(){

              },
              child: Card(
                color: Color(0xfff7f7f7),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/alyrim.jpeg"),
                              ),
                          ),
                        ),
                      ),

                      SizedBox(width: 5,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: AutoSizeText(
                                "Plug",
                                style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Text(
                                      "Islamabad",
                                      style: TextStyle(
                                          fontSize: 15
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 160,),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xffb8b8b8),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 3,),

                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    "OPEN",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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




