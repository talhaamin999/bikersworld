import 'package:flutter/cupertino.dart';

class WorkshopDashboardModel {

  final String ownerName;
  final String ownerContact;
  final String shopTitle;
  final String city;
  final String area;
  final String openTime;
  final String closeTime;
  final String imageURL;
  final bool monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
      sunday;
  final String id;

  WorkshopDashboardModel(
      {this.ownerName, this.ownerContact, this.shopTitle, this.area, this.city,this.openTime, this.closeTime,this.saturday,this.sunday,this.friday,this.thursday,this.wednesday,this.tuesday,this.monday,this.imageURL,this.id});

  factory WorkshopDashboardModel.fromJson(Map<String, dynamic> json,String docId){
    return WorkshopDashboardModel(
      id: docId,
      shopTitle: json['title'],
      city: json['city'],
      area: json['area'],
      openTime: json['open_time'],
      closeTime: json['close_time'],
      ownerName: json['owner_name'],
      ownerContact: json['owner_contact'],
      imageURL: json['image'],
      monday: json['work_days']['monday'],
      tuesday: json['work_days']['tuesday'],
      wednesday: json['work_days']['wednesday'],
      thursday: json['work_days']['thursday'],
      friday: json['work_days']['friday'],
      saturday: json['work_days']['saturday'],
      sunday: json['work_days']['sunday'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': shopTitle,
      'city': city,
      'area': area,
      'owner_name': ownerName,
      'owner_contact': ownerContact,
      'open_time': openTime,
      'close_time': closeTime,
      'image': imageURL,
      'work_days': workingDays(),
    };
  }

  Map<String, dynamic> workingDays() {
    return {
      'monday' : monday,
      'tuesday' : tuesday,
      'wednesday' : wednesday,
      'thursday' : thursday,
      'friday' : friday,
      'saturday': saturday,
      'sunday' : sunday,
    };
  }
}

class Mechanics{

  final String name;
  final String contact;
  final String speciality;
  final bool mechanicStatus;
  final String id;

  Mechanics({this.name,this.contact,this.speciality,this.id,this.mechanicStatus});

  factory Mechanics.fromJson(Map<String, dynamic> json,String mechanicId){
    return Mechanics(
      id: mechanicId,
      name: json['name'],
      contact: json['contact'],
      speciality: json['speciality'],
      mechanicStatus: json['status'],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'contact': contact,
      'speciality': speciality,
      'status' : mechanicStatus,
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
class WorkshopReviews{

  final String title;
  final double starRating;
  final String description;
  final String id;

  WorkshopReviews({this.title,this.starRating,this.description,this.id});

  factory WorkshopReviews.fromJson(Map<String, dynamic> json,String docId){
    return WorkshopReviews(
      id: docId,
      title: json['title'],
      starRating: json['star_rating'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'star_rating': starRating,
      'description': description,
    };
  }

}
class MechanicReviews{

  final String title;
  final double starRating;
  final String description;
  final String id;

  MechanicReviews({this.title,this.starRating,this.description,this.id});

  factory MechanicReviews.fromJson(Map<String, dynamic> json,String docId){
    return MechanicReviews(
      id: docId,
      title: json['title'],
      starRating: json['star_rating'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'star_rating': starRating,
      'description': description,
    };
  }

}
