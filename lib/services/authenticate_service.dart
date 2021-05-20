import 'package:bikersworld/services/toast_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {

  static final String signedIn = "Signed In";
  static final String signedUp = "Signed Up";
  static final String FACEBOOK_SIGNIN_CANCELLED_BY_USER = "Login cancelled by the user";
  static final String FACEBOOK_RESULT_STATUS_NULL = "FACEBOOK result status is NULL";
  final _error = ToastErrorMessage();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookLogin _facebookSignIn = new FacebookLogin();
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();
  bool passwordChanged = false,imageUploaded = false;
  String userName,userImageURL,userId;

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _facebookSignIn.logOut();
    await _googleSignIn.signOut();
  }

  Future<String> signInWithEmailAndPassword({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return signedIn;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUpWithEmailAndPasword({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return signedUp;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signInWithFacebook() async {

    try {

      final result = await _facebookSignIn.logIn(['public_profile']);

      if (result.status != null) {

         if(result.status == FacebookLoginStatus.loggedIn) {

            final authResult = await _firebaseAuth.signInWithCredential(
            FacebookAuthProvider.credential(result.accessToken.token),
            );
            return signedUp;
         }
          else if (result.status == FacebookLoginStatus.cancelledByUser) {
             return FACEBOOK_SIGNIN_CANCELLED_BY_USER;
         }
         else if (result.status == FacebookLoginStatus.error) {
             return FacebookLoginStatus.error.toString();
         }
      }// End of if result status is not NULL
      else{
        return FACEBOOK_RESULT_STATUS_NULL;
      }// end of main Else statement
    }catch (e){
      return e.toString();
    }
  }
  Future<String> signInWithGoogle() async {
  try{
    final googleAccount = await _googleSignIn.signIn();
      if (googleAccount != null) {
        final googleAuth = await googleAccount.authentication;
        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          final authResult = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
        } else {
          throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Auth Token',
          );
        }
      } else {
            return "Sign In aborted by user";
      }
    }catch(e){
       return e.toString();
    }
  }

  bool getCurrentUser(){
    try {
      if(_firebaseAuth.currentUser != null){
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  Future<bool> updatePassword(String newPassword) async{
    try{
      if(_firebaseAuth.currentUser != null){
       await _firebaseAuth.currentUser
           .updatePassword(newPassword)
           .then((_) => passwordChanged = true)
           .catchError((onError) => _error.errorToastMessage(errorMessage: onError.toString()));
      }
      return passwordChanged;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return passwordChanged;
    }
  }

  String getUserEmail(){
    try{
      if(_firebaseAuth.currentUser != null){
       userName = _firebaseAuth.currentUser.email;
      }
      return userName;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return userName;
    }
  }
  String getUserId(){
    try{
      if(_firebaseAuth.currentUser != null){
        userId = _firebaseAuth.currentUser.uid;
      }
      return userId;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return userId;
    }
  }
  String getUserImageUrl() {
    try{
      if(_firebaseAuth.currentUser != null){
        userImageURL = _firebaseAuth.currentUser.photoURL;
      }
      return userImageURL;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return userImageURL;
    }
  }
  Future<bool> uploadProfileImage(String imageURL) async{
    try{
      if(_firebaseAuth.currentUser != null){
       await _firebaseAuth.currentUser
           .updateProfile(photoURL: imageURL)
           .then((_) => imageUploaded = true)
           .catchError((onError) => _error.errorToastMessage(errorMessage: onError.toString()));
      }
      return imageUploaded;
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
      return imageUploaded;
    }
  }

}
