import 'package:bikersworld/model/workshop_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../toast_service.dart';

class WorkshopServiceQueries {

  static String resultMessage;
  static final String completionMessage = "Service Successfully Registered";
  static final String _WORKSHOP_COLLECTION = "workshop";
  static final String _Service_COLLECTION = "services";
  static final String SUCCESS_DELETION = "Service Deleted Successfully";
  static final String SUCCESS_UPDATE = "Service Information Updated";
  static String updateResultMessage;
  static String serviceDeletionMessage;
  String _workshopCityName;
  bool _getCityName = false;

  final _firebaseUser = FirebaseAuth.instance.currentUser;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addWorkshopService(Services data) async{
   try {
     await _firestore.collection(_Service_COLLECTION)
         .add(data.toMap())
         .then((_) => resultMessage = completionMessage)
         .catchError((error) => resultMessage = error.toString());
   }catch(e){
     resultMessage = e.toString();
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
        ToastErrorMessage error = ToastErrorMessage();
        error.errorToastMessage(errorMessage: e.toString());
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
      ToastErrorMessage error = ToastErrorMessage();
      error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<void> deleteService({@required String category,@required int index}) async{
    try {
      QuerySnapshot _querySnapshot = await _firestore.collection(_Service_COLLECTION)
          .where('category',isEqualTo: category)
          .get();
          _querySnapshot.docs[index].reference.delete()
            .then((_) => serviceDeletionMessage = 'Service Deleted Successfully')
            .catchError((onError) => serviceDeletionMessage = onError.toString());
    } on FirebaseException catch (e) {
      ToastErrorMessage errorMessage = ToastErrorMessage();
      errorMessage.errorToastMessage(
          errorMessage: e.toString());
    }
  }
  Future<void> updateService(Services data,int index) async {
    try {
      QuerySnapshot _querySnapshot = await _firestore.collection(_Service_COLLECTION)
          .where('category', isEqualTo: data.category)
          .get();
         _querySnapshot.docs[index].reference.update(data.toMap())
          .then((_) => updateResultMessage = SUCCESS_UPDATE)
          .catchError((onError) => updateResultMessage = onError.toString());

    } on FirebaseException catch (e) {
      ToastErrorMessage errorMessage = ToastErrorMessage();
      errorMessage.errorToastMessage(
          errorMessage: e.toString());
    }
  }
}