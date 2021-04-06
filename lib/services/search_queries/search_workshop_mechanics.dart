import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/workshop/reviews/mechanics_reviews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../toast_service.dart';

class SearchWorkshopMechanics {

  static final String WORKSHOP_COLLECTION = 'workshop';
  static final String MECHANICS_COLLECTION = 'mechanics';
  final _error = ToastErrorMessage();

  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection(WORKSHOP_COLLECTION);

  Stream<List<Mechanics>> fetchWorkshopMechanics({@required String workshopId}) {
     try {
       return _collectionReference.doc(workshopId).collection(
           MECHANICS_COLLECTION)
           .snapshots()
           .map((snapshot) =>
           snapshot.docs
               .map((doc) => Mechanics.fromJson(doc.data(), doc.reference.id))
               .toList());
     }catch(e){
       _error.errorToastMessage(errorMessage: e.toString());
     }

    }
  Stream<List<MechanicReviews>> fetchWorkshopMechanicsReviews({@required String mechanicId,@required String workshopId}) {
    try {
      return _collectionReference.doc(workshopId).collection(
          MECHANICS_COLLECTION).doc(mechanicId).collection('mechanic_reviews')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs
              .map((doc) => MechanicReviews.fromJson(doc.data(), doc.reference.id))
              .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }

  }


}
