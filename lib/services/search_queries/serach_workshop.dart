import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SearchWorkshop{

  static final String WORKSHOP_COLLECTION = 'workshop';

  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(WORKSHOP_COLLECTION);

  Stream<List<WorkshopDashboardModel>> searchWorkshopByName({@required String name}){
    try{
      return _collectionReference
          .where('title', isEqualTo: name)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => WorkshopDashboardModel.fromJson(doc.data()))
          .toList());

    }catch(e){
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<WorkshopDashboardModel>> searchWorkshopByCity({@required String city}){
    try{
      return _collectionReference
          .where('city', isEqualTo: city)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => WorkshopDashboardModel.fromJson(doc.data()))
          .toList());

    }catch(e){
      final _error = ToastErrorMessage();
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
          .map((doc) => WorkshopDashboardModel.fromJson(doc.data()))
          .toList());

    }catch(e){
      final _error = ToastErrorMessage();
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

}