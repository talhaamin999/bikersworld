import 'package:bikersworld/model/partstore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../toast_service.dart';

class SearchAutoParts {

  static final String PART_COLLECTION = 'auto_parts';
  final _error = ToastErrorMessage();
  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection(PART_COLLECTION);


  Future<List<AutoPartModel>> searchPartByTitle({@required String title}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
      return null;
    }
  }
  /*
  Future<List<AutoPartModel>> searchPartTitleWithTypeAndRangeAndCityAndSortFilter({@required String title,@required String type,@required String sortOrder,@required city,@required int min,@required int max}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('workshop_city',isEqualTo: city)
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .orderBy('price')
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Services.fromJson(doc.data()))
                .toList());
      }else{
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .orderBy('price',descending: true)
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Services.fromJson(doc.data()))
                .toList());
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> searchServiceTitleWithRangeFilter({@required String title,@required int min,@required int max}) {
    try {
      print("testing ........");
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('price',isGreaterThanOrEqualTo: min)
          .where('price',isLessThanOrEqualTo: max)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Services.fromJson(doc.data()))
              .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> searchServiceTitleWithRangeAndSortFilter({@required String title,@required String sortOrder,@required int min,@required int max}) {
    try {
      print("testing ........");
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .orderBy('price')
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Services.fromJson(doc.data()))
                .toList());
      }else{
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .orderBy('price',descending: true)
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Services.fromJson(doc.data()))
                .toList());
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> searchServiceTitleWithRangeAndCityFilter({@required String title,@required city,@required int max,@required int min}){
    try{
      print("coccococ $min $max");
      return _collectionReference
          .where('title',isEqualTo: title)
          .where('workshop_city',isEqualTo: city)
          .where('price',isGreaterThanOrEqualTo: min)
          .where('price',isLessThanOrEqualTo: max)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Services.fromJson(doc.data()))
              .toList())
          .handleError((onError){
        _error.errorToastMessage(errorMessage: onError.toString());
      });
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> searchServiceTitleWithCityFilter({@required String title,@required String city}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('workshop_city', isEqualTo: city)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Services.fromJson(doc.data()))
              .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> searchServiceTitleWithCityFilterAndSort({@required String title,@required String city,@required String sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('workshop_city', isEqualTo: city)
            .orderBy('price')
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Services.fromJson(doc.data()))
                .toList());
      }else{
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('workshop_city', isEqualTo: city)
            .orderBy('price',descending: true)
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Services.fromJson(doc.data()))
                .toList());
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> searchServiceTitleWithSort({@required String title,@required String sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .orderBy('price')
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Services.fromJson(doc.data()))
                .toList());
      }else{
        return _collectionReference
            .where('title', isEqualTo: title)
            .orderBy('price',descending: true)
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Services.fromJson(doc.data()))
                .toList());
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

   */
}