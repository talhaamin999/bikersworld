import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/user_role_queries/add_user_role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../toast_service.dart';

class RegisterPartStoreQueries {

  static final String PARTSTORE_COLLECTION = "partstore";
  static String imageResult;
  static String deleteImageResult;
  final _userRole = AddUserRoleQuerie();
  final _error = ToastErrorMessage();
  final _firebaseUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  final String roleErrorMessage = "You Don't Have the role of partstore owner";
  final String partSoreRegistered = "PartStore Registered";
  final String partStoreUpdated = "PartStore Updated";
  bool imageUploaded = false,partStoreExists = false;
  String resultMessage;


  Future<String> registerPartStore(PartstoreDashboardModel data) async {
    try {
      if(_firebaseUser != null) {
        bool _roleExists = await _userRole.checkUserRole(
            _firebaseUser.uid, 'partstore_owner');
        if (_roleExists) {
          bool _shopExists = await checkPartStoreExists(userId: _firebaseUser.uid);
          if(_shopExists == false) {
            await _firestoreInstance.collection(PARTSTORE_COLLECTION).doc(
                _firebaseUser.uid).set(
                data.toMap(), SetOptions(merge: true))
                .then((_) => resultMessage = partSoreRegistered);
            return resultMessage;
          }else{
            return resultMessage = "You Already Have A Shop Registered";
          }
        }
        else {
          return resultMessage = roleErrorMessage;
        }
      }else{
        return resultMessage = "You'r Not Logged In";
      }
    } catch (e) {
      return resultMessage = e.toString();
    }
  }
  Future<String> updatePartStore(PartstoreDashboardModel data) async {
    try {
      if(_firebaseUser != null) {
          await _firestoreInstance.collection(PARTSTORE_COLLECTION)
              .doc(_firebaseUser.uid)
              .set(data.toMap(), SetOptions(merge: true))
              .then((_) => resultMessage = partStoreUpdated)
              .catchError((onError) => resultMessage = onError.toString());
            return resultMessage;
      }else{
        return resultMessage = "You'r Not Logged In";
      }
    } catch (e) {
      return resultMessage = e.toString();
    }
  }
  // Future<String> updatePartStore(PartstoreDashboardModel data) async {
  //   try {
  //     if(_firebaseUser != null) {
  //           await _firestoreInstance.collection(PARTSTORE_COLLECTION).doc(
  //               _firebaseUser.uid).set(
  //               data.toMap(), SetOptions(merge: true))
  //               .then((_) => resultMessage = partSoreRegistered);
  //           return resultMessage;
  //         }else{
  //           return resultMessage = "You Already Have A Shop Registered";
  //     }else{
  //       return resultMessage = "You'r Not Logged In";
  //     }
  //   } catch (e) {
  //     return resultMessage = e.toString();
  //   }
  // }
   Future<bool> uploadPartStoreImage({@required String imageURL,@required String docId}) async{
    await _firestoreInstance.collection(PARTSTORE_COLLECTION)
        .doc(docId).set({
      'image' : imageURL,
    },SetOptions(merge: true))
        .then((_) {
          imageUploaded = true;
    })
        .catchError((onError) => _error.errorToastMessage(errorMessage: onError.toString()));

    return imageUploaded;
  }
  Future<PartstoreDashboardModel> getPartStore() async {
    try {
      if(_firebaseUser != null) {
        return _firestoreInstance.collection(PARTSTORE_COLLECTION)
        .doc(_firebaseUser.uid)
            .get()
            .then((doc) => PartstoreDashboardModel.fromJson(doc.data(), doc.reference.id));
      }
      else{
        _error.errorToastMessage(errorMessage: "You'r not Logged In");
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<List<PartstoreDashboardModel>> getLimitedPartStore() async {
    try {
        return _firestoreInstance.collection(PARTSTORE_COLLECTION)
            .limit(10)
            .get()
            .then((querySnapshots) => querySnapshots.docs
            .map((doc) => PartstoreDashboardModel.fromJson(doc.data(), doc.reference.id))
            .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<bool> checkPartStoreExists({@required String userId}) async{
    try {
      await _firestoreInstance
          .collection(PARTSTORE_COLLECTION)
          .doc(userId)
          .get()
          .then((doc) => {
         if(doc.exists){
           partStoreExists = true
         }
      }).catchError((onError) => _error.errorToastMessage(errorMessage: onError.toString()));
      return partStoreExists;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return partStoreExists;
  }
}
