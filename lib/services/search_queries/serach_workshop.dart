import 'dart:core';
import 'dart:core';

import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SearchWorkshop{

  static final String WORKSHOP_COLLECTION = 'workshop';
  static final String MECHANIC_COLLECTION = 'mechanics';
  static final String MECHANIC_REVIEWS_COLLECTION = 'mechanic_reviews';
  final _error = ToastErrorMessage();
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(WORKSHOP_COLLECTION);


  Stream<List<WorkshopDashboardModel>> searchWorkshopByName({@required String name}){
    try{
      return _collectionReference
          .where('title', isEqualTo: name)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => WorkshopDashboardModel.fromJson(doc.data(),doc.reference.id))
          .toList());

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<WorkshopDashboardModel> getWorkshopById(String id){
    try{
      return _collectionReference.doc(id)
          .get()
          .then((doc) => WorkshopDashboardModel.fromJson(doc.data(), doc.reference.id));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return null;
    }
  }
  Future<List<WorkshopDashboardModel>> searchWorkshopByCity({@required String city}){
    try{
      return _collectionReference
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => WorkshopDashboardModel.fromJson(doc.data(),doc.reference.id))
          .toList());

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<WorkshopDashboardModel>> searchWorkshopByNameAndCity({@required String title,@required String city}){
    try{
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('city', isEqualTo: city)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => WorkshopDashboardModel.fromJson(doc.data(),doc.reference.id))
          .toList());

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  /*
  Stream<List<WorkshopReviews>> fetchWorkshopReviews({@required String workshopId}){
    try{
      return _collectionReference.doc(workshopId).collection('workshop_reviews')
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => WorkshopReviews.fromJson(doc.data(),doc.reference.id))
          .toList());

    }catch(e){
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

   */
  Stream<List<WorkshopReviews>> fetchWorkshopReviews({@required String workshopId}){
    try{
      return _collectionReference.doc(workshopId).collection('workshop_reviews')
          .snapshots()
          .map((querySnapshots) => querySnapshots.docs
          .map((doc) => WorkshopReviews.fromJson(doc.data(), doc.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<double> getAverageReviewOfWorksop({@required String workshopId}) async{
    double avg = 0,total=0;
    int count = 0;

    try{
      final QuerySnapshot _query = await _collectionReference.doc(workshopId)
          .collection('workshop_reviews')
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
  /*
  Stream<List<MechanicReviews>> fetchWorkshopMechanicReviews({@required String mechanicId,@required String workshopId}){
    try{
      return _collectionReference.doc(workshopId).collection(MECHANIC_COLLECTION).doc(mechanicId).collection(MECHANIC_REVIEWS_COLLECTION)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => MechanicReviews.fromJson(doc.data(),doc.reference.id))
          .toList());

    }catch(e){
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

   */
  Future<List<MechanicReviews>> fetchWorkshopMechanicReviews({@required String mechanicId,@required String workshopId}){
    try{
      return _collectionReference.doc(workshopId).collection(MECHANIC_COLLECTION).doc(mechanicId).collection(MECHANIC_REVIEWS_COLLECTION)
          .get()
          .then((querySNapshots) => querySNapshots.docs
          .map((doc) => MechanicReviews.fromJson(doc.data(),doc.id))
          .toList())
          .catchError((onError) => _error.errorToastMessage(errorMessage: onError.toString()));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
}