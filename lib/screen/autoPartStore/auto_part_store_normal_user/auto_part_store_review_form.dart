import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_normal_user/normal_user_partstore_review.dart';
import 'package:bikersworld/services/part_store_queries/part_store_review_query.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/services/string_extension.dart';

class ReviewAutoPartStore extends StatefulWidget {
  final String partStoreId;
  ReviewAutoPartStore(this.partStoreId);
  @override
  _ReviewAutoPartStoreState createState() => _ReviewAutoPartStoreState();
}

class _ReviewAutoPartStoreState extends State<ReviewAutoPartStore> {

  final _reviewerName = TextEditingController();
  final _description = TextEditingController();
  final _partStoreReview = ReviewPartstoreQueries();
  final _error = ToastErrorMessage();
  bool _isButttonVisible = true;


  Future<void> addReview() async {
    try {
      setState(() {
        _isButttonVisible = false;
      });
      if (_reviewerName.text.isNotEmpty && _description.text.isNotEmpty) {
        final _partStoreReviewModel = PartStoreReviews(
            title: _reviewerName.text.capitalizeFirstofEach,
            description: _description.text.firstinCaps,
            starRating: RatingsBar.ratings);
        bool result = await _partStoreReview.reviewPartstore(
            partStoreId: widget.partStoreId, data: _partStoreReviewModel);
        if(result){
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
       _error.errorToastMessage(errorMessage: e.toString());
    }finally{
      setState(() {
        _isButttonVisible = true;
      });
    }
  }

  @override
  void dispose() {
    _reviewerName.dispose();
    _description.dispose();
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
                  controller: _reviewerName,
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
                  controller: _description,
                  keyboardType: TextInputType.multiline,
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
                    onPressed: _isButttonVisible ? () => {addReview()} : null,
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

