import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:bikersworld/services/search_queries/search_part_store.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Normal User/autoPartStoreDashboard.dart';
class AutoPartStoreSearchPage extends StatefulWidget {
  @override
  _AutoPartStoreSearchPageState createState() => _AutoPartStoreSearchPageState();
}

enum search { City, Name }


class _AutoPartStoreSearchPageState extends State<AutoPartStoreSearchPage> {

   search _character = search.Name;
   String searchOption='';
   int numberOfResults = 0;
   final TextEditingController _controller = TextEditingController()..text = '';
   final SearchPartStore _searchPartStore = SearchPartStore();
   String cityFilter;
   bool cityFilterOption=false,partStoreNameOption=false;

 Future<List<PartstoreDashboardModel>> searchByNameOrCity(){
   try {
     // search according to workshop Name and also filter applied of city with it
     if(partStoreNameOption && cityFilterOption && _controller.text.isNotEmpty){
       return _searchPartStore.searchPartStoreByNameAndCity(title: _controller.text, city: cityFilter);
     }
     // search according to workshop title only if text in field is not empty
     else if(partStoreNameOption && _controller.text.isNotEmpty) {
       return _searchPartStore.searchPartStoreByName(
           name: _controller.text.trim());
     }
     // search according to only city filter when text in field is empty
     else if(cityFilterOption){
       return _searchPartStore.searchPartStoreByCity(city: cityFilter);
     }
   }catch(e){
     final _error = ToastErrorMessage();
     _error.errorToastMessage(errorMessage: e.toString());
   }
   return null;
 }
 navigateToFilterPage(BuildContext context) async{
   final RefineSearchResults _result = await Navigator.of(context)
       .push(MaterialPageRoute(builder: (context) => RefineRearchPage(partStoreSearchFilter: 'partStore',)));
   //only if result is not nul and city variable is assigned a value only then map the values
   if(_result != null && _result.city != null){
     setState(() {
       cityFilterOption = true;
       partStoreNameOption = true;
       cityFilter = _result.city;
     });
   }
 }

  @override
  void initState() {
    super.initState();
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
        bottomOpacity: 0.0,
        elevation: 0.0,
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
                     onSubmitted: (value){
                       // if field is empty then don't search by partstore title
                       if(_controller.text.isEmpty){
                         setState(() {
                           partStoreNameOption = false;
                         });
                       }
                       // else when pressed and field is not empty then search only by name
                       else {
                         setState(() {
                           partStoreNameOption = true;
                           cityFilterOption = false;
                         });
                       }
                       print(_controller.text);
                     },
                      controller: _controller,
                      decoration: new InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () => _controller.clear(),
                              icon: Icon(Icons.clear)),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50),
                            ),
                          ),
                          filled: true,
                          hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                          hintText: "Type Store Name",
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
                  margin: EdgeInsets.only(left: 22, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          //"Result $numberOfResults",
                          "Result",
                          style: GoogleFonts.varelaRound(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 90,),
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

              Container(
                child:  FutureBuilder(
                  future: searchByNameOrCity(),
                  builder: (BuildContext context, AsyncSnapshot<List<PartstoreDashboardModel>> snapshot) {
                    if(snapshot.hasData && snapshot.data.isNotEmpty){
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                            return  Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: FlatButton(
                                onPressed:(){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AutoPartStoreDashboardPage()));
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
                                                      image: snapshot.data[index].imageURL != null ? NetworkImage(snapshot.data[index].imageURL) : AssetImage("assets/avatar.jpg",)
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
                                                  snapshot.data !=null ? snapshot.data[index].shopTitle : "Automotive repair",
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
                                                        snapshot.data != null ? snapshot.data[index].city: "Islamabad",
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
                                                      "Time",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text(
                                                      "${snapshot.data[index].openTime} - ${snapshot.data[index].closeTime}",
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
                    else if(snapshot.data == null){
                      return Text('Search For Workshops');
                    }
                    else if(snapshot.hasData && snapshot.data.isEmpty){
                      return Text('No Data Found Matching Your Search');
                    }
                    else if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }
                    return Center(child:CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
