import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bikersworld/model/bike_add_model.dart';

class PostAddQueries{

  final _storage = FirebaseStorage.instance;
  final String BIKE_ADD_COLLECTION = "post_add";
  bool imageUploaded = false,addPosted = false,updatedBikeInfo = false,updatedSllerInfo = false,updatedImages = false;
  final _error = ToastErrorMessage();
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;


  Future<bool> postAdd(BikeAddModel data) async{
    try {
      await _firestoreInstance.collection(BIKE_ADD_COLLECTION)
          .add(data.toMap())
          .then((_) => addPosted = true)
          .catchError((onError) =>
          _error.errorToastMessage(errorMessage: onError));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
    return addPosted;
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
  Future<List<BikeAddModel>> getSellerAdds(String postedBy) {
    try{
      return _firestoreInstance.collection(BIKE_ADD_COLLECTION)
          .where('posted_by',isEqualTo: postedBy)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  Future<String> uploadImage(File image) async{
    try {
      var file = File(image.path);
      String imageName = path.basename(image.path);
      var snapshot = await _storage.ref()
          .child('postAddImages/$imageName')
          .putFile(file)
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