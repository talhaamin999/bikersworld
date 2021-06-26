import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';
import 'package:bikersworld/screen/dashboard/normalUser/normal_user_workshop_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkshopSearchPage extends StatefulWidget {
  @override
  _WorkshopSearchPageState createState() => _WorkshopSearchPageState();
}

class _WorkshopSearchPageState extends State<WorkshopSearchPage> {

  final TextEditingController _searchController = TextEditingController()..text = '';
  String cityFilter;
  bool cityFilterOption=false;
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('workshop');
  Future resultsLoaded;
  List<WorkshopDashboardModel> _allResults = [];
  List<WorkshopDashboardModel> _resultsList = [];
  List<WorkshopDashboardModel> _cityResultsList = [];

  searchByCity(){
      List<WorkshopDashboardModel> showResults = [];
         if(cityFilterOption){
           _allResults.forEach((doc) {
             if(cityFilter == doc.city){
               showResults.add(doc);
             }
           });
         }
        setState(() {
           _cityResultsList = showResults;
        });
  }
  navigateToFilterPage(BuildContext context) async{
     _searchController.clear();
    final RefineSearchResults _result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RefineRearchPage(workshopSearchFilter: 'workshop',)));
     //only if result is not nul and city variable is assigned a value only then map the values
     if(_result != null && _result.city != null){
      setState(() {
        cityFilterOption = true;
        cityFilter = _result.city;
      });
      searchByCity();
     }
  }

  getWorkshops() async{
    var data = await _collectionReference
        .get()
        .then((snapshots) =>  snapshots.docs
        .map((doc) => WorkshopDashboardModel.fromJson(doc.data(),doc.reference.id))
        .toList());
    setState(() {
      _allResults = data;
    });
    searchResultsList();
    return "complete";
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getWorkshops();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    if(_searchController.text.isNotEmpty) {
      setState(() {
        cityFilterOption = false;
      });
    }
    searchResultsList();
    print(_searchController.text);
  }

  searchResultsList() {
    List<WorkshopDashboardModel> showResults = [];
    if(_searchController.text.isNotEmpty) {
      _allResults.forEach((doc) {
        var title = doc.shopTitle.toLowerCase();
        if(title.contains(_searchController.text.toLowerCase())){
          showResults.add(doc);
        }
      });
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
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
    iconTheme: IconThemeData(color: Colors.white,
           ),
          bottomOpacity: 0.0,
          elevation: 0.0,
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
                        controller: _searchController,
                        decoration: new InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () => _searchController.clear(),
                                icon: Icon(Icons.clear)),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                            hintText: "Type Workshop Name",
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
              SizedBox(height: 10,),
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
              cityFilterOption ? Container(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _cityResultsList.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: FlatButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute( builder: (context) => NormalUserWorkshopDashboard(workshopData: _cityResultsList[index],),),
                            );
                          },
                          child: Card(
                            color: Color(0xfff7f7f7),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        width: 90,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: _cityResultsList[index].imageURL != null ? NetworkImage(_cityResultsList[index].imageURL) : AssetImage("assets/avatar.jpg",)
                                            )
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
                                            _cityResultsList[index] !=null ? _cityResultsList[index].shopTitle : "Automotive repair",
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
                                                  _cityResultsList[index] != null ? _cityResultsList[index].city: "Islamabad",
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
                      );
                    }
                ),
              ) :
              ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _resultsList.length,
              itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: FlatButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute( builder: (context) => NormalUserWorkshopDashboard(workshopData: _resultsList[index],),),
                      );
                    },
                    child: Card(
                      color: Color(0xfff7f7f7),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: 90,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: _resultsList[index].imageURL != null ? NetworkImage(_resultsList[index].imageURL) : AssetImage("assets/avatar.jpg",)
                                      )
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
                                      _resultsList[index] !=null ? _resultsList[index].shopTitle : "Automotive repair",
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
                                            _resultsList[index] != null ? _resultsList[index].city: "Islamabad",
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
                                          _resultsList[index] != null ? _resultsList[index].openTime: "open",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          "|",
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          _resultsList[index] != null ? _resultsList[index].closeTime: "close",
                                          style: TextStyle(
                                            fontSize: 13,
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
          ),

            ],
          ),
        ),
      ),
    );
  }
}
