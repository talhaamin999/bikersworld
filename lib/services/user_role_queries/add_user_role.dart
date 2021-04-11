import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../toast_service.dart';

class AddUserRoleQuerie {

  static final String _ROLE_TITLE = "role";
  bool _value = false;
  final _error = ToastErrorMessage();
  final _firebaseUser = FirebaseAuth.instance.currentUser;
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('roles');
  bool _roleExists = false;
  static String errorMessage = '';

  Future<bool> addUserRole(String roleTitle) async{
    try {
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
    }catch(e){
      errorMessage = e.toString();
    }
  }
  Future<bool> getUserRole(String id,String role) async{
    try{
      await _collectionReference.doc(id)
          .get()
          .then((doc) {
             if(doc.exists) {
               if(doc.get('role') == role) {
                 _roleExists = true;
               }
             }else{
               _roleExists = false;
             }
          })
          .catchError((onError) => errorMessage = onError.toString());
      return _roleExists;
    }catch(e){
      errorMessage = e.toString();
    }
  }
}