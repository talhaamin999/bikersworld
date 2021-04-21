import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/part_store_queries/part_queries.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/auto_part_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatefulWidget {
  final String category;
  final String partStoreId;
  CategoryList({@required this.partStoreId,@required this.category});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  final _autoParts = AutoPartQueries();

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
        body: FutureBuilder(
          future: _autoParts.getAutoPartByCategory(userId: widget.partStoreId, category: widget.category),
          builder: (BuildContext context, AsyncSnapshot<List<AutoPartModel>> snapshot) {
            if(snapshot.hasData && snapshot.data.isNotEmpty){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:25,top: 15),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: 'Body &',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    color: Color(0xfff7892b),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: ' frame',
                                        style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          color: Colors.black,
                                        )
                                    ),
                                  ]),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // subheading('Active Projects'),
                                SizedBox(height: 5.0),
                                Row(
                                  children: <Widget>[
                                    FlatButton(
                                      child: ActiveProjectsCard(
                                        cardColor: Colors.white,
                                        image: NetworkImage(snapshot.data[index].imageURL),
                                        title: snapshot.data[index].title,
                                        price: snapshot.data[index].price.toString(),
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDetail()));
                                      },
                                    ),
                                    /*
                                    FlatButton(
                                      child: ActiveProjectsCard(
                                        cardColor: Colors.white,
                                        image: NetworkImage(snapshot.data[index].imageURL),
                                        title: snapshot.data[index].title,
                                        price: snapshot.data[index].price.toString(),
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDetail()));
                                      },
                                    ),

                                     */
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            else if(snapshot.hasData && snapshot.data.isEmpty){
              return Center(child: Text('No Data Found'));
            }
            else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}



class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String price;
  final image;

  ActiveProjectsCard({
    this.cardColor,
    this.image,
    this.title,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(bottom:15, top: 15),
      height: 185,
      width: MediaQuery.of(context).size.width - 225,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xfff0f0f0),
        ),
        color: cardColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width:135,
                height:100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: image,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,top: 5),
                child: Text(
                  title,
                  style: GoogleFonts.quicksand(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,top: 5),
                child: Text(
                  price,
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

