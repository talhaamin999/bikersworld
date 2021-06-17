import 'package:bikersworld/model/bike_add_model.dart';
import 'package:bikersworld/services/admin_data_queries/bike_add_search/bike_admin_data.dart';
import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:bikersworld/widgets/city_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvanceSearchPage extends StatefulWidget {
  @override
  _AdvanceSearchPageState createState() => _AdvanceSearchPageState();
}

class _AdvanceSearchPageState extends State<AdvanceSearchPage> {

  final _adminData = BikeAdminDataQueries();
  final _yearController = TextEditingController();
  final _minController = TextEditingController();
  final _maxController = TextEditingController();
  final _cityController = TextEditingController();

  String make,model;

  Future<List<BikeSearchModel>> getMakeAndModel() {
    try {
      return _adminData.getMakeAndModel();
    }catch(e){}
  }
  Stream<BikeSearchModel> getBikeModel() {
    try {
      return _adminData.getModelForMake(make);
    }catch(e){}
  }
  void returnToPreviousPage(BuildContext context){
    if((make != null) && (model != null) && (_yearController.text.isNotEmpty) && (_cityController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,model: model,year: _yearController.text,city: _cityController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((make != null) && (model != null) && (_yearController.text.isNotEmpty) && (_cityController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,model: model,year: _yearController.text,city: _cityController.text));
    }
    else if((make != null) && (model != null) && (_yearController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,model: model,year: _yearController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((make != null) && (model != null) && (_cityController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,model: model,city: _cityController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((make != null) && (_yearController.text.isNotEmpty) && (_cityController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,year: _yearController.text,city: _cityController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((make != null) && (_yearController.text.isNotEmpty) && (model != null)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,model: model,year: _yearController.text));
    }
    else if((make != null) && (_cityController.text.isNotEmpty) && (model != null)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,model: model,city: _cityController.text));
    }
    else if((make != null) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty) && (model != null)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,model: model,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((make != null) && (_yearController.text.isNotEmpty) && (_cityController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,year: _yearController.text,city: _cityController.text));
    }
    else if((make != null) && (_yearController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,year: _yearController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((make != null) && (_cityController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,city: _cityController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((_yearController.text.isNotEmpty) && (_cityController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(year: _yearController.text,city: _cityController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((make != null) && (model != null)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,model: model));
    }
    else if((make != null) && (_yearController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,year: _yearController.text));
    }
    else if((make != null) && (_cityController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,city: _cityController.text));
    }
    else if((make != null) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((_yearController.text.isNotEmpty) && (_cityController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(year: _yearController.text,city: _cityController.text));
    }
    else if((_yearController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(year: _yearController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((_cityController.text.isNotEmpty) && (_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(city: _cityController.text,minRange: _minController.text,maxRange: _maxController.text));
    }
    else if((make != null)){
      Navigator.of(context).pop(RefineAddsSearchResults(make: make));
    }
    else if((_yearController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(year: _yearController.text));
    }
    else if((_cityController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(city: _cityController.text));
    }
    else if((_minController.text.isNotEmpty) && (_maxController.text.isNotEmpty)){
      Navigator.of(context).pop(RefineAddsSearchResults(minRange: _minController.text,maxRange: _maxController.text));
    }
    print("hello world");
  }

  @override
  void dispose() {
    print("dispose");
    _yearController.dispose();
    _cityController.dispose();
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF012A4A),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          "Advance Search",
          style: GoogleFonts.quicksand(
            fontSize: 18,
            color: Colors.orange,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: FutureBuilder(
                future: getMakeAndModel(),
                builder: (BuildContext context, AsyncSnapshot<List<BikeSearchModel>> snapshot) {
                  if(snapshot.hasData && snapshot.data.isNotEmpty){
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only( top:10),
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:20, left: 20),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            child: Icon(
                                              FontAwesomeIcons.tag,
                                              color: Colors.black,
                                              size: 17,
                                            ),
                                            radius: 20,
                                            backgroundColor: Color(0xffe3e3e3),
                                          ),
                                          SizedBox(width: 20,),
                                          Text(
                                            "Make",
                                            style: GoogleFonts.quicksand(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:60,right: 15),
                                    child: Container(
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
                                              getBikeModel();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                          SizedBox(width: 10,),
                          StreamBuilder(
                            stream: getBikeModel(),
                            builder: (BuildContext context, AsyncSnapshot<BikeSearchModel> docSnapshot) {
                              if(docSnapshot.hasData && docSnapshot.data != null){
                                return Padding(
                                  padding: const EdgeInsets.only( top:10,right: 15),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top:20, left: 20),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Icon(
                                                    FontAwesomeIcons.tag,
                                                    color: Colors.black,
                                                    size: 17,
                                                  ),
                                                  radius: 20,
                                                  backgroundColor: Color(0xffe3e3e3),
                                                ),
                                                SizedBox(width: 20,),
                                                Text(
                                                  "Modal",
                                                  style: GoogleFonts.quicksand(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:60,right: 15),
                                          child: Container(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              else if(docSnapshot.data == null){
                                return Padding(
                                  padding: const EdgeInsets.only( top:15,right: 0),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top:20, left: 20),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Icon(
                                                    FontAwesomeIcons.tag,
                                                    color: Colors.black,
                                                    size: 17,
                                                  ),
                                                  radius: 20,
                                                  backgroundColor: Color(0xffe3e3e3),
                                                ),
                                                SizedBox(width: 20,),
                                                Text(
                                                  "Modal",
                                                  style: GoogleFonts.quicksand(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left:60,right: 15),
                                          child: Container(
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
                                        ),
                                      ],
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
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20),
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        FontAwesomeIcons.tag,
                        color: Colors.black,
                        size: 17,
                      ),
                      radius: 20,
                      backgroundColor: Color(0xffe3e3e3),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      "City",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:60,right: 15),
              child: CityDropDown(controller:_cityController),
            ),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(top:20, left: 20),
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        FontAwesomeIcons.tag,
                        color: Colors.black,
                        size: 17,
                      ),
                      radius: 20,
                      backgroundColor: Color(0xffe3e3e3),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      "Year",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left:60,),
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

            Padding(
              padding: const EdgeInsets.only(top:20, left: 20),
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        FontAwesomeIcons.tag,
                        color: Colors.black,
                        size: 17,
                      ),
                      radius: 20,
                      backgroundColor: Color(0xffe3e3e3),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      "Price Range (PKR)",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width -20,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left:55),
                child: Row(
                  children: [
                    Container(
                        width: 133,
                        child: TextField(
                          controller: _minController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "Min",
                              fillColor: Color(0xffe3e3e3)),
                        )
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "to",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                        width: 134,
                        child: TextField(
                          controller: _maxController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "Max",
                              fillColor: Color(0xffe3e3e3)),
                        )
                    ),
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: (){
                returnToPreviousPage(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left:20,bottom: 15,top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width-70,
                  height:60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Color(0XFF012A4A),  width: 2),
                    color: Color(0XFF012A4A),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.filter, color: Colors.white,),
                      SizedBox(width: 5,),
                      Text("Apply filter",
                        style: GoogleFonts.quicksand(fontSize: 15, color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}