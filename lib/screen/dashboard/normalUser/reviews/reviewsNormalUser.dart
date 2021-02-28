import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/widgets/customtiextfield.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:custom_dropdown/custom_dropdown.dart';

class reviewFromUser extends StatefulWidget {
  @override
  _reviewFromUserState createState() => _reviewFromUserState();
}

class _reviewFromUserState extends State<reviewFromUser> {
  int _checkboxValue;
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
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left:25,top: 30),
              child:Text(
                  "Give Review",
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                  ),
                ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width - 40,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffe6e6e6),
                    border: InputBorder.none,
                    labelText: 'Title',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width - 40,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffe6e6e6),
                  border: InputBorder.none,
                  labelText: 'Write Review',
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left:20,top: 30, right: 20),
              child: CustomDropdown(
                valueIndex: _checkboxValue,
                 enabledColor: Color(0xffe6e6e6),
                 hint: "Review for",
                  items: [
                    CustomDropdownItem(text: "Mechanic"),
                    CustomDropdownItem(text: "Workshop"),
                  ],
                onChanged: (newValue) {
                  setState(() => _checkboxValue = newValue);
                  },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left:25,top: 30),
              child:Text(
                "Star Rating",
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              child: ratingBar(),
            ),
            SizedBox(height: 20,),
            Container(
              child: FlatButton(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(2, 4),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xfffbb448), Color(0xfff7892b),
                      ],
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black87, width: 2),
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: drawer(),
      ),
    );
  }
}




class ratingBar extends StatelessWidget {
  const ratingBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 35),
        child: RatingBar.builder(
          initialRating: 4,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
    );
  }
}