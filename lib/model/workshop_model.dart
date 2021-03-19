import 'package:flutter/cupertino.dart';

class WorkshopDashboardModel{

  String _ownerName;
  String _ownerContact;
  String _shopTitle;
  String _city;
  String _area;
  WorkshopDashboardModel(this._shopTitle,this._city,this._area,this._ownerName,this._ownerContact);

  String get ownerName => _ownerName;

  String get ownerContact => _ownerContact;

  String get shopTitle => _shopTitle;

  String get city => _city;

  String get area => _area;
}

class Mechanics{

  final String name;
  final String contact;
  final String speciality;

  Mechanics({this.name,this.contact,this.speciality});

  factory Mechanics.fromJson(Map<String, dynamic> json){
    return Mechanics(
      name: json['name'],
      contact: json['contact'],
      speciality: json['speciality'],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'contact': contact,
      'speciality': speciality,
    };
  }

}
class Services{

  final String title;
  final String category;
  final int price;
  final String workshopCity;
  final String workshopId;

  Services({@required this.title,@required this.category,@required this.price,@required this.workshopCity,@required this.workshopId});

  factory Services.fromJson(Map<String, dynamic> json){
    return Services(
      title: json['title'],
      category: json['category'],
      price: json['price'],
      workshopCity: json['workshop_city'],
      workshopId: json['workshopId'],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'category': category,
      'price': price,
      'workshop_city': workshopCity,
      'workshopId': workshopId,
    };
  }

}