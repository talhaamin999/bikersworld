import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ViewAllCategoriesNomrmalUser extends StatefulWidget {

  @override
  _ViewAllCategoriesNomrmalUserState createState() => _ViewAllCategoriesNomrmalUserState();
}

class _ViewAllCategoriesNomrmalUserState extends State<ViewAllCategoriesNomrmalUser> {

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
                  itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          //
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
                                  Text("Category 1", style: GoogleFonts.quicksand(fontSize:16),),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
