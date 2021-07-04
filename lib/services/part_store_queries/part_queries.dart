import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path/path.dart' as path;
import 'package:bikersworld/model/partstore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../toast_service.dart';

class AutoPartQueries {

  static final String AUTOPART_COLLECTION = "auto_parts";
  static String imageResult;
  static String deleteImageResult;
  final _error = ToastErrorMessage();
  final _firebaseUser = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  bool partAdded = false,partUpdated = false,deletionStatus = false,imageUploaded = false;
  String errorMessage;


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
  Future<bool> updateAutoPart(AutoPartModel data) async {
    try {
      if (_firebaseUser.currentUser != null) {
        await _firestoreInstance.collection(AUTOPART_COLLECTION)
            .doc(data.docId)
            .update(data.toMap())
            .then((_) => partUpdated = true);
        return partUpdated;
      }else {
        _error.errorToastMessage(errorMessage: 'You are not Logged In');
        return partUpdated;
      }
    } catch (e) {
      print(e.toString());
      _error.errorToastMessage(errorMessage: e.toString());
      return partUpdated;
    }
  }
  Stream<List<AutoPartModel>> getAutoPartByCategory({@required String userId,@required String category}){
    try {
      if (userId != null) {
        return _firestoreInstance.collection(AUTOPART_COLLECTION)
            .where('partStoreId' ,isEqualTo: userId)
            .where('category',isEqualTo: category)
            .snapshots()
            .map((snapshot) =>
            snapshot.docs
            .map((doc) => AutoPartModel.fromJson(doc.data(),doc.reference.id))
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
  Future<List<AutoPartModel>> getLimitedAutoPart(){
    try {
        return _firestoreInstance.collection(AUTOPART_COLLECTION)
            .limit(10)
            .get()
            .then((querySnapshot) => querySnapshot.docs
            .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
            .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<bool> deleteAutoPart({@required String docId}) async{
    try {
      DocumentSnapshot _documentSnapshot = await _firestoreInstance.collection(AUTOPART_COLLECTION)
          .doc(docId)
          .get();
      await _documentSnapshot.reference.delete()
          .then((_) => deletionStatus = true)
          .catchError((onError) => errorMessage = onError.toString());
      if(deletionStatus){
        return true;
      }else {
        _error.errorToastMessage(errorMessage: errorMessage);
        return false;
      }
    } on FirebaseException catch (e) {
      _error.errorToastMessage(
          errorMessage: e.toString());
      return false;
    }
  }
  Future<String> uploadImage(File image) async{
    try {
      print("FILE SIZE BEFORE: " + image.lengthSync().toString());
      File compressedFile = await FlutterNativeImage.compressImage(image.path,
        quality: 50,);
      print("FILE SIZE  AFTER: " + compressedFile.lengthSync().toString());
      String imageName = path.basename(image.path);
      var snapshot = await _storage.ref()
          .child('partStoreImages/$imageName')
          .putFile(compressedFile)
          .whenComplete(() =>
       imageUploaded = true)
          .catchError((onError) => _error.errorToastMessage(errorMessage: onError.toString()));
      if(imageUploaded){
        var imageUrl = await snapshot.ref.getDownloadURL();
        return imageUrl;
      }
      return null;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return null;
    }
  }
}