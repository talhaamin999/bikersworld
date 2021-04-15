

import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/services/user_role_queries/add_user_role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../toast_service.dart';

class RegisterPartStoreQueries {

  static final String PARTSTORE_COLLECTION = "partstore";
  static String imageResult;
  static String deleteImageResult;
  final _userRole = AddUserRoleQuerie();
  final _error = ToastErrorMessage();
  final _firebaseUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  final String roleErrorMessage = "You Don't Have a role OR Your Role Defined is different";
  String resultMessage;

  Future<void> registerPartStore(PartstoreDashboardModel data) async {
    try {
      if(_firebaseUser != null) {
        bool result = await _userRole.checkUserRole(
            _firebaseUser.uid, 'partstore_owner');
        if (result) {
          await _firestoreInstance.collection(PARTSTORE_COLLECTION).doc(
              _firebaseUser.uid).set(
              data.toMap(), SetOptions(merge: true))
              .then((_) {
            resultMessage = "PartStore Successfully Registered";
          });
        }
        else {
          resultMessage = roleErrorMessage;
        }
      }else{
        _error.errorToastMessage(errorMessage: 'You are not Logged In');
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
}
