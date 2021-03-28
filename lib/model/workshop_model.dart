import 'package:flutter/cupertino.dart';

class WorkshopDashboardModel{

  final String ownerName;
  final String ownerContact;
  final String shopTitle;
  final String city;
  final String area;
  final String openFrom;
  final String openTo;
  final String openTime;
  final String closeTime;

  WorkshopDashboardModel({this.ownerName,this.ownerContact,this.shopTitle,this.area,this.city,this.openFrom,this.openTo,this.openTime,this.closeTime});

  factory WorkshopDashboardModel.fromJson(Map<String, dynamic> json){
    return WorkshopDashboardModel(
      shopTitle: json['title'],
      city: json['city'],
      area: json['area'],
      openFrom: json['open_from'],
      openTo: json['open_to'],
      openTime: json['open_time'],
      closeTime: json['close_time'],
      ownerName: json['owner_name'],
      ownerContact: json['owner_contact'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'title': shopTitle,
      'city': city,
      'area': area,
      'owner_name' : ownerName,
      'owner_contact' : ownerContact,
      'open_from' : openFrom,
      'open_to' : openTo,
      'open_time' : openTime,
      'close_time' : closeTime
    };
  }
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