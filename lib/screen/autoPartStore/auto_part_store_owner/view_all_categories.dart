import 'package:bikersworld/screen/autoPartStore/auto_part_store_owner//auto_part_dasboard.dart';
import 'package:bikersworld/services/admin_data_queries/admin_partstore_queries.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ViewAllCategories extends StatefulWidget {
  final partStoreId;
  ViewAllCategories({@required this.partStoreId});
  @override
  _ViewAllCategoriesState createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends State<ViewAllCategories> {

  final _adminData = AdminPartStoreQueries();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.orange,
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
                color: Colors.white,
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
                child: FutureBuilder(
                  future: _adminData.getPartStorePartCategories(),
                  builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                    if(snapshot.hasData && snapshot.data.isNotEmpty){
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => AutoPartDashboard(
                                    partStoreId: widget.partStoreId,
                                    category: snapshot.data[index],
                                  ))
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                              height: 70,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:10,right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(snapshot.data[index], style: GoogleFonts.quicksand(fontSize:16),),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
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
                    return Center(child: CircularProgressIndicator());
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
