import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:bikersworld/services/search_queries/search_workshop_service.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';


class ServiceSearcPage extends StatefulWidget {
  @override
  _ServiceSearcPageState createState() => _ServiceSearcPageState();
}

class _ServiceSearcPageState extends State<ServiceSearcPage> {
  final _controller = TextEditingController();
  final _service = SearchWorkshopServices();
  final _error = ToastErrorMessage();
  String cityFilter,sortFilter;
  int minRangeFilter,maxRangeFilter;
  bool serviceTitleSearchOption = false;
  bool filterCityOption = false;
  bool filterSortOption = false;
  bool filterRange = false;

  Stream<List<Services>> getServicesByTitle(){
    try{
      // search by service title and apply All the filters
      if(serviceTitleSearchOption && filterCityOption && filterSortOption
      && filterRange){
        return _service.searchServiceTitleWithRangeAndCityAndSortFilter(title: _controller.text, city: cityFilter, sortOrder: sortFilter, min: minRangeFilter,max: maxRangeFilter);
      }
      // search service title by applying city and sort filter
      else if(serviceTitleSearchOption && filterCityOption && filterSortOption){
        return _service.searchServiceTitleWithCityFilterAndSort(title: _controller.text, city: cityFilter, sortOrder: sortFilter);
      }
      //search by title and apply city and range filter
      else if(serviceTitleSearchOption && filterCityOption && filterRange){
        return _service.searchServiceTitleWithRangeAndCityFilter(title: _controller.text, city: cityFilter, min: minRangeFilter, max: maxRangeFilter);
      }
      // search by title and apply sort and range filters
      else if(serviceTitleSearchOption && filterSortOption && filterRange){
        return _service.searchServiceTitleWithRangeAndSortFilter(title: _controller.text, sortOrder: sortFilter, min: minRangeFilter, max: maxRangeFilter);
      }
      // search by service title and apply city filter
      else if(serviceTitleSearchOption && filterCityOption){
        return _service.searchServiceTitleWithCityFilter(title: _controller.text, city: cityFilter);
      }
      // search by service title and apply sort filter
      else if(serviceTitleSearchOption && filterSortOption){
        return _service.searchServiceTitleWithSort(title: _controller.text, sortOrder: sortFilter);
      }
      // search with title and range
      else if(serviceTitleSearchOption && filterRange){
        print("hello world");
        return _service.searchServiceTitleWithRangeFilter(title: _controller.text, min: minRangeFilter, max: maxRangeFilter);
      }
      // search by service title
      else if(serviceTitleSearchOption){
        return _service.searchWorkshopByServiceTitle(title: _controller.text);
      }

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return null;
  }


  navigateToFilterPage(BuildContext context) async{
    final RefineSearchResults _result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RefineRearchPage(workshopServiceSearchFilter: 'service',)));
    if(_result != null){
      // if result variables city and order were assigned then map values and make filter true
      if(_result.city != null && _result.minRange != null && _result.maxRange != null && _result.sortOrder != null){
        setState(() {
          cityFilter = _result.city;
          sortFilter = _result.sortOrder;
          minRangeFilter = int.tryParse(_result.minRange);
          maxRangeFilter = int.tryParse(_result.maxRange);
          serviceTitleSearchOption = true;
          filterCityOption = true;
          filterSortOption = true;
          filterRange = true;
          print('$minRangeFilter $maxRangeFilter');
        });
      }
      else if(_result.city != null && _result.minRange != null && _result.maxRange != null){
        setState(() {
          cityFilter = _result.city;
          minRangeFilter = int.tryParse(_result.minRange);
          maxRangeFilter = int.tryParse(_result.maxRange);
          serviceTitleSearchOption = true;
          filterCityOption = true;
          filterSortOption = false;
          filterRange = true;
         print('$minRangeFilter $maxRangeFilter');
        });
      }
      else if(_result.city != null && _result.sortOrder != null){
      setState(() {
        cityFilter = _result.city;
        sortFilter = _result.sortOrder;
        serviceTitleSearchOption = true;
        filterCityOption = true;
        filterSortOption = true;
        filterRange = false;
      });
      print('${_result.city} ${_result.sortOrder}');
    }
    // if city is selected aand also range isentified
      else if(_result.sortOrder != null && _result.minRange != null && _result.maxRange != null){
        setState(() {
          sortFilter = _result.sortOrder;
          minRangeFilter = int.tryParse(_result.minRange);
          maxRangeFilter = int.tryParse(_result.maxRange);
          serviceTitleSearchOption = true;
          filterCityOption = false;
          filterSortOption = true;
          filterRange = true;
        });
        print('$minRangeFilter $maxRangeFilter');
      }
      // if only city variable filter was selected then on;y map cityFilter value and make title and city boolean options true
      else if(_result.city != null){
        setState(() {
          cityFilter = _result.city;
          serviceTitleSearchOption = true;
          filterCityOption = true;
          filterSortOption = false;
          filterRange = false;
        });
        print(_result.city);
      }
      // if only sort filter was selected
      else if(_result.sortOrder != null){
        setState(() {
          sortFilter = _result.sortOrder;
          serviceTitleSearchOption = true;
          filterCityOption = false;
          filterRange = false;
          filterSortOption = true;
        });
        print(_result.sortOrder);
      }
      // if range is selected
      else if(_result.minRange != null && _result.maxRange != null){
        setState(() {
          minRangeFilter = int.tryParse(_result.minRange);
          maxRangeFilter = int.tryParse(_result.maxRange);
          filterRange = true;
          serviceTitleSearchOption = true;
          filterCityOption = false;
          filterSortOption = false;
        });
        print('$minRangeFilter $filterRange $serviceTitleSearchOption');
        print('$maxRangeFilter');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
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
                            serviceTitleSearchOption = true;
                            filterCityOption = false;
                            filterSortOption = false;
                            filterRange = false;
                          });
                        }
                        else{
                           setState(() {
                             serviceTitleSearchOption = false;
                             filterCityOption = false;
                             filterSortOption = false;
                             filterRange = false;
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
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffe8e8e8),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left:20,right:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Result",
                            style: GoogleFonts.varelaRound(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            navigateToFilterPage(context);
                          },
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              StreamBuilder(
                stream: getServicesByTitle(),
                builder: (BuildContext context, AsyncSnapshot<List<Services>> snapshot) {
                  if(snapshot.hasData && snapshot.data.isNotEmpty){
                    return Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                            return Container(
                              width: MediaQuery.of(context).size.width - 30,
                              height: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: Colors.white,
                                elevation: 3,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(width: 15,),
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Color(0XFF012A4A),
                                      backgroundImage: AssetImage("assets/service_avatar.jpg"),
                                    ),
                                    SizedBox(width: 20,),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              snapshot.data[index].title, style: GoogleFonts.quicksand(fontSize:20,color: Colors.black)
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(FontAwesomeIcons.home , size: 18, color: Colors.grey,),
                                                SizedBox(width: 10,),
                                                Container(
                                                  child: AutoSizeText(
                                                      snapshot.data[index].workshopId,
                                                    style: GoogleFonts.quicksand(
                                                        fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons.location_on, size: 19, color: Colors.grey,),
                                                SizedBox(width: 10,),
                                                Text(snapshot.data[index].workshopCity,style: GoogleFonts.quicksand(fontSize: 16),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(FontAwesomeIcons.dollarSign, size: 17, color: Colors.grey,),
                                                SizedBox(width: 10,),
                                                Text(snapshot.data[index].price.toString(),style: GoogleFonts.quicksand(fontSize: 16),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    );
                  }
                  else if(snapshot.data == null){
                    return Text('Search For Workshops Services');
                  }
                  else if(snapshot.hasData && snapshot.data.isEmpty){
                    return Text('No Data Found Matching Your Search');
                  }
                  else if(snapshot.hasError){
                    return Text(snapshot.error.toString());
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
