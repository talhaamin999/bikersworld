import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../toast_service.dart';

class WorkshopServiceQueries {

  static final String _SERVICE_TITLE = "title";
  static final String _SERVICE_CATEGORY = "category";
  static final String _SERVICE_PRICE = "price";
  static final String _completionMessage = "Service Successfully Registered";
  static final String _WORKSHOP_ID = "workshop_id";
  static final String _WORKSHOP_CITY = "workshop city";
  static String _workshopCityName = "";
  bool _getCityName = false;

  final _firebaseUser = FirebaseAuth.instance.currentUser;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addWorkshopService(String serviceTitle,String serviceCategory,int servicePrice) async{
    _workshopCityName = await getWorkshopCityName();
    await _firestore.collection("services").add(
        {
          _SERVICE_TITLE: serviceTitle,
          _SERVICE_CATEGORY: serviceCategory,
          _SERVICE_PRICE : servicePrice,
          _WORKSHOP_ID : _firebaseUser.uid,
          _WORKSHOP_CITY : _workshopCityName

        }).then((_) {
      ToastValidMessage valid = ToastValidMessage(validMessage: _completionMessage);
      valid.validToastMessage();
    }).catchError((error){
      ToastErrorMessage errorMessage = ToastErrorMessage(errorMessage: error.toString());
      errorMessage.errorToastMessage();
    });
  }
  Future<String> getWorkshopCityName() async{
     await _firestore.collection("workshop").doc(_firebaseUser.uid).get()
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
   }
}