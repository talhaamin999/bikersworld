import 'package:bikersworld/model/workshop_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../toast_service.dart';

class WorkshopServiceQueries {

  static final String registerResultMessage = 'Service Successfully Registered';
  static final String _WORKSHOP_COLLECTION = "workshop";
  static final String _Service_COLLECTION = "services";
  static final String updateResultMessage = "Service Updated Successfully";
  final ToastErrorMessage _error = ToastErrorMessage();
  static final String serviceDeletionMessage = 'Service Deleted Successfully';
  String _workshopCityName;
  bool _getCityName = false;
  bool updateStatus = false,registerStatus = false,deletionStatus = false;
  String errorMessage = '';

  final _firebaseUser = FirebaseAuth.instance.currentUser;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> addWorkshopService(Services data) async{
   try {
     await _firestore.collection(_Service_COLLECTION)
         .add(data.toMap())
         .then((_) => registerStatus = true)
         .catchError((error) => errorMessage = error.toString());
     if(registerStatus){
       return true;
     }
     return false;
   }catch(e){
     _error.errorToastMessage(errorMessage: e.toString());
   }
  }
  Future<String> getWorkshopCityName() async {
    try {
      await _firestore.collection(_WORKSHOP_COLLECTION).doc(_firebaseUser.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        _workshopCityName = documentSnapshot.get('city').toString();
        _getCityName = true;
      });
      if (_getCityName) {
        return _workshopCityName;
      }
      else {
        return "";
      }
    }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<Services>> getServices({@required String serviceCategory}){
    try {
      return _firestore.collection(_Service_COLLECTION)
          .where('category', isEqualTo: serviceCategory)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs
              .map((doc) => Services.fromJson(doc.data()))
              .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<bool> deleteService({@required String category,@required int index}) async{
    try {
      QuerySnapshot _querySnapshot = await _firestore.collection(_Service_COLLECTION)
          .where('category',isEqualTo: category)
          .get();
          await _querySnapshot.docs[index].reference.delete()
            .then((_) => deletionStatus = true)
            .catchError((onError) => errorMessage = onError.toString());
     if(deletionStatus){
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      _error.errorToastMessage(
          errorMessage: e.toString());
    }
  }
  Future<bool> updateService(Services data,int index) async {
    try {
      QuerySnapshot _querySnapshot = await _firestore.collection(_Service_COLLECTION)
          .where('category', isEqualTo: data.category)
          .get();
         await _querySnapshot.docs[index].reference.update(data.toMap())
          .then((_) => updateStatus = true)
          .catchError((onError) => errorMessage = onError.toString());

      if(updateStatus){
        return true;
      }
      return false;

    } on FirebaseException catch (e) {
      _error.errorToastMessage(
          errorMessage: e.toString());
    }
  }
}