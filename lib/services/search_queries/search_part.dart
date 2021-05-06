import 'package:bikersworld/model/partstore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../toast_service.dart';

class SearchAutoParts {

  static final String PART_COLLECTION = 'auto_parts';
  final _error = ToastErrorMessage();
  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection(PART_COLLECTION);


  Future<List<AutoPartModel>> searchPartByTitle({@required String title}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
      return null;
    }
  }
  Future<List<AutoPartModel>> searchPartByCategory({@required String partStoreId,@required String category}){
    try {
        return _collectionReference
            .where('partStoreId' ,isEqualTo: partStoreId)
            .where('category',isEqualTo: category)
            .get()
            .then((querySanpshot) => querySanpshot.docs
            .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
            .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<List<AutoPartModel>> searchPartByPartStore({@required String partStoreId}){
    try {
      return _collectionReference
          .where('partStoreId' ,isEqualTo: partStoreId)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // serach parts by title and applying city filter
  Future<List<AutoPartModel>> searchPartByTitleWithCityFilter({@required String title,@required String city}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('partStore_city', isEqualTo: city)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search parts with title and applying city and type filters
  Future<List<AutoPartModel>> searchPartByTitleWithCityAndTypeFilter({@required String title,@required String city,@required String type}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('partStore_city', isEqualTo: city)
          .where('type' , isEqualTo: type)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by ttile and applying city and range filters
  Future<List<AutoPartModel>> searchPartByTitleWithCityAndRangeFilter({@required String title,@required String city,@required int min,@required int max}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('partStore_city', isEqualTo: city)
          .where('price' , isGreaterThanOrEqualTo: min)
          .where('price' , isLessThanOrEqualTo: max)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by title and applying city and sort order filters
  Future<List<AutoPartModel>> searchPartByTitleWithCityAndSortOrderFilters({@required String title,@required String city,@required String sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('partStore_city', isEqualTo: city)
            .orderBy('price')
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('partStore_city', isEqualTo: city)
          .orderBy('price',descending: true)
          .get()
          .then((querySanpshot) =>
          querySanpshot.docs
              .map((doc) =>
              AutoPartModel.fromJson(doc.data(), doc.reference.id))
              .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by ttile and apply city and type and range filters
  Future<List<AutoPartModel>> searchPartByTitleWithCityAndTypeAndRangeFilters({@required String title,@required String city,@required String type,@required int min,@required int max}) {
    try {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('partStore_city', isEqualTo: city)
            .where('price' , isGreaterThanOrEqualTo: min)
            .where('price' , isLessThanOrEqualTo: max)
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by ttile and apply city and type and sorting filters
  Future<List<AutoPartModel>> searchPartByTitleWithCityAndTypeAndSortOrderFilters({@required String title,@required String city,@required String type,@required String sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('partStore_city', isEqualTo: city)
            .orderBy('price')
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
      else{
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('partStore_city', isEqualTo: city)
            .orderBy('price',descending: true)
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by ttile and apply city and type and range and sorting filters
  Future<List<AutoPartModel>> searchPartByTitleWithCityAndTypeAndRangeAndSortOrderFilters({@required String title,@required String city,@required String type,@required int min,@required int max,@required String sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('partStore_city', isEqualTo: city)
            .where('type' , isEqualTo: type)
            .where('price' , isGreaterThanOrEqualTo: min)
            .where('price' , isLessThanOrEqualTo: max)
            .orderBy('price')
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
      else{
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('partStore_city', isEqualTo: city)
            .where('type' , isEqualTo: type)
            .where('price' , isGreaterThanOrEqualTo: min)
            .where('price' , isLessThanOrEqualTo: max)
            .orderBy('price',descending: true)
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by ttile and applying type filter
  Future<List<AutoPartModel>> searchPartByTitleWithType({@required String title,@required String type}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('type', isEqualTo: type)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part title With Type and Range Filters
  Future<List<AutoPartModel>> searchPartByTitleWithTypeAndRangeFilter({@required String title,@required String type,@required int min,@required int max}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('type' , isEqualTo: type)
          .where('price' , isGreaterThanOrEqualTo: min)
          .where('price' , isLessThanOrEqualTo: max)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part title With Type and Sorting Filters
  Future<List<AutoPartModel>> searchPartByTitleWithTypeAndSortFilter({@required String title,@required String type,@required String sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('type', isEqualTo: type)
            .orderBy('price')
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
      else{
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('type', isEqualTo: type)
            .orderBy('price',descending: true)
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by title and apply type and range and sort filters
  Future<List<AutoPartModel>> searchPartByTitleWithTypeAndRangeAndSortFilter({@required String title,@required int min,@required int max,@required String type,@required sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('type', isEqualTo: type)
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .orderBy('price')
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('type', isEqualTo: type)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .orderBy('price',descending: true)
          .get()
          .then((querySanpshot) =>
          querySanpshot.docs
              .map((doc) =>
              AutoPartModel.fromJson(doc.data(), doc.reference.id))
              .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by ttile and applying range filters
  Future<List<AutoPartModel>> searchPartByTitleWithRangeFilter({@required String title,@required int min,@required int max}) {
    try {
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('price' , isGreaterThanOrEqualTo: min)
          .where('price' , isLessThanOrEqualTo: max)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by ttile and applying range filters Sorting
  Future<List<AutoPartModel>> searchPartByTitleWithRangeAndSortFilter({@required String title,@required int min,@required int max,@required String sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .orderBy('price')
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
      return _collectionReference
          .where('title', isEqualTo: title)
          .where('price' , isGreaterThanOrEqualTo: min)
          .where('price' , isLessThanOrEqualTo: max)
          .orderBy('price',descending: true)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search part by ttile and applying Sorting
  Future<List<AutoPartModel>> searchPartByTitleWithSortFilter({@required String title,@required String sortOrder}) {
    try {
      if(sortOrder == 'LTH') {
        return _collectionReference
            .where('title', isEqualTo: title)
            .orderBy('price')
            .get()
            .then((querySanpshot) =>
            querySanpshot.docs
                .map((doc) =>
                AutoPartModel.fromJson(doc.data(), doc.reference.id))
                .toList());
      }
      return _collectionReference
          .where('title', isEqualTo: title)
          .orderBy('price',descending: true)
          .get()
          .then((querySanpshot) => querySanpshot.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<List<AutoPartModel>> getAutoPartByLimit({@required String partStoreId}){
    try {
      return _collectionReference
          .where('partStoreId',isEqualTo: partStoreId)
          .limit(5)
          .get()
          .then((querySnapshots) => querySnapshots.docs
          .map((doc) => AutoPartModel.fromJson(doc.data(),doc.reference.id))
          .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

}