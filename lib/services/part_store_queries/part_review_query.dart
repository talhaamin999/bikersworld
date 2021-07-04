import 'package:bikersworld/model/partstore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../authenticate_service.dart';
import '../toast_service.dart';

class ReviewAutoPartQueries {

  static final String AUTOPART_COLLECTION = "auto_parts";
  static final String AUTOPART_REVIEW_COLLECTION = "auto_part_reviews";
  final _firebaseUser = AuthenticationService();
  final _error = ToastErrorMessage();
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  bool reviewStatus = false;

  Future<bool> reviewAutoPart({@required String partId,@required AutoPartReviews data}) async {
    try{
      if(_firebaseUser.getCurrentUser()){
        await _firestoreInstance.collection(AUTOPART_COLLECTION).doc(partId)
            .collection(AUTOPART_REVIEW_COLLECTION)
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
  Stream<List<AutoPartReviews>> getAutoPartReviews({@required String partId}) {
    try{
        return _firestoreInstance.collection(AUTOPART_COLLECTION)
            .doc(partId)
            .collection(AUTOPART_REVIEW_COLLECTION)
            .snapshots()
            .map((querySnapshots) => querySnapshots.docs
            .map((doc) => AutoPartReviews.fromJson(doc.data(), doc.reference.id))
            .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<double> getAverageReviewOfAutoParts({@required String partId}) async{
    double avg = 0,total=0;
    int count = 0;
    try{
      final QuerySnapshot _query = await _firestoreInstance.collection(AUTOPART_COLLECTION)
          .doc(partId)
          .collection(AUTOPART_REVIEW_COLLECTION)
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