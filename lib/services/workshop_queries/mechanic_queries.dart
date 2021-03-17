import 'package:bikersworld/model/workshop_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../toast_service.dart';

class RegisterMechanicQueries {

  static final String _WORKSHOP_COLLECTION = "workshop";
  static final String _MECHANICS_COLLECTION = "mechanics";
  static final String _SUCCESS = "Mechanic registered successfully";
  static String resultMessage;

  final _firebaseUser = FirebaseAuth.instance.currentUser;

  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection(_WORKSHOP_COLLECTION);

  Future<void> regesterMechanic(Mechanics data) async {
    try {
      await _collectionReference.doc(_firebaseUser.uid).collection(
          _MECHANICS_COLLECTION).add(data.toMap())
          .catchError((error) {
        resultMessage = error.toString();
      });
    } on FirebaseException catch (e) {
      ToastErrorMessage errorMessage = ToastErrorMessage();
      errorMessage.errorToastMessage(
          errorMessage: e.toString());
    }
  }
  Stream<List<Mechanics>> getMechanics(){
    return _collectionReference.doc(_firebaseUser.uid).collection(
        _MECHANICS_COLLECTION)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Mechanics.fromJson(doc.data()))
        .toList());
  }
}

