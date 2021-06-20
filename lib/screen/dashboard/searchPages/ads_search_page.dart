import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/dashboard/Ads/AdDetail.dart';
import 'package:bikersworld/services/admin_data_queries/bike_add_search/bike_add_Search_queries.dart';
import 'advance_add_search.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bikersworld/services/string_extension.dart';

class AdSearchPage extends StatefulWidget {
  @override
  _AdSearchPageState createState() => _AdSearchPageState();
}

class _AdSearchPageState extends State<AdSearchPage> {

  final _searchAdds = SearchBikeAddQueries();
  RefineAddsSearchResults _result;
  double _minValue;
  double _maxValue;
  final _titleController = TextEditingController();
  bool _serachByTitle = false,_makeSelected=false,_modelSelected=false,_yearSelected=false,_citySelected=false,_rangeSelected=false;

  double stringToDouble(String value){
    return double.tryParse(value);
  }

  Future<List<BikeAddModel>> getAdds(){
    if(_serachByTitle){
      return _searchAdds.serachByTitle(title: _titleController.text.capitalizeFirstofEach);
    }
    else if(_makeSelected && _modelSelected && _yearSelected && _citySelected && _rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      return _searchAdds.searchAddByMakeAndModelAndYearAndCityAndRange(make: _result.make, model: _result.model, year: _result.year, city: _result.city, min: _minValue, max: _maxValue);
    }
    else if(_makeSelected && _modelSelected && _yearSelected && _citySelected){
       return _searchAdds.searchAddByMakeAndModelAndYearAndCity(make: _result.make, model:_result.model, year: _result.year, city: _result.city);
     }
    else if(_makeSelected && _modelSelected && _yearSelected && _rangeSelected){
      print("mmyr");
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      return _searchAdds.searchAddByMakeAndModelAndYearAndRange(make: _result.make, model: _result.model, year: _result.year, min: _minValue, max: _maxValue);
    }
    // to be tested
    else if(_makeSelected && _modelSelected && _citySelected && _rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      return _searchAdds.searchAddByMakeAndModelAndCityAndRange(make: _result.make, model: _result.model,city: _result.city, min: _minValue, max: _maxValue);
    }
    else if(_makeSelected && _yearSelected && _citySelected && _rangeSelected){
      print("MYCR");
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      return _searchAdds.searchAddByMakeAndYearAndCityAndRange(make: _result.make, year: _result.year,city: _result.city, min: _minValue, max: _maxValue);
    }
    else if(_makeSelected && _modelSelected && _yearSelected){
      print("MMY");
      return _searchAdds.searchAddByMakeAndModelAndYear(make: _result.make, year: _result.year, model: _result.model);
    }
    else if(_makeSelected && _modelSelected && _citySelected){
      print("MMC");
      return _searchAdds.searchAddByMakeAndModelAndCity(make: _result.make, city: _result.city, model: _result.model);
    }
    else if(_makeSelected && _modelSelected && _rangeSelected){
      print("MMR");
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      return _searchAdds.searchAddByMakeAndModelAndRange(make: _result.make, model: _result.model, min: _minValue, max: _maxValue);
    }
    else if(_makeSelected && _yearSelected && _citySelected){
      print("MYC");
      return _searchAdds.searchAddByMakeAndYearAndCity(make: _result.make, year: _result.year, city: _result.city);
    }
    else if(_makeSelected && _yearSelected && _rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      print("MYR");
      return _searchAdds.searchAddByMakeAndYearAndRange(make: _result.make, year: _result.year, min: _minValue, max: _maxValue);
    }
    else if(_makeSelected && _citySelected && _rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      print("MCR");
      return _searchAdds.searchAddByMakeAndCityAndRange(make: _result.make, city: _result.city, min: _minValue, max: _maxValue);
    }
    else if(_yearSelected && _citySelected && _rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      print("YCR");
      return _searchAdds.searchAddByYearAndCityAndRange(year: _result.year, city: _result.city, min: _minValue, max: _maxValue);
    }
    else if(_makeSelected && _modelSelected){
      print("MM");
      return _searchAdds.searchAddByMakeAndModel(make: _result.make, model: _result.model);
    }
    else if(_makeSelected && _yearSelected){
      print("MY");
      return _searchAdds.searchAddByMakeAndYear(make: _result.make, year: _result.year);
    }
    else if(_makeSelected && _citySelected){
      print("MC");
      return _searchAdds.searchAddByMakeAndCity(make: _result.make, city: _result.city);
    }
    else if(_makeSelected && _rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      print("MR");
      return _searchAdds.searchAddByMakeAndRange(make: _result.make, min: _minValue, max: _maxValue);
    }
    else if(_yearSelected && _citySelected){
      print("YC");
      return _searchAdds.searchAddByYearAndCity(year: _result.year, city: _result.city);
    }
    else if(_yearSelected && _rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      print("YR");
      return _searchAdds.searchAddByYearAndRange(year: _result.year, min: _minValue, max: _maxValue);
    }
    else if(_citySelected && _rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      print("CR");
      return _searchAdds.searchAddByCityAndRange(city: _result.city, min: _minValue, max: _maxValue);
    }
    else if(_makeSelected){
      print("M");
      return _searchAdds.searchAddByMake(make: _result.make);
    }
    else if(_yearSelected){
      print("Y");
      return _searchAdds.searchAddByYear(year: _result.year);
    }
    else if(_citySelected){
      print("C");
      return _searchAdds.searchAddByCity(city: _result.city);
    }
    else if(_rangeSelected){
      _minValue = stringToDouble(_result.minRange);
      _maxValue = stringToDouble(_result.maxRange);
      print("R");
      return _searchAdds.searchAddByRange(min: _minValue,max: _maxValue);
    }
    return null;
  }

