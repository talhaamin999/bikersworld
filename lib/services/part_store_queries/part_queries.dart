import 'package:bikersworld/model/partstore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../toast_service.dart';

class AutoPartQueries {

  static final String AUTOPART_COLLECTION = "auto_parts";
  static String imageResult;
  static String deleteImageResult;
  final _error = ToastErrorMessage();
  final _firebaseUser = FirebaseFirestore.instance;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  bool partAdded = false;


  Future<bool> addAutoPart(AutoPartModel data) async {
    try {
      if (_firebaseUser != null) {
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
}