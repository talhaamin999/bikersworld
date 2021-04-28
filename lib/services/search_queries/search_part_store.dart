import 'dart:core';
import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SearchPartStore{

  static final String PARTSTORE_COLLECTION = "partstore";
  final _error = ToastErrorMessage();
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(PARTSTORE_COLLECTION);


  Future<List<PartstoreDashboardModel>> searchPartStoreByName({@required String name}){
    try{
      return _collectionReference
          .where('title', isEqualTo: name)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => PartstoreDashboardModel.fromJson(doc.data(), doc.reference.id))
          .toList());

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return null;
    }
  }
  Future<PartstoreDashboardModel> getPartStoreById(String id){
    try{
      return _collectionReference.doc(id)
          .get()
          .then((doc) => PartstoreDashboardModel.fromJson(doc.data(), doc.reference.id));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return null;
    }
  }
  Future<List<PartstoreDashboardModel>> searchPartStoreByCity({@required String city}){
    try{
      return _collectionReference
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => PartstoreDashboardModel.fromJson(doc.data(), doc.reference.id))
          .toList());

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return null;
    }
  }
  Future<List<PartstoreDashboardModel>> searchPartStoreByNameAndCity({@required String title,@required String city}){
    try{
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => PartstoreDashboardModel.fromJson(doc.data(), doc.reference.id))
          .toList());

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  //   Future<List<WorkshopReviews>> fetchWorkshopReviews({@required String workshopId}){
  //   try{
  //     return _collectionReference.doc(workshopId).collection('workshop_reviews')
  //         .get()
  //         .then((querySnapshots) => querySnapshots.docs
  //         .map((doc) => WorkshopReviews.fromJson(doc.data(), doc.id))
  //         .toList());
  //   }catch(e){
  //     _error.errorToastMessage(errorMessage: e.toString());
  //   }
  // }
  // Future<List<MechanicReviews>> fetchWorkshopMechanicReviews({@required String mechanicId,@required String workshopId}){
  //   try{
  //     return _collectionReference.doc(workshopId).collection(MECHANIC_COLLECTION).doc(mechanicId).collection(MECHANIC_REVIEWS_COLLECTION)
  //         .get()
  //         .then((querySNapshots) => querySNapshots.docs
  //         .map((doc) => MechanicReviews.fromJson(doc.data(),doc.id))
  //         .toList())
  //         .catchError((onError) => _error.errorToastMessage(errorMessage: onError.toString()));
  //   }catch(e){
  //     _error.errorToastMessage(errorMessage: e.toString());
  //   }
  // }
}