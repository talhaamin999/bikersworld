import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPartStoreQueries {

  static final String PARTSTORE_COLLECTION = "partstore_customization";
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(PARTSTORE_COLLECTION);

  Future<List<String>> getPartStorePartCategories() async{
    final List<String> myList = [];
   try {
     await _collectionReference
         .get()
         .then((snapshot) => {
       snapshot.docs.forEach((doc) {
         print(doc.data());
         if (doc.data().containsKey('part_category')) {
           myList.add(doc.get('part_category'));
         }
       })
     });
   }catch(e){}
    return myList;
  }
  Future<List<String>> getPartStorePartType() async{
    final List<String> myList = [];
    await _collectionReference
        .get()
        .then((snapshot) => {
      snapshot.docs.forEach((doc) {
        print(doc.data());
        if(doc.data().containsKey('part_type')){
          myList.add(doc.get('part_type'));
        }
      })
    });
    return myList;
  }
}