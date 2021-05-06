import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/view_category_wise_auto_part.dart';
import 'package:bikersworld/widgets/part_category_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/specific_category.dart';

class ViewAllCategoriesNomrmalUser extends StatefulWidget {
  final partStoreId;
  ViewAllCategoriesNomrmalUser(this.partStoreId);
  @override
  _ViewAllCategoriesNomrmalUserState createState() => _ViewAllCategoriesNomrmalUserState();
}

class _ViewAllCategoriesNomrmalUserState extends State<ViewAllCategoriesNomrmalUser> {

 final _categoryList = AutoPartCtaegoryList();

  @override
  void initState() {
    print('${_categoryList.getPartsList().first}');
    super.initState();
  }

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
                  itemCount: _categoryList.getPartsList().length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewCategoryWiseAutoPart(partCategory: _categoryList.getPartsList()[index],partStoreId: widget.partStoreId,)));
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
                                  Text(_categoryList.getPartsList()[index], style: GoogleFonts.quicksand(fontSize:16),),
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
