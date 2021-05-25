import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/services/search_queries/bike_add_search/bike_admin_data.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/dashboard/Ads/AdDetail.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:bikersworld/widgets/city_dropdown.dart';
import 'package:bikersworld/services/search_queries/bike_add_search/bike_add_Search_queries.dart';

class adSearchPage extends StatefulWidget {
  @override
  _adSearchPageState createState() => _adSearchPageState();
}

class _adSearchPageState extends State<adSearchPage> {

  final _adminData = BikeAdminDataQueries();
  final _yearController = TextEditingController();
  final _minController = TextEditingController();
  final _maxController = TextEditingController();
  final _cityController = TextEditingController();
  double _minValue;
  double _maxVlaue;
  final _searchAdds = SearchBikeAddQueries();

  String make,model;
  bool makeSelected=false,modelSelected=false,yearSelected=false,citySelected=false,rangeSelected=false;

  Future<List<BikeSearchModel>> getMakeAndModel() {
    try {
      return _adminData.getMakeAndModel();
    }catch(e){}
  }
  Future<BikeSearchModel> getBikeModel() {
    try {
      return _adminData.getModelForMake(make);
    }catch(e){}
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    _yearController.dispose();
    _cityController.dispose();
    super.dispose();
  }
  double stringToDouble(String value){
    return double.tryParse(value);
  }
  Future<List<BikeAddModel>> getAdds(){
    if((make != null) && (model != null) && _yearController.text.isNotEmpty && _cityController.text.isNotEmpty &&_minController.text.isNotEmpty && _maxController.text.isNotEmpty){
      _minValue = stringToDouble(_minController.text);
      _maxVlaue = stringToDouble(_maxController.text);
      return _searchAdds.searchAddByMakeAndModelAndYearAndCityAndRange(make: make, model: model, year: _yearController.text, city: _cityController.text, min: _minValue, max: _maxVlaue);
    }
    return null;
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
                      textInputAction: TextInputAction.search,
                      decoration: new InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(Icons.clear)),
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
                      FlatButton(
//                        onPressed: (){
//                          showModalBottomSheet(
//                              context: context,
//                              builder: (context) {
//                                return SingleChildScrollView(
//                                  child: Column(
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Padding(
//                                        padding: const EdgeInsets.only(left:15,top: 20),
//                                        child: Text(
//                                          "Search here",
//                                          style: GoogleFonts.montserrat(
//                                            fontSize: 20,
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ),
//                                      SizedBox(height: 10,),
//                                      FutureBuilder(
//                                        future: getMakeAndModel(),
//                                        builder: (BuildContext context, AsyncSnapshot<List<BikeSearchModel>> snapshot) {
//                                          if(snapshot.hasData && snapshot.data.isNotEmpty){
//                                            return Container(
//                                              child: Padding(
//                                                padding: const EdgeInsets.only(left:15,right:15),
//                                                child: Column(
//                                                  children: [
//                                                    Padding(
//                                                      padding: const EdgeInsets.only( top:10),
//                                                      child:Container(
//                                                        color: Colors.white,
//                                                        child: SizedBox(
//                                                          width: MediaQuery.of(context).size.width,
//                                                          child: DropdownSearch<String>(
//                                                            validator: (v) => v == null ? "required field" : null,
//                                                            hint: "Select Make",
//                                                            searchBoxDecoration: InputDecoration(
//                                                              border: new OutlineInputBorder(
//                                                                borderRadius: const BorderRadius.all(
//                                                                  const Radius.circular(5),
//                                                                ),
//                                                              ),
//                                                            ),
//                                                            showSelectedItem: true,
//                                                            items: snapshot.data.map((doc) => doc.make).toList(),
//                                                            // showClearButton: true,
//                                                            onChanged: (value){
//                                                              setState(() {
//                                                                make = value;
//                                                                print(make);
//                                                              });
//                                                            },
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    SizedBox(width: 10,),
//                                                    FutureBuilder(
//                                                      future: getBikeModel(),
//                                                      builder: (BuildContext context, AsyncSnapshot<BikeSearchModel> docSnapshot) {
//                                                        if(docSnapshot.hasData && docSnapshot.data != null){
//                                                          return Padding(
//                                                            padding: const EdgeInsets.only( top:10,right: 15),
//                                                            child:Container(
//                                                              color: Colors.white,
//                                                              child: SizedBox(
//                                                                width: MediaQuery.of(context).size.width,
//                                                                child: DropdownSearch<String>(
//                                                                  validator: (v) => v == null ? "required field" : null,
//                                                                  hint: "Select Modal",
//                                                                  searchBoxDecoration: InputDecoration(
//                                                                    border: new OutlineInputBorder(
//                                                                      borderRadius: const BorderRadius.all(
//                                                                        const Radius.circular(5),
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                  showSelectedItem: true,
//                                                                  items: List<String>.from(docSnapshot.data.model),
//                                                                  // showClearButton: true,
//                                                                  onChanged: (value){
//                                                                    model = value;
//                                                                  },
//                                                                ),
//                                                              ),
//                                                            ),
//                                                          );
//                                                        }
//                                                        else if(docSnapshot.data == null){
//                                                          return Padding(
//                                                            padding: const EdgeInsets.only( top:15,right: 0),
//                                                            child:Container(
//                                                              color: Colors.white,
//                                                              child: SizedBox(
//                                                                width: MediaQuery.of(context).size.width,
//                                                                child: DropdownSearch<String>(
//                                                                  validator: (v) => v == null ? "required field" : null,
//                                                                  hint: "Select Modal",
//                                                                  searchBoxDecoration: InputDecoration(
//                                                                    border: new OutlineInputBorder(
//                                                                      borderRadius: const BorderRadius.all(
//                                                                        const Radius.circular(5),
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                  showSelectedItem: true,
//                                                                  items: [],
//                                                                  // showClearButton: true,
//                                                                  onChanged: (value){
//
//                                                                  },
//                                                                ),
//                                                              ),
//                                                            ),
//                                                          );
//                                                        }
//
//                                                        else if(docSnapshot.hasError){
//                                                          return Center(child: Text(docSnapshot.error.toString()));
//                                                        }
//                                                        return Center(child: CircularProgressIndicator(),);
//                                                      },
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            );
//                                          }
//                                          return Center(child:CircularProgressIndicator());
//                                        },
//                                      ),
//                                      SizedBox(height: 10,),
//                                      Padding(
//                                        padding: const EdgeInsets.only(left:15,right: 15),
//                                        child: CityDropDown(controller:_cityController),
//                                      ),
//                                      SizedBox(height: 15,),
//
//                                      Padding(
//                                        padding: EdgeInsets.only(left: 15,right: 15,),
//                                        child: Container(
//                                          width: MediaQuery.of(context).size.width - 20,
//                                          child: TextField(
//                                            controller: _yearController,
//                                            keyboardType: TextInputType.number,
//                                            textInputAction: TextInputAction.search,
//                                            onSubmitted: (value){
//                                            },
//                                            decoration: new InputDecoration(
//                                                suffixIcon: IconButton(
//                                                  //onPressed: () => _controller.clear(),
//                                                    icon: Icon(Icons.clear)),
//                                                border: new OutlineInputBorder(
//                                                  borderRadius: const BorderRadius.all(
//                                                    const Radius.circular(5),
//                                                  ),
//                                                ),
//                                                filled: true,
//                                                hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
//                                                hintText: "Enter Year",
//                                                contentPadding: EdgeInsets.only(top: 7),
//                                                prefixIcon: Icon(Icons.search, size: 25,),
//                                                fillColor: Colors.white),
//                                          ),
//                                        ),
//                                      ),
//
//                                      SizedBox(height: 10,),
//                                      Padding(
//                                        padding: const EdgeInsets.only(left:15,top: 10),
//                                        child: Text(
//                                          "Price",
//                                          style: GoogleFonts.quicksand(
//                                            fontSize: 20,
//                                          ),
//                                        ),
//                                      ),
//                                      SizedBox(height: 10,),
//                                      Container(
//                                        width: MediaQuery.of(context).size.width -20,
//                                        height: 80,
//                                        child: Padding(
//                                          padding: const EdgeInsets.only(left:55),
//                                          child: Row(
//                                            crossAxisAlignment:CrossAxisAlignment.start,
//                                            children: [
//                                              Container(
//                                                  width: 133,
//                                                  child: TextField(
//                                                    controller: _minController,
//                                                    keyboardType: TextInputType.number,
//                                                    decoration: new InputDecoration(
//                                                        border: InputBorder.none,
//                                                        filled: true,
//                                                        hintStyle: new TextStyle(color: Colors.grey[800]),
//                                                        hintText: "Min",
//                                                        fillColor: Color(0xffe3e3e3)),
//                                                  )
//                                              ),
//                                              SizedBox(width: 10,),
//                                              Text(
//                                                "to",
//                                                style: GoogleFonts.quicksand(
//                                                  fontSize: 18,
//                                                ),
//                                              ),
//                                              SizedBox(width: 10,),
//                                              Container(
//                                                  width: 134,
//                                                  child: TextField(
//                                                    controller: _maxController,
//                                                    keyboardType: TextInputType.number,
//                                                    decoration: new InputDecoration(
//                                                      border: InputBorder.none,
//                                                      filled: true,
//                                                      hintStyle: new TextStyle(color: Colors.grey[800]),
//                                                      hintText: "Max",
//                                                      fillColor: Color(0xffe3e3e3),
//                                                    ),
//                                                  )
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                      SizedBox(height: 15,),
//                                    ],
//                                  ),
//                                );
//                              }
//                          ).whenComplete(() => getAdds());
//                        },
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:10,top: 20),
                                        child: Text(
                                          "Search here",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      FutureBuilder(
                                        future: getMakeAndModel(),
                                        builder: (BuildContext context, AsyncSnapshot<List<BikeSearchModel>> snapshot) {
                                          if(snapshot.hasData && snapshot.data.isNotEmpty){
                                            return Container(
                                              child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only( top:10),
                                                      child:Container(
                                                        color: Colors.white,
                                                        child: SizedBox(
                                                          width: MediaQuery.of(context).size.width,
                                                          child: DropdownSearch<String>(
                                                            validator: (v) => v == null ? "required field" : null,
                                                            hint: "Select Make",
                                                            searchBoxDecoration: InputDecoration(
                                                              border: new OutlineInputBorder(
                                                                borderRadius: const BorderRadius.all(
                                                                  const Radius.circular(5),
                                                                ),
                                                              ),
                                                            ),
                                                            showSelectedItem: true,
                                                            items: snapshot.data.map((doc) => doc.make).toList(),
                                                            // showClearButton: true,
                                                            onChanged: (value){
                                                              setState(() {
                                                                make = value;
                                                                print(make);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    FutureBuilder(
                                                      future: getBikeModel(),
                                                      builder: (BuildContext context, AsyncSnapshot<BikeSearchModel> docSnapshot) {
                                                        if(docSnapshot.hasData && docSnapshot.data != null){
                                                          return Padding(
                                                            padding: const EdgeInsets.only( top:10,right: 15),
                                                            child:Container(
                                                              color: Colors.white,
                                                              child: SizedBox(
                                                                width: MediaQuery.of(context).size.width,
                                                                child: DropdownSearch<String>(
                                                                  validator: (v) => v == null ? "required field" : null,
                                                                  hint: "Select Modal",
                                                                  searchBoxDecoration: InputDecoration(
                                                                    border: new OutlineInputBorder(
                                                                      borderRadius: const BorderRadius.all(
                                                                        const Radius.circular(5),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  showSelectedItem: true,
                                                                  items: List<String>.from(docSnapshot.data.model),
                                                                  // showClearButton: true,
                                                                  onChanged: (value){
                                                                    model = value;
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        else if(docSnapshot.data == null){
                                                          return Padding(
                                                            padding: const EdgeInsets.only( top:15,right: 0),
                                                            child:Container(
                                                              color: Colors.white,
                                                              child: SizedBox(
                                                                width: MediaQuery.of(context).size.width,
                                                                child: DropdownSearch<String>(
                                                                  validator: (v) => v == null ? "required field" : null,
                                                                  hint: "Select Modal",
                                                                  searchBoxDecoration: InputDecoration(
                                                                    border: new OutlineInputBorder(
                                                                      borderRadius: const BorderRadius.all(
                                                                        const Radius.circular(5),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  showSelectedItem: true,
                                                                  items: [],
                                                                  // showClearButton: true,
                                                                  onChanged: (value){

                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        else if(docSnapshot.hasError){
                                                          return Center(child: Text(docSnapshot.error.toString()));
                                                        }
                                                        return Center(child: CircularProgressIndicator(),);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                            );
                                          }
                                          return Center(child:CircularProgressIndicator());
                                        },
                                      ),
                                      SizedBox(height: 10,),
                                      CityDropDown(controller:_cityController),
                                      SizedBox(height: 15,),

                                      Container(
                                        width: MediaQuery.of(context).size.width - 20,
                                        child: TextField(
                                          controller: _yearController,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.search,
                                          onSubmitted: (value){
                                          },
                                          decoration: new InputDecoration(
                                              suffixIcon: IconButton(
                                                //onPressed: () => _controller.clear(),
                                                  icon: Icon(Icons.clear)),
                                              border: new OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  const Radius.circular(5),
                                                ),
                                              ),
                                              filled: true,
                                              hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
                                              hintText: "Enter Year",
                                              contentPadding: EdgeInsets.only(top: 7),
                                              prefixIcon: Icon(Icons.search, size: 25,),
                                              fillColor: Colors.white),
                                        ),
                                      ),

                                      SizedBox(height: 10,),
                                      Text(
                                          "Price",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 20,
                                          ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        width: MediaQuery.of(context).size.width -20,
                                        //height: 80,
                                        child:Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: TextField(
                                                    controller: _minController,
                                                    keyboardType: TextInputType.number,
                                                    decoration: new InputDecoration(
                                                      border: new OutlineInputBorder(
                                                        borderRadius: const BorderRadius.all(
                                                          const Radius.circular(5),
                                                        ),
                                                      ),
                                                        filled: true,
                                                        hintStyle: new TextStyle(color: Colors.grey[800]),
                                                        hintText: "Min",

                                                    ),
                                                  )
                                              ),
                                              SizedBox(height: 15,),
                                              Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: TextField(
                                                    controller: _maxController,
                                                    keyboardType: TextInputType.number,
                                                    decoration: new InputDecoration(
                                                      border: new OutlineInputBorder(
                                                        borderRadius: const BorderRadius.all(
                                                          const Radius.circular(5),
                                                        ),
                                                      ),
                                                      filled: true,
                                                      hintStyle: new TextStyle(color: Colors.grey[800]),
                                                      hintText: "Max",
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),
                                      ),
                                      SizedBox(height: 15,),
                                    ],
                                  ),
                                );
                              }
                          );
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
              FutureBuilder(
                future: getAdds(),
                builder: (BuildContext context, AsyncSnapshot<List<BikeAddModel>> snapshot) {
                  if(snapshot.hasData && snapshot.data.isNotEmpty){
                    return ListView.builder(
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
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(snapshot.data[index].images.last)
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
                                            margin:EdgeInsets.only(left:10),
                                            child: AutoSizeText(
                                              snapshot.data[index].make,
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
                                                  child:Row(
                                                    children: [
                                                      Icon(Icons.location_on,color: Colors.grey,),
                                                      Text(
                                                        snapshot.data[index].city,
                                                        style: TextStyle(
                                                            fontSize: 15
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 130,),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xffb8b8b8),
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



// make drop down list
// modql dorp down list
// year textfeld
// city list