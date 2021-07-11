import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/auto_part_details.dart';
import 'package:bikersworld/services/search_queries/search_part.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/reviews_auto_part_form.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
class ViewAllAutoParts extends StatefulWidget {
  final String partStoreId;
  ViewAllAutoParts(this.partStoreId);
  @override
  _ViewAllAutoPartsState createState() => _ViewAllAutoPartsState();
}

class _ViewAllAutoPartsState extends State<ViewAllAutoParts> {

  final _searchAutoParts = SearchAutoParts();

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
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:25,top: 15),
                  child: Container(
                    child: Text(
                      "All Auto Parts",
                      style:GoogleFonts.quicksand(
                        fontSize: 23,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                FutureBuilder(
                  future: _searchAutoParts.searchPartByPartStore(partStoreId: widget.partStoreId),
                  builder: (BuildContext context, AsyncSnapshot<List<AutoPartModel>> snapshot) {
                    if(snapshot.hasData && snapshot.data.isNotEmpty){
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: FlatButton(
                              onPressed:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDetail(snapshot.data[index])));
                              },
                              child: Card(
                                color: Color(0xfff7f7f7),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 120,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(snapshot.data[index].imageURL),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 150.0,
                                              height: 30.0,
                                              child: AutoSizeText(
                                                snapshot.data[index].title,
                                                style: GoogleFonts.quicksand(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 180.0,
                                              height: 40.0,
                                              child: AutoSizeText(
                                                snapshot.data[index].category,
                                                style: GoogleFonts.quicksand(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
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
                      return Center(child: Text("NO PARTS FOUND"));
                    }
                    else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]),
            child: child
        ),
      ),
    );
  }
}