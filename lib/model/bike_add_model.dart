import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class BikeAddModel{

  final String title;
  final String make;
  final String model;
  final String year;
  final double price;
  final String description;
  final String sellerName;
  final String sellerContact;
  final String city;
  final String address;
  final List<dynamic> images;
  final String id;
  final String postedBy;
  final Timestamp date;

  BikeAddModel({this.title,this.make,this.model,this.year,this.description,this.price,this.sellerName,this.sellerContact,this.city,this.address,this.id,this.images,this.postedBy,this.date});

  factory BikeAddModel.fromJson(Map<String, dynamic> json,String docId){
    return BikeAddModel(
      id: docId,
      postedBy: json['posted_by'],
      title: json['title'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      price: double.tryParse(json['price'].toString()),
      description: json['description'],
      sellerName: json['seller_name'],
      sellerContact: json['seller_contact'],
      city: json['city'],
      address: json['address'],
      images: json['images'],
      date: json['post_date'],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'make':make,
      'model':model,
      'year':year,
      'price':price,
      'description':description,
      'seller_name':sellerName,
      'seller_contact':sellerContact,
      'city':city,
      'address':address,
      'images':images,
      'posted_by':postedBy,
      'post_date' : DateTime.now(),
    };
  }
  Map<String, dynamic> mapBikeInfo(){
    return {
      'title': title,
      'make':make,
      'model':model,
      'year':year,
      'price':price,
      'description':description,
    };
  }
  Map<String, dynamic> mapSellerInfo(){
    return {
      'seller_name':sellerName,
      'seller_contact':sellerContact,
      'city':city,
      'address':address,
    };
  }
  Map<String, dynamic> mapBikeImages(){
    return {
      'images':images,
    };
  }

}
class BikeSearchModel {

  final String make;
  final List<dynamic> model;
  final String id;

  BikeSearchModel({@required this.make,@required this.model,this.id});

  factory BikeSearchModel.fromJson(Map<String, dynamic> json,String docId){
    return BikeSearchModel(
      id: docId,
      make: json['make'],
      model: json['model'],
    );
  }

}