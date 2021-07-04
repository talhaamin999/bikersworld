import 'package:flutter/cupertino.dart';

class PartstoreDashboardModel {

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

  PartstoreDashboardModel(
      {this.ownerName, this.ownerContact, this.shopTitle, this.area, this.city,this.openTime, this.closeTime,this.saturday,this.sunday,this.friday,this.thursday,this.wednesday,this.tuesday,this.monday,this.imageURL,this.id});

  factory PartstoreDashboardModel.fromJson(Map<String, dynamic> json,String docId){
    return PartstoreDashboardModel(
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

class AutoPartModel {

  final String title;
  final String category;
  final String type;
  final int price;
  final String imageURL;
  final String partStoreId;
  final String docId;
  final String partStoreCity;

  AutoPartModel({@required this.title,@required this.category,@required this.price,@required this.type ,@required this.imageURL,@required this.partStoreId,this.docId,@required this.partStoreCity});

  factory AutoPartModel.fromJson(Map<String, dynamic> json,String id){
    return AutoPartModel(
      docId: id,
      partStoreCity: json['partStore_city'],
      imageURL: json['image'],
      title: json['title'],
      category: json['category'],
      type: json['type'],
      price: json['price'],
      partStoreId: json['partStoreId'],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'category': category,
      'type' : type,
      'partStore_city': partStoreCity,
      'image' : imageURL,
      'price': price,
      'partStoreId': partStoreId,
    };
  }

}
