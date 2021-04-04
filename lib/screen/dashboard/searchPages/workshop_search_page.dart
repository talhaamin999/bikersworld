import 'package:bikersworld/model/workshop_model.dart';
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
         if(workshopNameOption) {
           return _searchWorkshop.searchWorkshopByName(
               name: _controller.text.trim());
         }else if(cityFilterOption){
           return _searchWorkshop.searchWorkshopByCity(city: cityFilter);
         }
    }catch(e){
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return null;
  }
  /*
  Stream<List<WorkshopDashboardModel>> serachByCity(){
    try {
      print('double $cityFilter');
      return _searchWorkshop.searchWorkshopByCity(city: cityFilter);
    }catch(e){
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return null;
  }

   */
  counter(int index){
    setState(() {
      numberOfResults = index;
    });
  }
  navigateToFilterPage(BuildContext context) async{
     final _result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RefineRearchPage(workshopSearchFilter: 'workshop',)));
     if(_result != null){
      setState(() {
        cityFilterOption = true;
        workshopNameOption = false;
        cityFilter = _result;
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
                          setState(() {
                            workshopNameOption = true;
                            cityFilterOption = false;
                          });
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
                            hintText: "Type Workshop Name",
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
                          "Result $numberOfResults",
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
                child:  StreamBuilder<List<WorkshopDashboardModel>>(
                  stream: searchByNameOrCity(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                            return  Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: FlatButton(
                                onPressed:(){
                                  Navigator.push(context, MaterialPageRoute( builder: (context) => NormalUserWorkshopDashboard(),),
                                  );
                                },
                                child: Card(
                                  color: Color(0xfff7f7f7),
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                              width: 70.0,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: snapshot.data[index].imageURL != null ? NetworkImage(snapshot.data[index].imageURL) : AssetImage("assets/workshop1.webp",)
                                                  )
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
                    else if(!snapshot.hasData){
                      return Text('No Data Found go Matching Your Search');
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
