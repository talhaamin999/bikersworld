import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/model/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../authenticate_service.dart';
import '../toast_service.dart';

class ReviewPartstoreQueries {

  static final String PARTSTORE_COLLECTION = "partstore";
  static final String PARTSTORE_REVIEW_COLLECTION = "partstore_reviews";
  final _firebaseUser = AuthenticationService();
  final _error = ToastErrorMessage();
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  bool reviewStatus = false;

  Future<bool> reviewPartstore({@required String partStoreId,@required Reviews data}) async {
    try{
      if(_firebaseUser.getCurrentUser()){
        await _firestoreInstance.collection(PARTSTORE_COLLECTION).doc(partStoreId)
        .collection(PARTSTORE_REVIEW_COLLECTION)
            .add(data.toMap())
            .then((_) => reviewStatus = true);
        return reviewStatus;
      }else{
        _error.errorToastMessage(errorMessage: 'Need to create an account to give review');
        return reviewStatus;
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return reviewStatus;
    }
  }
  Stream<List<Reviews>> getPartstoreReview({@required String partStoreId}) {
    try{
        return _firestoreInstance.collection(PARTSTORE_COLLECTION).doc(partStoreId)
            .collection(PARTSTORE_REVIEW_COLLECTION)
            .snapshots()
            .map((querySnapshot) => querySnapshot.docs
            .map((doc) => Reviews.fromJson(doc.data(),doc.reference.id))
            .toList());

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<double> getAverageReviewOfPartStore({@required String partStoreId}) async{
     double avg = 0,total=0;
     int count = 0;
     
    try{
          final QuerySnapshot _query = await _firestoreInstance.collection(PARTSTORE_COLLECTION).doc(partStoreId)
          .collection(PARTSTORE_REVIEW_COLLECTION)
          .get();
          
          _query.docs.forEach((doc) { 
             total = total + double.tryParse(doc.get('star_rating').toString());
             count++;
          });

          if(count > 0){
            return avg = total / count;
          }
         return -2.0;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return -2.0;
  }
}