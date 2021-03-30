import 'package:bikersworld/model/workshop_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../toast_service.dart';

class RegisterMechanicQueries {

  static final String WORKSHOP_COLLECTION = "workshop";
  static final String MECHANICS_COLLECTION = "mechanics";
  static String registrationResultMessage;
  static String deletionResultMessage;
  static String updateResultMessage;

  final _firebaseUser = FirebaseAuth.instance.currentUser;

  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection(WORKSHOP_COLLECTION);

  Future<void> regesterMechanic(Mechanics data) async {
    try {
      await _collectionReference.doc(_firebaseUser.uid).collection(
          MECHANICS_COLLECTION).add(data.toMap())
          .then((_) => registrationResultMessage = 'Mechanic registered successfully')
          .catchError((error) => registrationResultMessage = error.toString());
    } on FirebaseException catch (e) {
      ToastErrorMessage errorMessage = ToastErrorMessage();
      errorMessage.errorToastMessage(
          errorMessage: e.toString());
    }
  }
  Stream<List<Mechanics>> getMechanics(){
    return _collectionReference.doc(_firebaseUser.uid).collection(
        MECHANICS_COLLECTION)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Mechanics.fromJson(doc.data()))
        .toList());
  }
  Future<void> deleteMechanic(int index) async {
    try {
      QuerySnapshot _querySnapshot = await _collectionReference.doc(_firebaseUser.uid).collection(
          MECHANICS_COLLECTION).get();
           _querySnapshot.docs[index].reference.delete()
          .then((_) => deletionResultMessage = 'Mechanic deleted successfully')
          .catchError((error) => deletionResultMessage = error.toString());
    } on FirebaseException catch (e) {
      ToastErrorMessage errorMessage = ToastErrorMessage();
      errorMessage.errorToastMessage(
          errorMessage: e.toString());
    }
  }
  Future<void> updateMechanic(Mechanics data,int index) async {
    try {
      QuerySnapshot _querySnapshot = await _collectionReference.doc(_firebaseUser.uid).collection(
          MECHANICS_COLLECTION).get();
      _querySnapshot.docs[index].reference.update(data.toMap())
    .then((_) => updateResultMessage = 'Mechanic Information Updated')
      .catchError((onError) => updateResultMessage = onError.toString());
    } on FirebaseException catch (e) {
      ToastErrorMessage errorMessage = ToastErrorMessage();
      errorMessage.errorToastMessage(
          errorMessage: e.toString());
    }
  }

}

