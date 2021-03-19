import 'package:bikersworld/model/workshop_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../toast_service.dart';

class WorkshopServiceQueries {

  static String resultMessage;
  static final String completionMessage = "Service Successfully Registered";
  static final String _WORKSHOP_COLLECTION = "workshop";
  static final String _Service_COLLECTION = "services";
  String _workshopCityName;
  bool _getCityName = false;

  final _firebaseUser = FirebaseAuth.instance.currentUser;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addWorkshopService(Services data) async{
   try {
     await _firestore.collection(_Service_COLLECTION)
         .add(data.toMap())
         .then((_) => resultMessage = completionMessage)
         .catchError((error) => resultMessage = error.toString());
   }catch(e){
     resultMessage = e.toString();
   }
  }
  Future<String> getWorkshopCityName() async {
    try {
      await _firestore.collection(_WORKSHOP_COLLECTION).doc(_firebaseUser.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        _workshopCityName = documentSnapshot.get('city').toString();
        _getCityName = true;
      });
      if (_getCityName) {
        return _workshopCityName;
      }
      else {
        return "";
      }
    }catch(e){
        ToastErrorMessage error = ToastErrorMessage();
        error.errorToastMessage(errorMessage: e.toString());
    }
  }
}