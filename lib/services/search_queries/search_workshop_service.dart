
import 'package:bikersworld/model/workshop_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../toast_service.dart';

class SearchWorkshopServices {

  static final String WORKSHOP_SERVICE_COLLECTION = 'services';

  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection(WORKSHOP_SERVICE_COLLECTION);

  Stream<List<Services>> searchWorkshopByServiceTitle({@required String title}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Services.fromJson(doc.data()))
              .toList());
    } catch (e) {
      final _error = ToastErrorMessage();
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
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> searchServiceTitleWithCityFilterAndSort({@required String title,@required String city,@required String sortOrder}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('workshop_city', isEqualTo: city)
          .orderBy('price')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Services.fromJson(doc.data()))
              .toList());
    } catch (e) {
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> searchServiceTitleWithSort({@required String title,@required String sortOrder}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .orderBy('price')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Services.fromJson(doc.data()))
              .toList());
    } catch (e) {
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
}