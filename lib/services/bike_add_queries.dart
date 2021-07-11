import 'dart:io';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:bikersworld/services/user_role_queries/add_user_role.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path/path.dart' as path;
import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bikersworld/model/bike_add_model.dart';

class PostAddQueries{

  final _storage = FirebaseStorage.instance;
  final String BIKE_ADD_COLLECTION = "post_add";
  bool imageUploaded = false,updatedBikeInfo = false,updatedSllerInfo = false,updatedImages = false,deletedAdd = false;
  final _error = ToastErrorMessage();
  final _firebaseUser = AuthenticationService();
  final _userRole = AddUserRoleQuerie();
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  final String roleErrorMessage = "You Don't Have the role of Seller";
  final String adPosted = "Ad Posted";
  String resultMessage;

  Future<String> postAdd(BikeAddModel data) async{
    try {
      if(_firebaseUser.getCurrentUser()) {
        bool result = await _userRole.checkUserRole(
            _firebaseUser.getUserId(), 'seller');
        if(result) {
          await _firestoreInstance.collection(BIKE_ADD_COLLECTION)
              .add(data.toMap())
              .then((_) => resultMessage = adPosted)
              .catchError((onError) => resultMessage = onError.toString());
          return resultMessage;
        }else{
          return resultMessage = roleErrorMessage;
        }
      }else{
        return resultMessage = "You'r Not Logged In";
      }
    }catch(e){
      return resultMessage = e.toString();
    }
  }

  Future<bool> updateBikeInfo(BikeAddModel data) async{
    try {
      await _firestoreInstance.collection(BIKE_ADD_COLLECTION)
          .doc(data.id)
          .update(data.mapBikeInfo())
          .then((_) => updatedBikeInfo = true)
          .catchError((onError) =>
          _error.errorToastMessage(errorMessage: onError));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return updatedBikeInfo;
  }
  Future<bool> updateSellerInfo(BikeAddModel data) async{
    try {
      await _firestoreInstance.collection(BIKE_ADD_COLLECTION)
          .doc(data.id)
          .update(data.mapSellerInfo())
          .then((_) => updatedSllerInfo = true)
          .catchError((onError) =>
          _error.errorToastMessage(errorMessage: onError));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return updatedSllerInfo;
  }
  Future<bool> deleteAdd(String docId) async{
    try {
      await _firestoreInstance.collection(BIKE_ADD_COLLECTION)
          .doc(docId)
          .delete()
          .then((_) => deletedAdd = true)
          .catchError((onError) =>
          _error.errorToastMessage(errorMessage: onError));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return deletedAdd;
  }
  Future<bool> updateImages(BikeAddModel data) async{
    try {
      await _firestoreInstance.collection(BIKE_ADD_COLLECTION)
          .doc(data.id)
          .update(data.mapBikeImages())
          .then((_) => updatedImages = true)
          .catchError((onError) =>
          _error.errorToastMessage(errorMessage: onError));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return updatedImages;
  }
  Future<List<BikeAddModel>> getLimitedAdds() {
    try {
      return _firestoreInstance.collection(BIKE_ADD_COLLECTION)
          .limit(10)
          .get()
          .then((querySnapshots) => querySnapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<List<BikeAddModel>> getSellerAdds(String postedBy) {
    try{
      return _firestoreInstance.collection(BIKE_ADD_COLLECTION)
          .where('posted_by',isEqualTo: postedBy)
          .snapshots()
          .map((querySanpshot) => querySanpshot.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
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
          .child('postAddImages/$imageName')
          .putFile(compressedFile)
          .whenComplete(() =>
      imageUploaded = true)
          .catchError((onError) => _error.errorToastMessage(errorMessage: onError.toString()));
      if(imageUploaded){
        return await snapshot.ref.getDownloadURL();
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return null;
  }
  Future<List<String>> uploadFiles(List<File> _images) async {
    var imageUrls = await Future.wait(_images.map((_image) => uploadImage(_image)));
    print(imageUrls);
    return imageUrls;
  }

}