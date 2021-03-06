import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/dashboard/normalUser/normal_user_workshop_dashboard.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:bikersworld/services/search_queries/search_workshop_service.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';
import 'package:bikersworld/services/string_extension.dart';

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
        print("csr");
        return _service.searchServiceTitleWithRangeAndCityAndSortFilter(title: _controller.text, city: cityFilter, sortOrder: sortFilter, min: minRangeFilter,max: maxRangeFilter);
      }
      // search service title by applying city and sort filter
      else if(serviceTitleSearchOption && filterCityOption && filterSortOption){
        print("cs");
        return _service.searchServiceTitleWithCityFilterAndSort(title: _controller.text, city: cityFilter, sortOrder: sortFilter);
      }
      //search by title and apply city and range filter
      else if(serviceTitleSearchOption && filterCityOption && filterRange){
        print("cr");
        return _service.searchServiceTitleWithRangeAndCityFilter(title: _controller.text, city: cityFilter, min: minRangeFilter, max: maxRangeFilter);
      }
      // search by title and apply sort and range filters
      else if(serviceTitleSearchOption && filterSortOption && filterRange){
        print("sr");
        return _service.searchServiceTitleWithRangeAndSortFilter(title: _controller.text, sortOrder: sortFilter, min: minRangeFilter, max: maxRangeFilter);
      }
      // search by service title and apply city filter
      else if(serviceTitleSearchOption && filterCityOption){
        print("c");
        return _service.searchServiceTitleWithCityFilter(title: _controller.text, city: cityFilter);
      }
      // search by service title and apply sort filter
      else if(serviceTitleSearchOption && filterSortOption){
        print("s");
        return _service.searchServiceTitleWithSort(title: _controller.text, sortOrder: sortFilter);
      }
      // search with title and range
      else if(serviceTitleSearchOption && filterRange){
        print("r");
        return _service.searchServiceTitleWithRangeFilter(title: _controller.text, min: minRangeFilter, max: maxRangeFilter);
      }
      // search by service title
      else if(serviceTitleSearchOption){
        print("title");
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
            color: Colors.orange,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0XFF012A4A),
        iconTheme: IconThemeData(color: Colors.white,
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
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
                            _controller.text = _controller.text.capitalizeFirstofEach;
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
                              const Radius.circular(10),
                            ),
                          ),
                          filled: true,
                          hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                          hintText: "Type Service Name",
                          contentPadding: EdgeInsets.only(top: 7),
                          prefixIcon: Icon(Icons.search, size: 25,),
                          fillColor: Colors.white),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                stream: getServicesByTitle(),
                builder: (BuildContext context, AsyncSnapshot<List<Services>> snapshot) {
                  if(snapshot.hasData && snapshot.data.isNotEmpty){
                    return Column(
                      children: [
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
                                        "${snapshot.data.length}",
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
                        SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context,index){
                                return Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  height:175,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                                    child: Card(
                                      color: Colors.white,
                                      child: ListTile(
                                        onTap: (){
                                          print("workshop id");
                                          print('${snapshot.data[index].workshopId}');
                                          print('${snapshot.data[index].workshopCity}');
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NormalUserWorkshopDashboard(workshopId: snapshot.data[index].workshopId,)));
                                        },
                                        leading: CircleAvatar(
                                            radius: 40,
                                          backgroundImage: AssetImage("assets/service_avatar.jpg"),
                                        ),
                                        title: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 15,),
                                              Text(
                                                snapshot.data[index].title,
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data[index].category,
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Divider(
                                                height: 20,
                                                thickness: 1,
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Icon(
                                                            FontAwesomeIcons.tags,
                                                            size: 18,
                                                          ),
                                                          SizedBox(height: 10),
                                                          Text(
                                                            snapshot.data[index].price.toString(),
                                                            style: GoogleFonts.quicksand(
                                                              fontSize: 15,
                                                              color: Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Icon(
                                                            Icons.location_on,
                                                            size: 22,
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            snapshot.data[index].workshopCity,
                                                            style: GoogleFonts.quicksand(
                                                              fontSize: 15,
                                                              color: Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    Container(
                                                      child: CircleAvatar(
                                                        backgroundColor: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                                
                              }
                          ),
                        ),
                      ],
                    );

                  }
                  else if(snapshot.data == null){
                    return Padding(
                      padding: const EdgeInsets.only(top:30),
                      child: Text('Search For Workshops Services',style: GoogleFonts.quicksand(fontSize: 15,fontWeight: FontWeight.w600),),
                    );
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
