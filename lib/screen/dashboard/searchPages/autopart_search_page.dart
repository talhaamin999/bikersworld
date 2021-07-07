import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';
import 'package:bikersworld/services/part_store_queries/part_review_query.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:bikersworld/services/search_queries/search_part.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/dashboard/searchPages/search_auto_part_detail_page.dart';
import 'package:bikersworld/widgets/rating_bar.dart';



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
  final _partAVGReview = ReviewAutoPartQueries();
  //PaginateRefreshedChangeListener refreshChangeListener = PaginateRefreshedChangeListener();


  Future<List<AutoPartModel>> getAutoParts(){
    if(partTitleSearchOption && filterTypeOption && filterRange && filterSortOption && filterCityOption){
      return _searchPart.searchPartByTitleWithCityAndTypeAndRangeAndSortOrderFilters(title: _controller.text, city: cityFilterValue, type: typeFilterValue, min: minRangeFilterValue, max: maxRangeFilterValue, sortOrder: sortFilterValue);
    }
    else if(partTitleSearchOption && filterCityOption && filterTypeOption && filterRange){
      return _searchPart.searchPartByTitleWithCityAndTypeAndRangeFilters(title: _controller.text, city: cityFilterValue, type: typeFilterValue, min: minRangeFilterValue, max: maxRangeFilterValue);
    }
    else if(partTitleSearchOption && filterCityOption && filterTypeOption && filterSortOption){
      return _searchPart.searchPartByTitleWithCityAndTypeAndSortOrderFilters(title: _controller.text, city: cityFilterValue, type: typeFilterValue,sortOrder: sortFilterValue);
    }
    else if(partTitleSearchOption && filterTypeOption && filterSortOption && filterRange){
      return _searchPart.searchPartByTitleWithTypeAndRangeAndSortFilter(title: _controller.text, type: typeFilterValue,sortOrder: sortFilterValue,min: minRangeFilterValue,max: maxRangeFilterValue);
    }
    else if(partTitleSearchOption && filterTypeOption && filterSortOption && filterRange){
      return _searchPart.searchPartByTitleWithTypeAndRangeAndSortFilter(title: _controller.text, type: typeFilterValue,sortOrder: sortFilterValue,min: minRangeFilterValue,max: maxRangeFilterValue);
    }
    else if(partTitleSearchOption && filterCityOption && filterTypeOption){
      print("city and type");
      return _searchPart.searchPartByTitleWithCityAndTypeFilter(title: _controller.text, type: typeFilterValue,city: cityFilterValue);
    }
    else if(partTitleSearchOption && filterCityOption && filterRange){
      return _searchPart.searchPartByTitleWithCityAndRangeFilter(title: _controller.text,city: cityFilterValue,min: minRangeFilterValue,max: maxRangeFilterValue);
    }
    else if(partTitleSearchOption && filterCityOption && filterSortOption){
      print("city with sort");
      return _searchPart.searchPartByTitleWithCityAndSortOrderFilters(title: _controller.text,city: cityFilterValue,sortOrder: sortFilterValue);
    }
    else if(partTitleSearchOption && filterTypeOption && filterRange){
      print("type with Range");
      return _searchPart.searchPartByTitleWithTypeAndRangeFilter(title: _controller.text,type: typeFilterValue,min: minRangeFilterValue,max: maxRangeFilterValue);
    }
    else if(partTitleSearchOption && filterTypeOption && filterSortOption){
      print("type with Sort");
      return _searchPart.searchPartByTitleWithTypeAndSortFilter(title: _controller.text,type: typeFilterValue,sortOrder: sortFilterValue);
    }
    else if(partTitleSearchOption && filterRange && filterSortOption){
      print("range with Sort");
      return _searchPart.searchPartByTitleWithRangeAndSortFilter(title: _controller.text,min: minRangeFilterValue,max: maxRangeFilterValue,sortOrder: sortFilterValue);
    }
    else if(partTitleSearchOption && filterCityOption){
      print("city filter only");
      return _searchPart.searchPartByTitleWithCityFilter(title: _controller.text,city: cityFilterValue);
    }
    else if(partTitleSearchOption && filterTypeOption){
      print("type filter only");
      return _searchPart.searchPartByTitleWithType(title: _controller.text,type: typeFilterValue);
    }
    else if(partTitleSearchOption && filterRange){
      print("range filter only");
      return _searchPart.searchPartByTitleWithRangeFilter(title: _controller.text,min: minRangeFilterValue,max: maxRangeFilterValue);
    }
    else if(partTitleSearchOption && filterSortOption){
      print("sort filter only");
      return _searchPart.searchPartByTitleWithSortFilter(title: _controller.text,sortOrder: sortFilterValue);
    }
    else if(partTitleSearchOption){
      return _searchPart.searchPartByTitle(title: _controller.text);
    }
  }


  navigateToFilterPage(BuildContext context) async{
    final RefineSearchResults _result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RefineRearchPage(partsSearchFilter: 'parts',)));
    // only chekc for further conditions if the Navigator.pop() method returns some result
    if(_result != null){
      // check if all the filters options have been selected
      if(_result.city != null && _result.type != null && _result.minRange != null && _result.maxRange != null && _result.sortOrder != null){
        setState(() {
          typeFilterValue = _result.type;
          cityFilterValue = _result.city;
          sortFilterValue = _result.sortOrder;
          minRangeFilterValue = int.tryParse(_result.minRange);
          maxRangeFilterValue = int.tryParse(_result.maxRange);
          partTitleSearchOption = true;
          filterCityOption = true;
          filterTypeOption = true;
          filterSortOption = true;
          filterRange = true;
        });
      }
      // check if city type and range filters options have been selected
      else if(_result.city != null && _result.type != null && _result.minRange != null && _result.maxRange != null){
        setState(() {
          cityFilterValue = _result.city;
          typeFilterValue = _result.type;
          minRangeFilterValue = int.tryParse(_result.minRange);
          maxRangeFilterValue = int.tryParse(_result.maxRange);
          partTitleSearchOption = true;
          filterCityOption = true;
          filterTypeOption = true;
          filterSortOption = false;
          filterRange = true;
        });
      }
      // check if city type and sort filters options have been selected
      else if(_result.city != null && _result.type != null && _result.sortOrder != null){
        setState(() {
          cityFilterValue = _result.city;
          typeFilterValue = _result.type;
          sortFilterValue = _result.sortOrder;
          partTitleSearchOption = true;
          filterCityOption = true;
          filterTypeOption = true;
          filterSortOption = true;
          filterRange = false;
        });
        print('${_result.city} ${_result.sortOrder}');
      }
      //check if city sort and range filters options have been selected
      else if(_result.city != null && _result.sortOrder != null && _result.minRange != null && _result.maxRange != null){
        setState(() {
          cityFilterValue = _result.city;
          sortFilterValue = _result.sortOrder;
          minRangeFilterValue = int.tryParse(_result.minRange);
          maxRangeFilterValue = int.tryParse(_result.maxRange);
          partTitleSearchOption = true;
          filterCityOption = true;
          filterTypeOption = false;
          filterSortOption = true;
          filterRange = true;
        });
      }
      // check if type range and sort filters options have been selected
      else if(_result.type != null && _result.sortOrder != null && _result.minRange != null && _result.maxRange != null){
        setState(() {
          typeFilterValue = _result.type;
          sortFilterValue = _result.sortOrder;
          minRangeFilterValue = int.tryParse(_result.minRange);
          maxRangeFilterValue = int.tryParse(_result.maxRange);
          partTitleSearchOption = true;
          filterCityOption = false;
          filterTypeOption = true;
          filterSortOption = true;
          filterRange = true;
        });
      }
      // check if city and type filters options have been selected
      else if(_result.city != null && _result.type != null){
        setState(() {
          cityFilterValue = _result.city;
          partTitleSearchOption = true;
          filterCityOption = true;
          filterTypeOption = true;
          filterSortOption = false;
          filterRange = false;
        });
      }
      // check if city and range filters options have been selected
      else if(_result.city != null && _result.minRange != null && _result.maxRange != null){
        setState(() {
          cityFilterValue = _result.city;
          minRangeFilterValue = int.tryParse(_result.minRange);
          maxRangeFilterValue = int.tryParse(_result.maxRange);
          partTitleSearchOption = true;
          filterCityOption = true;
          filterTypeOption = false;
          filterSortOption = false;
          filterRange = true;
        });
        print(_result.sortOrder);
      }
      // check if city and sort filters options have been selected
      else if(_result.city != null && _result.sortOrder != null){
        setState(() {
          cityFilterValue = _result.city;
          sortFilterValue = _result.sortOrder;
          partTitleSearchOption = true;
          filterCityOption = true;
          filterTypeOption = false;
          filterSortOption = true;
          filterRange = false;
        });
      }
      // check if type and sort filters options have been selected
      else if(_result.type != null && _result.sortOrder != null){
        setState(() {
          typeFilterValue = _result.type;
          sortFilterValue = _result.sortOrder;
          partTitleSearchOption = true;
          filterCityOption = false;
          filterTypeOption = true;
          filterSortOption = true;
          filterRange = false;
        });
      }
      // check if type and range filters options have been selected
      else if(_result.type != null && _result.minRange != null && _result.maxRange != null){
        setState(() {
          typeFilterValue = _result.type;
          minRangeFilterValue = int.tryParse(_result.minRange);
          maxRangeFilterValue = int.tryParse(_result.maxRange);
          partTitleSearchOption = true;
          filterCityOption = false;
          filterTypeOption = true;
          filterSortOption = false;
          filterRange = true;
        });
      }
      // check if sort and range filters options have been selected
      else if(_result.sortOrder != null && _result.minRange != null && _result.maxRange != null){
        setState(() {
          sortFilterValue = _result.sortOrder;
          minRangeFilterValue = int.tryParse(_result.minRange);
          maxRangeFilterValue = int.tryParse(_result.maxRange);
          partTitleSearchOption = true;
          filterCityOption = false;
          filterTypeOption = false;
          filterSortOption = true;
          filterRange = true;
        });
      }
      // check if city filters options have been selected
      else if(_result.city != null){
        setState(() {
          cityFilterValue = _result.city;
          partTitleSearchOption = true;
          filterCityOption = true;
          filterTypeOption = false;
          filterSortOption = false;
          filterRange = false;
        });
      }
      // check if type filters options have been selected
      else if(_result.type != null){
        setState(() {
          typeFilterValue = _result.type;
          partTitleSearchOption = true;
          filterCityOption = false;
          filterTypeOption = true;
          filterSortOption = false;
          filterRange = false;
        });
      }
      // check if range filters options have been selected
      else if(_result.minRange != null && _result.maxRange != null){
        setState(() {
          minRangeFilterValue = int.tryParse(_result.minRange);
          maxRangeFilterValue = int.tryParse(_result.maxRange);
          partTitleSearchOption = true;
          filterCityOption = false;
          filterTypeOption = false;
          filterSortOption = false;
          filterRange = true;
        });
      }
      // check if sort filters options have been selected
      else if(_result.sortOrder != null){
        setState(() {
          sortFilterValue = _result.sortOrder;
          partTitleSearchOption = true;
          filterCityOption = false;
          filterTypeOption = false;
          filterSortOption = true;
          filterRange = false;
        });
      }
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
        iconTheme: IconThemeData(color: Color(0xfffbb448)),
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                color: Color(0XFF012A4A),
                child: Padding(
                 padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
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
                              const Radius.circular(10),
                            ),
                          ),
                          filled: true,
                          hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                          hintText: "Type Part Name",
                          contentPadding: EdgeInsets.only(top: 7),
                          prefixIcon: Icon(Icons.search, size: 25,),
                          fillColor: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0xffb6b6b8),
                          blurRadius: 10,
                          offset: Offset(0.2, 0.75)
                      )
                    ],
                    color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:15,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Results",
                              style: GoogleFonts.varelaRound(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "30",
                              style: GoogleFonts.varelaRound(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          navigateToFilterPage(context);
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Filter",
                                style: GoogleFonts.varelaRound(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Icon(FontAwesomeIcons.filter, size: 15,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(height: 30,),

           FutureBuilder(
             future: getAutoParts(),
             builder: (BuildContext context, AsyncSnapshot<List<AutoPartModel>> snapshot) {
               if (snapshot.hasData && snapshot.data.isNotEmpty) {
                 return ListView.builder(
                     shrinkWrap: true,
                     itemCount: snapshot.data.length,
                     itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.only(bottom: 15),
                         child: FlatButton(
                           onPressed: () {
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) =>
                                     SearchAutoPartDetailPage(
                                       partDetail: snapshot.data[index],)));
                           },
                           child: Card(
                             color: Color(0xfff7f7f7),
                             child: Container(
                               child: Row(
                                 children: <Widget>[
                                   Container(
                                       width: 100,
                                       height: 100,
                                       decoration: BoxDecoration(
                                           shape: BoxShape.rectangle,
                                           image: DecorationImage(
                                             fit: BoxFit.fill,
                                             image: NetworkImage(
                                                 snapshot.data[index]
                                                     .imageURL),)
                                       )
                                   ),
                                   SizedBox(width: 15,),
                                   Container(
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
                                       children: <Widget>[
                                         SizedBox(
                                           width: 210.0,
                                           height: 25.0,
                                           child: AutoSizeText(
                                             snapshot.data[index].title,
                                             style: GoogleFonts.quicksand(
                                               fontSize: 18,
                                               color: Colors.black,
                                             ),
                                             maxLines: 2,
                                           ),
                                         ),
                                         SizedBox(height: 5,),
                                         Container(
                                           child: Row(
                                             children: [
                                               Text(
                                                 "PKR",
                                                 style: GoogleFonts
                                                     .quicksand(
                                                   fontSize: 15,
                                                   color: Colors.black,
                                                   fontWeight: FontWeight
                                                       .bold,
                                                 ),
                                               ),
                                               SizedBox(width: 6,),
                                               Text(
                                                 snapshot.data[index].price
                                                     .toString(),
                                                 style: GoogleFonts
                                                     .quicksand(
                                                   fontSize: 15,
                                                   color: Colors.black,
                                                   fontWeight: FontWeight
                                                       .bold,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),

                                         SizedBox(height: 3,),
                                         SizedBox(
                                           width: 210.0,
                                           height: 25.0,
                                           child: AutoSizeText(
                                             snapshot.data[index].category,
                                             style: GoogleFonts.quicksand(
                                               fontSize: 15,
                                               color: Colors.black,
                                             ),
                                             maxLines: 2,
                                           ),
                                         ),
                                         FutureBuilder(
                                           future: _partAVGReview.getAverageReviewOfAutoParts(partId: snapshot.data[index].docId),
                                           builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                             if(snapshot.hasData && (snapshot.data.sign == 1.0)){
                                               return Container(
                                                   alignment:Alignment.bottomRight,
                                                   child: StarDisplay(userRating:snapshot.data));
                                             }else{
                                               return Text("NO REVIEWS",style: GoogleFonts.raleway(fontSize: 12,color: Colors.red, fontWeight: FontWeight.w600),);
                                             }
                                           },
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
                       );
                     }
                 );
               }
               else if (snapshot.hasData && snapshot.data.isEmpty) {
                 return Center(child: Text("No Data Found"));
               }
               else if (snapshot.data == null) {
                 return Center(child: Text(""));
               }
               else if (snapshot.hasError) {
                 return Center(child: Text(snapshot.error.toString()));
               }
               return Center(child: CircularProgressIndicator());
             },
           ),

            ],
          ),
        ),

      ),
    );
  }
}

/*
*  PaginateRefreshedChangeListener refreshChangeListener = PaginateRefreshedChangeListener();

      RefreshIndicator(
        child: PaginateFirestore(
          itemBuilder: (context, documentSnapshot) => ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(documentSnapshot.data['name']),
            subtitle: Text(documentSnapshot.documentID),
          ),
          // orderBy is compulsary to enable pagination
          query: Firestore.instance.collection('users').orderBy('name'),
          listeners: [
            refreshChangeListener,
          ],
        ),
        onRefresh: () async {
          refreshChangeListener.refreshed = true;
        },
      )*/