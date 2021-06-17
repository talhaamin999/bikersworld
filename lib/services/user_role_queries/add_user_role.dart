import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../toast_service.dart';

class AddUserRoleQuerie {

  static final String _ROLE_TITLE = "role";
  bool _value = false;
  final _error = ToastErrorMessage();
  final _firebaseUser = FirebaseAuth.instance.currentUser;
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('roles');
  bool _userRoleExists = false,_generalRoleExists = false;
  static String errorMessage = '';
  String userRole = '';

  Future<bool> addUserRole(String roleTitle) async{
    try {
      bool result = await checkRoleExists(_firebaseUser.uid);
      if(result == false) {
        await _collectionReference.doc(_firebaseUser.uid).set(
            {
              _ROLE_TITLE: roleTitle,
            }).then((_) => _value = true)
            .catchError((error) => errorMessage = error.toString());
        if (_value) {
          return true;
        } else {
          return false;
        }
      }else{
        errorMessage = "Your Role is Already Defined";
        return false;
      }
    }catch(e){
      errorMessage = e.toString();
    }
  }
  Future<bool> checkUserRole(String id,String role) async{
    try{
      await _collectionReference.doc(id)
          .get()
          .then((doc) {
             if(doc.exists) {
               if(doc.get('role') == role) {
                 _userRoleExists = true;
               }
             }else{
               _userRoleExists = false;
             }
          })
          .catchError((onError) => errorMessage = onError.toString());
      return _userRoleExists;
    }catch(e){
      errorMessage = e.toString();
    }
  }
  Stream<String> getUserRole(String id) {
    try{
        return _collectionReference
            .doc(id)
            .snapshots()
            .map((doc) => userRole = doc.get('role'));
    }catch(e){
      errorMessage = e.toString();
    }

  }
  Future<bool> checkRoleExists(String id) async{
    try{
      await _collectionReference.doc(id)
          .get()
          .then((doc) {
            if(doc.exists){
              _generalRoleExists = true;
            }
            else{
              _generalRoleExists = false;
            }
      }).catchError((onError) => errorMessage = onError.toString());
      return _generalRoleExists;
    }catch(e){
      errorMessage = e.toString();
    }
  }
}