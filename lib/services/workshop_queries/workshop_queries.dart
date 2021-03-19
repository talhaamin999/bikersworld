import 'package:bikersworld/screen/workshop/add_services.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class RegisterWorkshopQueries {

   static final String _WORKSHOP_TITLE = "title";
   static final String _WORKSHOP_CITY = "city";
   static final String _WORKSHOP_AREA = "area";
   static final String _OWNER_NAME = "owner_name";
   static final String _OWNER_CONTACT = "owner_contact";
   static final String _WORKSHOP_STATUS = "status";
   static String resultMessage;
   static final String _WORKSHOP_COLLECTION = "workshop";

   final _firebaseUser = FirebaseAuth.instance.currentUser;
   final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

   Future registerWorkshop(String shopTitle,String shopCity,String shopArea,String ownerName,String ownerContact) async{
      await _firestoreInstance.collection(_WORKSHOP_COLLECTION).doc(_firebaseUser.uid).set(
          {
             _WORKSHOP_TITLE: shopTitle,
             _WORKSHOP_CITY: shopCity,
             _WORKSHOP_AREA: shopArea,
             _OWNER_NAME: ownerName,
             _OWNER_CONTACT: ownerContact,
             _WORKSHOP_STATUS: {
                "shop_status": true,
                "to": "",
                "from": "",
             }
         },SetOptions(merge: true))
          .then((_) {
            resultMessage = "Workshop Successfully Registered";
      }).catchError((error){
        resultMessage = error.toString();
      });
   }
   Future fetchWorkshopData() async {
     await _firestoreInstance.collection(_WORKSHOP_COLLECTION).doc(
         _firebaseUser.uid)
         .snapshots().listen((DocumentSnapshot snapshot) {
           return print(snapshot.data());
     });
   }
}