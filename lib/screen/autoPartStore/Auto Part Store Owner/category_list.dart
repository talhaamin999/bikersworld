import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
                              cardColor: Color(0xffcca63b),
                              title: 'Fenders',
                              subtitle: 'Frame',
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));
                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            onPressed: (){
                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFFF9BE7C),
                              title: 'Gas',
                              subtitle: 'Tank',
                            ),
                          ),
                          FlatButton(
                            onPressed: (){
                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFFF9BE7C),
                              title: 'Seat',
                              subtitle: 'Parts',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: ActiveProjectsCard(
                              cardColor: Color(0xffcca63b),
                              title: 'Pedals',
                              subtitle: 'Pegs',
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));
                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            onPressed: (){
                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFFF9BE7C),
                              title: 'Handle',
                              subtitle: 'bar',
                            ),
                          ),
                          FlatButton(
                            onPressed: (){
                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFFF9BE7C),
                              title: 'Brake',
                              subtitle: 'Suspension',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: ActiveProjectsCard(
                              cardColor: Color(0xffcca63b),
                              title: 'Body',
                              subtitle: 'Work',
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList()));
                            },
                          ),
                          // SizedBox(width: 20.0),
                          FlatButton(
                            onPressed: (){
                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFFF9BE7C),
                              title: 'Steering',
                              subtitle: 'damper',
                            ),
                          ),
                          FlatButton(
                            onPressed: (){
                            },
                            child: ActiveProjectsCard(
                              cardColor: Color(0xFFF9BE7C),
                              title: 'Wind',
                              subtitle: 'Shield',
                            ),
                          ),
                        ],
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
  }
}



class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;

  ActiveProjectsCard({
    this.cardColor,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(bottom:15, top: 15),
      height: 90,
      width: 80,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(
                  title,
                  style: GoogleFonts.quicksand(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(
                  subtitle,
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    color: Colors.white54,
                    fontWeight: FontWeight.w400,
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