  void goToAdvanceSearchPage(BuildContext context) async{
    setState(() {
      _serachByTitle = false;
      _makeSelected = false;
      _modelSelected = false;
      _yearSelected = false;
      _citySelected = false;
      _rangeSelected = false;
    });
    _result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvanceSearchPage()));
   if(_result != null){
     // All the opyions selected
     if((_result.make != null) && (_result.model != null) && (_result.year != null) && (_result.city != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _makeSelected = true;
         _modelSelected = true;
         _yearSelected = true;
         _citySelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.make != null) && (_result.model != null) && (_result.year != null) && (_result.city != null)){
       setState(() {
         _makeSelected = true;
         _modelSelected = true;
         _yearSelected = true;
         _citySelected = true;
       });
     }
     else if((_result.make != null) && (_result.model != null) && (_result.year != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _makeSelected = true;
         _modelSelected = true;
         _yearSelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.make != null) && (_result.model != null) && (_result.city != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _makeSelected = true;
         _modelSelected = true;
         _citySelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.make != null) && (_result.year != null) && (_result.city != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _makeSelected = true;
         _yearSelected = true;
         _citySelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.make != null) && (_result.model != null) && (_result.year != null)){
       setState(() {
         _makeSelected = true;
         _modelSelected = true;
         _yearSelected = true;
       });
     }
     else if((_result.make != null) && (_result.model != null) && (_result.city != null)){
       setState(() {
         _makeSelected = true;
         _modelSelected = true;
         _citySelected = true;
       });
     }
     else if((_result.make != null) && (_result.model != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _makeSelected = true;
         _modelSelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.make != null) && (_result.year != null) && (_result.city != null)){
       setState(() {
         _makeSelected = true;
         _yearSelected = true;
         _citySelected = true;
       });
     }
     else if((_result.make != null) && (_result.year != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _makeSelected = true;
         _yearSelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.make != null) && (_result.city != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _makeSelected = true;
         _citySelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.year != null) && (_result.city != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _yearSelected = true;
         _citySelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.make != null) && (_result.model != null)){
       setState(() {
         _makeSelected = true;
         _modelSelected = true;
       });
     }
     else if((_result.make != null) && (_result.year != null)){
       setState(() {
         _makeSelected = true;
         _yearSelected = true;
       });
     }
     else if((_result.make != null) && (_result.city != null)){
       setState(() {
         _makeSelected = true;
         _citySelected = true;
       });
     }
     else if((_result.make != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _makeSelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.year != null) && (_result.city != null)){
       setState(() {
         _yearSelected = true;
         _citySelected = true;
       });
     }
     else if((_result.year != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _yearSelected = true;
         _rangeSelected = true;
       });
     }
     else if((_result.city != null) && (_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _citySelected = true;
         _rangeSelected = true;
       });
     }
     else if(_result.make != null){
       setState(() {
         _makeSelected = true;
       });
     }
     else if(_result.year != null){
       setState(() {
         _yearSelected = true;
       });
     }
     else if(_result.city != null){
       setState(() {
         _citySelected = true;
       });
     }
     else if((_result.minRange != null) && (_result.maxRange != null)){
       setState(() {
         _rangeSelected = true;
       });
     }
   }
  }
  @override
  void dispose() {
    print("hello world");
    super.dispose();
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
        elevation: 0,
          leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
            onPressed:() => Navigator.pop(context),
          )
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
                      controller: _titleController,
                      onSubmitted: (value){
                        setState(() {
                        if(_titleController.text.isNotEmpty){
                          _serachByTitle = true;
                          _makeSelected = false;
                          _modelSelected = false;
                          _yearSelected = false;
                          _citySelected = false;
                          _rangeSelected = false;
                        }
                        });
                      },
                      textInputAction: TextInputAction.search,
                      decoration: new InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                            onPressed: () {
                                _titleController.clear();
                            },),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10),
                            ),
                          ),
                          filled: true,
                          hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                          hintText: "Search Ads",
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
                      SizedBox(height: 50,),
                        FlatButton(
                          onPressed: (){
                             goToAdvanceSearchPage(context);
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => AdvanceSearchPage()));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  "Advance Option",
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
              FutureBuilder(
                future: getAdds(),
                builder: (BuildContext context, AsyncSnapshot<List<BikeAddModel>> snapshot) {
                  if(snapshot.hasData && snapshot.data.isNotEmpty){
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: FlatButton(
                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AddDetail(data: snapshot.data[index],)));
                            },
                            child: Card(
                              color: Color(0xfff7f7f7),
                              child: Container(
                                //height: 125,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Image(
                                          image:NetworkImage(snapshot.data[index].images.last),
                                          width: 130,
                                          height: 130,
                                          fit:BoxFit.fill
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin:EdgeInsets.only(left:5, top: 10),
                                              child: Text(
                                                snapshot.data[index].title,
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 19,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5, left: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child:Row(
                                                      mainAxisAlignment:MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "PKR",
                                                          style: GoogleFonts.roboto(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(width: 5,),
                                                        Text(
                                                          snapshot.data[index].price.toString(),
                                                          style: GoogleFonts.roboto(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10),
                                              child: Text(
                                                snapshot.data[index].city,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    snapshot.data[index].model,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    "|",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),

                                                  Text(
                                                    snapshot.data[index].year,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),

                                                ],
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
                          ),
                        );
                      },
                    );
                  }
                  else if(snapshot.hasData && snapshot.data.isEmpty){
                    return Center(child: Text("NO ADDS FOUND"),);
                  }
                  else if(snapshot.data == null){
                    return Center(child: Text("Search For Adds"),);
                  }
                  else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);
                  }
                  return Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: FlatButton(
                              onPressed:(){
                               // Navigator.push(context, MaterialPageRoute(builder: (context) => AddDetail(data: snapshot.data[index],)));
                              },
                              child: Card(
                                color: Color(0xfff7f7f7),
                                child: Container(
                                  //height: 125,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Image(
                                            image:NetworkImage(''),
                                            width: 130,
                                            height: 130,
                                            fit:BoxFit.fill
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin:EdgeInsets.only(left:5, top: 10),
                                                child: Text(
                                                  '',
                                                  // snapshot.data[index].title,
                                                  style: GoogleFonts.quicksand(
                                                    fontSize: 19,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5, left: 10),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child:Row(
                                                        mainAxisAlignment:MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "PKR",
                                                            style: GoogleFonts.roboto(
                                                              fontSize: 15,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5,),
                                                          Text(
                                                            '',
                                                            style: GoogleFonts.roboto(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left:10),
                                                child: Text(
                                                  '',
                                                  //snapshot.data[index].city,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Container(
                                                margin: EdgeInsets.only(left: 10),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '',
                                                      //snapshot.data[index].model,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text(
                                                      "|",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),

                                                    Text(
                                                      '',
                                                      //snapshot.data[index].year,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),

                                                  ],
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
                            ),
                          )
                      )
                  );
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}


