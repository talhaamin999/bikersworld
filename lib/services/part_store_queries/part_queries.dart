import 'package:bikersworld/model/partstore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../toast_service.dart';

class AutoPartQueries {

  static final String AUTOPART_COLLECTION = "auto_parts";
  static String imageResult;
  static String deleteImageResult;
  final _error = ToastErrorMessage();
  final _firebaseUser = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  bool partAdded = false;


  Future<bool> addAutoPart(AutoPartModel data) async {
    try {
      if (_firebaseUser.currentUser != null) {
          await _firestoreInstance.collection(AUTOPART_COLLECTION)
              .add(data.toMap())
              .then((_) => partAdded = true);
          return partAdded;
      }else {
        _error.errorToastMessage(errorMessage: 'You are not Logged In');
        return partAdded;
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
      return partAdded;
    }
  }
  Future<List<AutoPartModel>> getAutoPartByCategory({@required String userId,@required String category}) async {
    try {
      if (userId != null) {
        return _firestoreInstance.collection(AUTOPART_COLLECTION)
            .where('partStoreId' ,isEqualTo: userId)
            .where('category',isEqualTo: category)
            .get()
            .then((querySnapshot) => querySnapshot.docs
            .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }else {
        _error.errorToastMessage(errorMessage: 'You are not Logged In');
        return null;
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
      return null;
    }
  }
}