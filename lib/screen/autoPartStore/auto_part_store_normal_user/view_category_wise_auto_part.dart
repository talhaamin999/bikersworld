import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/search_queries/search_part.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/reviews_auto_part_form.dart';

import 'auto_part_details.dart';

class ViewCategoryWiseAutoPart extends StatefulWidget {
  final String partCategory;
  final String partStoreId;

  ViewCategoryWiseAutoPart(
      {@required this.partCategory, @required this.partStoreId});

  @override
  _ViewCategoryWiseAutoPartState createState() =>
      _ViewCategoryWiseAutoPartState();
}

class _ViewCategoryWiseAutoPartState extends State<ViewCategoryWiseAutoPart> {
  final _serachParts = SearchAutoParts();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
              )),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 15),
                child: Container(
                  child: Text(
                    widget.partCategory,
                    style: GoogleFonts.quicksand(
                      fontSize: 23,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: _serachParts.searchPartByCategory(
                    partStoreId: widget.partStoreId,
                    category: widget.partCategory),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AutoPartModel>> snapshot) {
                  if (snapshot.hasData && snapshot.data.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AutoPartDetail(snapshot.data[index])));
                            },
                            child: Card(
                              color: Color(0xfff7f7f7),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 100,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              snapshot.data[index].imageURL),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: AutoSizeText(
                                              snapshot.data[index].title,
                                              style: GoogleFonts.quicksand(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    snapshot
                                                        .data[index].category,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 65,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xffb8b8b8),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
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
                  } else if (snapshot.hasData && snapshot.data.isEmpty) {
                    return Center(
                        child: Text("NO PARTS FOUND AGAINST THIS CATEGORY"));
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
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

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
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
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
