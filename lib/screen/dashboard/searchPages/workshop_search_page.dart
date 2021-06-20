import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:bikersworld/services/search_queries/serach_workshop.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/dashboard/searchPages/refine_search_page.dart';
import 'package:bikersworld/screen/dashboard/normalUser/normal_user_workshop_dashboard.dart';
class WorkshopSearchPage extends StatefulWidget {
  @override
  _WorkshopSearchPageState createState() => _WorkshopSearchPageState();
}

enum search { City, Name }


class _WorkshopSearchPageState extends State<WorkshopSearchPage> {

  search _character = search.Name;
  String searchOption='';
  int numberOfResults = 0;
  final TextEditingController _controller = TextEditingController()..text = '';
  final SearchWorkshop _searchWorkshop = SearchWorkshop();
  String cityFilter;
  bool cityFilterOption=false,workshopNameOption=false;

  Stream<List<WorkshopDashboardModel>> searchByNameOrCity(){
    try {
         // search according to workshop Name and also filter applied of city with it
         if(workshopNameOption && cityFilterOption && _controller.text.isNotEmpty){
           return _searchWorkshop.searchWorkshopByNameAndCity(title: _controller.text, city: cityFilter);
         }
         // search according to workshop title only if text in field is not empty
         else if(workshopNameOption && _controller.text.isNotEmpty) {
           return _searchWorkshop.searchWorkshopByName(
               name: _controller.text.trim());
         }
         // search according to only city filter when text in field is empty
         else if(cityFilterOption){
           return _searchWorkshop.searchWorkshopByCity(city: cityFilter);
         }
    }catch(e){
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return null;
  }
  counter(int index){
    setState(() {
      numberOfResults = index;
    });
  }
  navigateToFilterPage(BuildContext context) async{
     final RefineSearchResults _result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RefineRearchPage(workshopSearchFilter: 'workshop',)));
     //only if result is not nul and city variable is assigned a value only then map the values
     if(_result != null && _result.city != null){
      setState(() {
        cityFilterOption = true;
        workshopNameOption = true;
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
                        onSubmitted: (value){
                          // if field is empty then don't search by workshop title
                          if(_controller.text.isEmpty){
                            setState(() {
                              workshopNameOption = false;
                            });
                          }
                          // else when pressed and field is not empty then search only by name
                          else {
                            setState(() {
                              workshopNameOption = true;
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

              Container(
                child:  StreamBuilder<List<WorkshopDashboardModel>>(
                  stream: searchByNameOrCity(),
                  builder: (context,snapshot){
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
                                  Navigator.push(context, MaterialPageRoute( builder: (context) => NormalUserWorkshopDashboard(workshopData: snapshot.data[index],),),
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
                    return CircularProgressIndicator();
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
