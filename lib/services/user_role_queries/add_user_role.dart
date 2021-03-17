import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../toast_service.dart';

class AddUserRoleQuerie {

  static final String _ROLE_TITLE = "role";
  static bool _value = false;

  final _firebaseUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  Future<bool> addUserRole(String roleTitle) async{
    await _firestoreInstance.collection("roles").doc(_firebaseUser.uid).set(
        {
          _ROLE_TITLE: roleTitle,
        }).then((_) {
      _value = true;
    }).catchError((error){
      ToastErrorMessage errorMessage = ToastErrorMessage();
      errorMessage.errorToastMessage(errorMessage: error.toString());
      _value = false;
    });
    if(_value){
      return true;
    }else {
      return false;
    }
  }
}