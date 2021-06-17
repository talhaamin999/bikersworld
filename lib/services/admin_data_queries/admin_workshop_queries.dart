import 'package:cloud_firestore/cloud_firestore.dart';

class AdminWorkshopQueries {


  static final String WORKSHOP_COLLECTION = "workshop_customization";
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(WORKSHOP_COLLECTION);

  Future<List<String>> getWorkshopMechanicSpeciality() async{
    List<String> myList = [];
    await _collectionReference
    .get()
    .then((snapshot) => {
      snapshot.docs.forEach((doc) {
        print(doc.data());
        if(doc.data().containsKey('mechanic_speciality')){
          print("true");
          myList.add(doc.get('mechanic_speciality'));
        }
      })
     });
    return myList;
  }
  Future<List<String>> getWorkshopServiceCategory() async{
    List<String> myList = [];
    await _collectionReference
        .get()
        .then((snapshot) => {
      snapshot.docs.forEach((doc) {
        print(doc.data());
        if(doc.data().containsKey('service_category')){
          print("true");
          myList.add(doc.get('service_category'));
        }
      })
    });
    return myList;
  }
}