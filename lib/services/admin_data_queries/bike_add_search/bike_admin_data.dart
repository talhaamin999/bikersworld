import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../toast_service.dart';
import 'package:bikersworld/model/bike_add_model.dart';

class BikeAdminDataQueries {

  static final String ADD_CUSTOMIZATION = "ads_customization";
  final _error = ToastErrorMessage();
  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection(ADD_CUSTOMIZATION);

  Future<List<BikeSearchModel>> getMakeAndModel() {
    try {
      return _collectionReference
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => BikeSearchModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }
    catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Stream<BikeSearchModel> getModelForMake(String make){
    try{
      return _collectionReference
          .doc(make)
          .snapshots()
          .map((doc) => BikeSearchModel.fromJson(doc.data(), doc.reference.id));
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
}

