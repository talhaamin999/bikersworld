import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterWorkshopQueries {

   static final String _WORKSHOP_TITLE = "title";
   static final String _WORKSHOP_CITY = "city";
   static final String _WORKSHOP_AREA = "area";
   static final String _OWNER_NAME = "owner name";
   static final String _OWNER_CONTACT = "owner contact";
   static final String _WORKSHOP_STATUS = "status";
   static final String _completionMessage = "Workshop Successfully Registered";

   final _firebaseUser = FirebaseAuth.instance.currentUser;
   final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

   Future<void> registerWorkshop(String shopTitle,String shopCity,String shopArea,String ownerName,String ownerContact) async{
      await _firestoreInstance.collection("workshop").doc(_firebaseUser.uid).set(
          {
             _WORKSHOP_TITLE: shopTitle,
             _WORKSHOP_CITY: shopCity,
             _WORKSHOP_AREA: shopArea,
             _OWNER_NAME: ownerName,
             _OWNER_CONTACT: ownerContact,
             _WORKSHOP_STATUS: {
                "shop status": true,
                "to": "",
                "from": "",
             }
          }).then((_) {
        ToastValidMessage valid = ToastValidMessage(validMessage: _completionMessage);
        valid.validToastMessage();
      }).catchError((error){
        ToastErrorMessage errorMessage = ToastErrorMessage(errorMessage: error.toString());
        errorMessage.errorToastMessage();
      });
   }
}