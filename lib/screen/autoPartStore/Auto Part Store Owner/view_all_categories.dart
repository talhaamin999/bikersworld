import 'package:bikersworld/screen/autoPartStore/Auto%20Part%20Store%20Owner/auto_part_dasboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ViewAllCategories extends StatefulWidget {
  final partStoreId;
  ViewAllCategories({@required this.partStoreId});
  @override
  _ViewAllCategoriesState createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends State<ViewAllCategories> {

  var _dropDownItems = ['Accessories', 'Body & Frame', 'Brake & Suspension', 'Air Intake', 'Electrical & Ignition', 'Exhaust System','Engine & Engine Parts','Lighting & Indicators','Wheel & Tyres','Seating','Other','hcgchccf','hgcvhcc','ghchgc'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
          iconTheme: IconThemeData(color: Color(0xfffbb448)),
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.orange,
              )
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:25,top: 15),
                child: Container(
                  child: Text(
                    "All Categories",
                    style:GoogleFonts.quicksand(
                      fontSize: 23,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _dropDownItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                            padding: EdgeInsets.only(left:25,right: 25,bottom: 10,top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_dropDownItems[index]),
                                 InkWell(
                                  onTap: (){
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) =>
                                        AutoPartDashboard(partStoreId: widget.partStoreId, category: _dropDownItems[index],)) );
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                ),
                              ],
                            ),),
                      );
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
