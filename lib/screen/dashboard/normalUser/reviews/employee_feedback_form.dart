import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';

class EmployeeFeedbackForm extends StatefulWidget {

  final String mechanicId;
  final String workshopId;

  EmployeeFeedbackForm({@required this.mechanicId,@required this.workshopId});

  @override
  _EmployeeFeedbackFormState createState() => _EmployeeFeedbackFormState();
}

class _EmployeeFeedbackFormState extends State<EmployeeFeedbackForm> {

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _mechanic_collection = 'mechanics';
  final _workshopCollection = 'workshop';
  final _mechanicReviewsCollection = 'mechanic_reviews';
  final _error = ToastErrorMessage();
  final _valid = ToastValidMessage();
  bool reviewAdded=false;

  Future<void> addReview() async{
    try {
      if (widget.mechanicId != null && widget.workshopId != null && _titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
        final CollectionReference _collectionReference = FirebaseFirestore
            .instance
            .collection(_workshopCollection).doc(widget.workshopId).collection(
            _mechanic_collection).doc(widget.mechanicId).collection(
            _mechanicReviewsCollection);

        final _reviewModel = MechanicReviews(title: _titleController.text,
            starRating: RatingsBar.ratings,
            description: _descriptionController.text);

        await _collectionReference.add(_reviewModel.toMap())
            .then((_) {
          clearFields();
          setState(() {
            reviewAdded = true;
          });
          _valid.validToastMessage(validMessage: 'Review Added');
        })
            .catchError((onError) =>
            _error.errorToastMessage(errorMessage: onError.toString()));
      }
    }catch(e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
    if(reviewAdded){
      Future.delayed(
          new Duration(seconds: 2),
              (){
            Navigator.pop(context);
          }
      );
    }
  }

  void clearFields(){
    _titleController.clear();
    _descriptionController.clear();
  }
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    print('${widget.mechanicId} ${widget.workshopId}');
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
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left:25,top: 30),
                child:Text(
                  "Give Feedback",
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:25,top: 30),
                child:Text(
                  "How did they we do ?",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: RatingsBar(40),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width - 40,
                child: ReviewsTextField(text: 'Reviewer',controller: _titleController,filter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width - 40,
                child: ReviewsTextField(text:"Description",controller: _descriptionController,),
              ),
              SizedBox(height: 20,),

              Container(
                child: FlatButton(
                  onPressed: () async{
                    await addReview();
                  },
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
            ],
          ),
        ),
      ),
    );
  }
}



class ReviewsTextField extends StatelessWidget{

  final String text;
  final TextEditingController controller;
  final TextInputFormatter filter;

  ReviewsTextField({@required this.text,@required this.controller,this.filter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      inputFormatters: [
        filter,
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe6e6e6),
        border: InputBorder.none,
        labelText: text,
      ),
    );
  }

}

