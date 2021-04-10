import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/authenticate_service.dart';
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
  final _firebaseUser = AuthenticationService();
  bool reviewAdded=false,_isButtonVisible = true;

  Future<void> addReview() async{
    if(_firebaseUser.getCurrentUser()) {
      try {
        setState(() {
          _isButtonVisible = false;
        });
        if (widget.mechanicId != null && widget.workshopId != null &&
            _titleController.text.isNotEmpty &&
            _descriptionController.text.isNotEmpty) {
          final CollectionReference _collectionReference = FirebaseFirestore
              .instance
              .collection(_workshopCollection).doc(widget.workshopId)
              .collection(
              _mechanic_collection).doc(widget.mechanicId)
              .collection(
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
        else {
          _error.errorToastMessage(errorMessage: 'Fill Required Fields');
        }
      } catch (e) {
        _error.errorToastMessage(errorMessage: e.toString());
      } finally {
        setState(() {
          _isButtonVisible = true;
        });
        if (reviewAdded) {
          Future.delayed(
              new Duration(seconds: 2),
                  () {
                Navigator.pop(context);
              }
          );
        }
      }
    }else{
      _error.errorToastMessage(errorMessage: 'Need to create an account to give review');
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
                child: ReviewsTextField('Reviewer',_titleController,filter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width - 40,
                child: ReviewsTextField("Description",_descriptionController,filter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),),
              ),
              SizedBox(height: 20,),

              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
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

  ReviewsTextField(this.text,this.controller,{this.filter});

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

