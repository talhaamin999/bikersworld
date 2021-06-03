import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/user_role_queries/add_user_role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RegisterWorkshopQueries {

   String resultMessage;
   static final String WORKSHOP_COLLECTION = "workshop";
   static String imageResult;
   static String deleteImageResult;
   final _userRole = AddUserRoleQuerie();
   final _error = ToastErrorMessage();
   final _firebaseUser = FirebaseAuth.instance.currentUser;
   final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
   final String roleErrorMessage = "You Don't Have a role OR Your Role Defined is different";

   Future registerWorkshop(WorkshopDashboardModel data) async{
     try {
       bool result = await _userRole.checkUserRole(_firebaseUser.uid,'workshop_owner');
       if(result) {
         await _firestoreInstance.collection(WORKSHOP_COLLECTION).doc(
             _firebaseUser.uid).set(
             data.toMap(), SetOptions(merge: true))
             .then((_) {
           resultMessage = "Workshop Successfully Registered";
         }).catchError((error) {
           resultMessage = error.toString();
         });
       }else{
         resultMessage = roleErrorMessage;
       }
     }catch(e){
       _error.errorToastMessage(errorMessage: e.toString());
     }
   }

   Future uploadWorkshopImage(String imageURL) async{
     await _firestoreInstance.collection(WORKSHOP_COLLECTION).doc(_firebaseUser.uid).set({
       'image' : imageURL,
     },SetOptions(merge: true))
     .then((_) {
       imageResult = 'Image Uploaded';
     })
     .catchError((onError){
       imageResult = onError.toString();
     });
   }
   Future deleteImage(String imageURL) async{

     final _storage = FirebaseStorage.instance;
     await _storage.refFromURL(imageURL).delete()
         .then((_) => deleteImageResult = "Image deleted successfully")
         .catchError((onError) => deleteImageResult = onError.toString());
   }
   Future fetchWorkshopData() async {
     await _firestoreInstance.collection(WORKSHOP_COLLECTION).doc(
         _firebaseUser.uid)
         .snapshots().listen((DocumentSnapshot snapshot) {
           return print(snapshot.data());
     });
   }
   Future<List<WorkshopDashboardModel>> getLimitedWorkshops() {
     try {
       return _firestoreInstance.collection(WORKSHOP_COLLECTION)
           .limit(10)
           .get()
           .then((querySnapshot) => querySnapshot.docs
           .map((doc) => WorkshopDashboardModel.fromJson(doc.data(), doc.reference.id))
           .toList());
     }catch(e){
       _error.errorToastMessage(errorMessage: e.toString());
     }
   }
}