import 'package:bikersworld/services/search_queries/refine_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:bikersworld/widgets/city_dropdown.dart';
class RefineRearchPage extends StatefulWidget {
  final String workshopSearchFilter;
  final String workshopServiceSearchFilter;
  final String partStoreSearchFilter;
  final String partStoreServiceSearchFilter;
  RefineRearchPage({this.workshopSearchFilter,this.workshopServiceSearchFilter,this.partStoreSearchFilter,this.partStoreServiceSearchFilter});
  @override
  _RefineRearchPageState createState() => _RefineRearchPageState();
}



enum priceSelection { High, Low, Not }


class _RefineRearchPageState extends State<RefineRearchPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();
  priceSelection _price = priceSelection.Not;


  @override
  void dispose() {
    print("dispose");
    _controller.dispose();
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }
  void clear(){
    _controller.clear();
    _minController.clear();
    _maxController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF012A4A),
        iconTheme: IconThemeData(
          color: Color(0xfffbb448),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          "Refine your Search",
          style: GoogleFonts.quicksand(
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:15),
            child: Center(
              child: Text(
                "Reset",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Visibility(
                visible: true,
                child: Padding(
                  padding: const EdgeInsets.only(top:20, left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 25,
                          ),
                          radius: 20,
                          backgroundColor: Color(0xffe3e3e3),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "Location",
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              Visibility(
                  visible:true,
                  child: Padding(
                    padding: const EdgeInsets.only(left:40, right:20),
                    child: Container(
                        width: 300 ,
                        child: CityDropDown(
                          controller: _controller,
                        )
                    ),
                  )),


              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          FontAwesomeIcons.tumblrSquare,
                          color: Colors.black,
                          size: 25,
                        ),
                        radius: 20,
                        backgroundColor: Color(0xffe3e3e3),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Part Type",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:40, right:20,top: 20),
                child: Container(
                  color: Colors.black12,
                  width: 300 ,
                  child:  SizedBox(
                    width: MediaQuery.of(context).size.width ,
                    child: DropdownSearch<String>(
                      maxHeight: 180,
                      validator: (v) => v == null ? "required field" : null,
                      hint: "Select Part Type",
                      showSelectedItem: true,
                      items: ['Local','Geniune','Others'],
                      showClearButton: true,
                      onChanged: (value){
                       // widget.controller.text = value;
                      },
                    ),
                  ),
                ),
              ),



              Visibility(
                visible: widget.workshopServiceSearchFilter != null ? true : false,
                child: Padding(
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
              ),
              Visibility(
                visible: widget.workshopServiceSearchFilter != null ? true : false,
                child: Container(
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
              ),
              Visibility(
                visible: widget.workshopServiceSearchFilter != null ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(top:20, left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            FontAwesomeIcons.sort,
                            color: Colors.black,
                            size: 22,
                          ),
                          radius: 20,
                          backgroundColor: Color(0xffe3e3e3),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "Sort by price",
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.workshopServiceSearchFilter != null ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(left:60),
                  child: Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('No Item Selected'),
                          leading: Radio<priceSelection>(
                            value: priceSelection.Not,
                            groupValue: _price,
                            onChanged: (priceSelection value) {
                              setState(() {
                                _price = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('High to low'),
                          leading: Radio<priceSelection>(
                            value: priceSelection.High,
                            groupValue: _price,
                            onChanged: (priceSelection value) {
                              setState(() {
                                _price = value;
                              });
                              },
                          ),
                        ),
                        ListTile(
                          title: const Text('Low to High'),
                          leading: Radio<priceSelection>(
                            value: priceSelection.Low,
                            groupValue: _price,
                            onChanged: (priceSelection value) {
                              setState(() {
                                _price = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                print('${_minController.text} ${_maxController.text}');
                if((_controller.text.isNotEmpty) && (_price == priceSelection.High || _price == priceSelection.Low) && _minController.text.isNotEmpty && _maxController.text.isNotEmpty){
                  if(_price == priceSelection.Low){
                    Navigator.pop(context,RefineSearchResults(city: _controller.text,minRange: _minController.text,maxRange: _maxController.text,sortOrder: 'LTH'));
                  }else{
                    {
                      Navigator.pop(context,RefineSearchResults(city: _controller.text,minRange: _minController.text,maxRange: _maxController.text,sortOrder: 'HTL'));
                    }
                  }
                }
                else if((_controller.text.isNotEmpty) && (_price == priceSelection.High || _price == priceSelection.Low)){
                  if(_price == priceSelection.High) {
                    Navigator.pop(context, RefineSearchResults(
                        city: _controller.text, sortOrder: 'HTL'));
                  }else{
                    Navigator.pop(context, RefineSearchResults(
                        city: _controller.text, sortOrder: 'LTH'));
                  }
                }
                else if(_controller.text.isNotEmpty && _minController.text.isNotEmpty && _maxController.text.isNotEmpty){
                  Navigator.pop(context, RefineSearchResults(
                      city: _controller.text,minRange: _minController.text,maxRange: _maxController.text));
                }
                else if((_price == priceSelection.Low || _price == priceSelection.High) && _minController.text.isNotEmpty && _maxController.text.isNotEmpty){
                  if(_price == priceSelection.Low){
                    Navigator.pop(context,RefineSearchResults(sortOrder: 'LTH',minRange: _minController.text,maxRange: _maxController.text));
                  }else{
                    Navigator.pop(context,RefineSearchResults(sortOrder: 'HTL',minRange: _minController.text,maxRange: _maxController.text));
                  }
                }
                else if(_controller.text.isNotEmpty){
                  Navigator.pop(context,RefineSearchResults(city: _controller.text));
                }
                else if(_price == priceSelection.Low){
                  Navigator.pop(context,RefineSearchResults(sortOrder: 'LTH'));
                }
                else if(_price == priceSelection.High){
                  Navigator.pop(context,RefineSearchResults(sortOrder: 'HTL'));
                }
                else if(_minController.text.isNotEmpty && _maxController.text.isNotEmpty){
                  Navigator.pop(context,RefineSearchResults(minRange: _minController.text,maxRange: _maxController.text));
                }


              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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


/*
*  Row(
                          children: [
                            Radio(
                              groupValue: null,
                              value: HighLow,
                              onChanged: (bool value) {
                                setState(() {
                                  HighLow = value;
                                });
                              },
                            ),
                            Text("High to low",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              groupValue: null,
                              value: LowHigh,
                              onChanged: (bool value) {
                                setState(() {
                                  LowHigh = value;
                                });
                              },
                            ),
                            Text("Low to high",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: LowHigh,
                              onChanged: (bool value) {
                                setState(() {
                                  LowHigh = value;
                                });
                              }, groupValue: null,
                            ),
                            Text("Not Selected",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        * */

