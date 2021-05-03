import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/Auto%20Part%20Store%20Normal%20User/autoPartStoreDashboard.dart';
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
    //only if result is not nul and city variable is assigned a value only then map the values
    if(_result != null){
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
      // if city is selected aand also range isentified
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
      // if only city variable filter was selected then on;y map cityFilter value and make title and city boolean options true
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
      // if only sort filter was selected
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
      // if range is selected
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
                        "Result: 3",
                        style: GoogleFonts.varelaRound(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox (width: 120,),
                    FlatButton(
                      onPressed: (){
                        navigateToFilterPage(context);
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              "Filter",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(FontAwesomeIcons.filter, size: 16,),

                          ],
                        ),
                      ),
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
          FutureBuilder(
            future: getAutoParts(),
            builder: (BuildContext context, AsyncSnapshot<List<AutoPartModel>> snapshot) {
              if(snapshot.hasData && snapshot.data.isNotEmpty){
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: FlatButton(
                          onPressed:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AutoPartStoreDashboardPageNormalUser(partStoreId: snapshot.data[index].partStoreId,)));
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
                                            snapshot.data[index].title,
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
                                                  snapshot.data[index].partStoreCity,
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
                                                snapshot.data[index].type,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                snapshot.data[index].price.toString(),
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
                      );
                    }
                );
              }
              else if(snapshot.hasData && snapshot.data.isEmpty) {
                return Center(child: Text("No Data Found"));
              }
              else if(snapshot.data == null) {
                return Center(child: Text("Search Part"));
              }
              else if(snapshot.hasError){
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




