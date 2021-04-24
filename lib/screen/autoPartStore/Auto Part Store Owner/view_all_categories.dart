import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ViewAllCategories extends StatefulWidget {
  @override
  _ViewAllCategoriesState createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends State<ViewAllCategories> {
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
                  shrinkWrap: true,
                  itemCount: myProducts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                            padding: EdgeInsets.only(left:25,right: 25,bottom: 10,top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(myProducts[index]),
                                Icon(
                                  Icons.arrow_forward_ios,
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
final myProducts = List<String>.generate(50, (i) => 'Category $i');
