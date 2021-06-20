import 'package:bikersworld/model/bike_add_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../toast_service.dart';

class SearchBikeAddQueries{

  static final String BIKE_ADD_COLLECTION = "post_add";
  final _error = ToastErrorMessage();
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(BIKE_ADD_COLLECTION);

// Search bike adds with all the available filters

  Future<List<BikeAddModel>> serachByTitle({@required title}){
    try{
      return _collectionReference
          .where('title',isEqualTo: title)
          .get()
          .then((snashots) => snashots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Future<List<BikeAddModel>> searchAddByMakeAndModelAndYearAndCityAndRange({@required String make,@required String model,@required String year,@required String city,@required double min,@required double max}) {
    try {
          return _collectionReference
          .where('make', isEqualTo: make)
          .where('model', isEqualTo: model)
          .where('year', isEqualTo: year)
          .where('city', isEqualTo: city)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make model year city
  Future<List<BikeAddModel>> searchAddByMakeAndModelAndYearAndCity({@required String make,@required String model,@required String year,@required String city}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('model', isEqualTo: model)
          .where('year', isEqualTo: year)
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make model year and Range
  Future<List<BikeAddModel>> searchAddByMakeAndModelAndYearAndRange({@required String make,@required String model,@required String year,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('model', isEqualTo: model)
          .where('year', isEqualTo: year)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make model city and Range
  Future<List<BikeAddModel>> searchAddByMakeAndModelAndCityAndRange({@required String make,@required String model,@required String city,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('model', isEqualTo: model)
          .where('city', isEqualTo: city)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make year city and Range
  Future<List<BikeAddModel>> searchAddByMakeAndYearAndCityAndRange({@required String make,@required String year,@required String city,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('year', isEqualTo: year)
          .where('city', isEqualTo: city)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make model year
  Future<List<BikeAddModel>> searchAddByMakeAndModelAndYear({@required String make,@required String year,@required String model}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('model', isEqualTo: model)
          .where('year', isEqualTo: year)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make model city
  Future<List<BikeAddModel>> searchAddByMakeAndModelAndCity({@required String make,@required String city,@required String model}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('model', isEqualTo: model)
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make model Range
  Future<List<BikeAddModel>> searchAddByMakeAndModelAndRange({@required String make,@required String model,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('model', isEqualTo: model)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make year Range
  Future<List<BikeAddModel>> searchAddByMakeAndYearAndRange({@required String make,@required String year,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('year', isEqualTo: year)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make year city
  Future<List<BikeAddModel>> searchAddByMakeAndYearAndCity({@required String make,@required String year,@required String city}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('year', isEqualTo: year)
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make city Range
  Future<List<BikeAddModel>> searchAddByMakeAndCityAndRange({@required String make,@required String city,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('city', isEqualTo: city)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make model
  Future<List<BikeAddModel>> searchAddByMakeAndModel({@required String make,@required String model}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('model', isEqualTo: model)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make and year
  Future<List<BikeAddModel>> searchAddByMakeAndYear({@required String make,@required String year}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('year', isEqualTo: year)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make and year
  Future<List<BikeAddModel>> searchAddByMakeAndCity({@required String make,@required String city}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with make and Range
  Future<List<BikeAddModel>> searchAddByMakeAndRange({@required String make,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('make', isEqualTo: make)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  // Now onwards Model and rest of the filters except make

  // search with model year city range
  Future<List<BikeAddModel>> searchAddByModelAndYearAndCityAndRange({@required String model,@required String year,@required String city,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('model', isEqualTo: model)
          .where('year', isEqualTo: year)
          .where('city', isEqualTo: city)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with model year city
  Future<List<BikeAddModel>> searchAddByModelAndYearAndCity({@required String model,@required String year,@required String city}) {
    try {
      return _collectionReference
          .where('model', isEqualTo: model)
          .where('year', isEqualTo: year)
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with model year range
  Future<List<BikeAddModel>> searchAddByModelAndYearAndRange({@required String model,@required String year,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('model', isEqualTo: model)
          .where('year', isEqualTo: year)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with model year city range
  Future<List<BikeAddModel>> searchAddByModelAndCityAndRange({@required String model,@required String city,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('model', isEqualTo: model)
          .where('city', isEqualTo: city)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with model year city range
  Future<List<BikeAddModel>> searchAddByModelAndYear({@required String model,@required String year}) {
    try {
      return _collectionReference
          .where('model', isEqualTo: model)
          .where('year', isEqualTo: year)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with model and city
  Future<List<BikeAddModel>> searchAddByModelAndCity({@required String model,@required String city}) {
    try {
      return _collectionReference
          .where('model', isEqualTo: model)
          .where('city', isEqualTo: city)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  // search with model range
  Future<List<BikeAddModel>> searchAddByModelAndRange({@required String model,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('model', isEqualTo: model)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) => snapshots.docs
          .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
          .toList());
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  // Now its time for Year and its filter except make mand model

  // search with year city range
  Future<List<BikeAddModel>> searchAddByYearAndCityAndRange({@required String year,@required String city,@required double min,@required double max}) {
    try {
      return _collectionReference
          .where('year', isEqualTo: year)
          .where('city', isEqualTo: city)
          .where('price', isGreaterThanOrEqualTo: min)
          .where('price', isLessThanOrEqualTo: max)
          .get()
          .then((snapshots) =>
          snapshots.docs
              .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
              .toList());
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
    // search with year city
    Future<List<BikeAddModel>> searchAddByYearAndCity({@required String year,@required String city}) {
      try {
        return _collectionReference
            .where('year', isEqualTo: year)
            .where('city', isEqualTo: city)
            .get()
            .then((snapshots) => snapshots.docs
            .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
      }
  }
    // search with year Range
    Future<List<BikeAddModel>> searchAddByYearAndRange({@required String year,@required double min,@required double max}) {
      try {
        return _collectionReference
            .where('year', isEqualTo: year)
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .get()
            .then((snapshots) => snapshots.docs
            .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
      }
    }

    // Now Taking City And rest of the left Filters

    // search with year Range
    Future<List<BikeAddModel>> searchAddByCityAndRange({@required String city,@required double min,@required double max}) {
      try {
        return _collectionReference
            .where('city', isEqualTo: city)
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .get()
            .then((snapshots) => snapshots.docs
            .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
      }
    }
    // search with make
    Future<List<BikeAddModel>> searchAddByMake({@required String make}) {
      try {
        return _collectionReference
            .where('make', isEqualTo: make)
            .get()
            .then((snapshots) => snapshots.docs
            .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
      }
    }
    // search with model
    Future<List<BikeAddModel>> searchAddByModel({@required String model}) {
      try {
        return _collectionReference
            .where('model', isEqualTo: model)
            .get()
            .then((snapshots) => snapshots.docs
            .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
      }
    }
    // search with year
    Future<List<BikeAddModel>> searchAddByYear({@required String year}) {
      try {
        return _collectionReference
            .where('year', isEqualTo: year)
            .get()
            .then((snapshots) => snapshots.docs
            .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
      }
    }
    // search with city
    Future<List<BikeAddModel>> searchAddByCity({@required String city}) {
      try {
        return _collectionReference
            .where('city', isEqualTo: city)
            .get()
            .then((snapshots) => snapshots.docs
            .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
      }
    }
    // search with Range
    Future<List<BikeAddModel>> searchAddByRange({@required double min,@required double max}) {
      try {
        return _collectionReference
            .where('price', isGreaterThanOrEqualTo: min)
            .where('price', isLessThanOrEqualTo: max)
            .get()
            .then((snapshots) => snapshots.docs
            .map((doc) => BikeAddModel.fromJson(doc.data(), doc.reference.id))
            .toList());
      }catch(e){
        _error.errorToastMessage(errorMessage: e.toString());
      }
    }
}