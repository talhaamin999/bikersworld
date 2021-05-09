import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/part_store_queries/part_review_query.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/services/string_extension.dart';

class ReviewAutoPart extends StatefulWidget {
  final String partId;
  ReviewAutoPart(this.partId);
  @override
  _ReviewAutoPartState createState() => _ReviewAutoPartState();
}

class _ReviewAutoPartState extends State<ReviewAutoPart> {

  final _reviwerControler = TextEditingController();
  final _descriptionControler = TextEditingController();
  final _reviewPart = ReviewAutoPartQueries();
  final _error = ToastErrorMessage();
  final _valid = ToastValidMessage();
  bool _isButtonVisible = true;


  Future<void> addReview() async{
    try{
      setState(() {
        _isButtonVisible = false;
      });
      if(_reviwerControler.text.isNotEmpty && _descriptionControler.text.isNotEmpty){
        final _reviewData = AutoPartReviews(title: _reviwerControler.text.capitalizeFirstofEach,starRating: RatingsBar.ratings,description: _descriptionControler.text.firstinCaps);
        bool result = await _reviewPart.reviewAutoPart(partId: widget.partId, data: _reviewData);
        if(result){
          _valid.validToastMessage(validMessage: 'Review Added');
          Future.delayed(
            Duration(seconds: 2),
              (){
                Navigator.of(context).pop();
              }
          );
        }
      }else{
        _error.errorToastMessage(errorMessage: 'PLease Fill All Required Fields');
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }finally{
      setState(() {
        _isButtonVisible = true;
      });
    }
  }

  @override
  void dispose() {
    _reviwerControler.dispose();
    _descriptionControler.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff0f0f0),
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
      ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left:15,top: 30),
                child:Text(
                  "Give Review",
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:15,top:10),
                child:Text(
                  "What do you think ?",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,top: 20),
                width: MediaQuery.of(context).size.width - 40,
                child: TextFormField(
                  controller: _reviwerControler,
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffe6e6e6),
                    border: InputBorder.none,
                    labelText: "Reviewer",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20),
                child: RatingsBar(25),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width - 40,
                child: TextFormField(
                  controller: _descriptionControler,
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffe6e6e6),
                    border: InputBorder.none,
                    labelText: "Desription",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 35,
                  height: 60,
                  child: RaisedButton(
                    onPressed: _isButtonVisible ? () => {addReview()} : null,
                    child: Text('Submit',style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: Colors.white
                    ),
                    ),
                    color: Color(0xfff7892b),
                    disabledColor: Colors.grey.shade400,
                    disabledTextColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

