import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../toast_service.dart';

class RegisterMechanicQueries {

  static final String _MECHANIC_NAME = "name";
  static final String _MECHANIC_CONTACT = "contact";
  static final String _MECHANIC_SPECIALITY = "speciality";
  static final String _WORKSHOP_COLLECTION = "workshop";
  static final String _MECHANICS_COLLECTION = "mechanics";
  static final String _SUCCESS = "Mechanic registered successfully";

  final _firebaseUser = FirebaseAuth.instance.currentUser;

  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection(_WORKSHOP_COLLECTION);

  Future<void> regesterMechanic(String mechanicName, String mechanicContact,
      String speciality) async {
    try {
      await _collectionReference.doc(_firebaseUser.uid).collection(
          _MECHANICS_COLLECTION).add(
          {
            _MECHANIC_NAME: mechanicName,
            _MECHANIC_CONTACT: mechanicContact,
            _MECHANIC_SPECIALITY: speciality,
          }).then((_) {
        ToastValidMessage valid = ToastValidMessage(validMessage: _SUCCESS);
        valid.validToastMessage();
      }).catchError((error) {
        ToastErrorMessage errorMessage = ToastErrorMessage(
            errorMessage: error.toString());
        errorMessage.errorToastMessage();
      });
    } on FirebaseException catch(e) {
      ToastErrorMessage errorMessage = ToastErrorMessage(
          errorMessage: e.toString());
      errorMessage.errorToastMessage();
    }
  }
}