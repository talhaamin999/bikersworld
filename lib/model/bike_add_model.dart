
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
  final List<String> images;
  final String id;


  BikeAddModel({this.title,this.make,this.model,this.year,this.description,this.price,this.sellerName,this.sellerContact,this.city,this.address,this.id,this.images});

  factory BikeAddModel.fromJson(Map<String, dynamic> json,String docId){
    return BikeAddModel(
      id: docId,
      title: json['title'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      price: json['price'],
      description: json['description'],
      sellerName: json['seller_name'],
      sellerContact: json['seller_contact'],
      city: json['city'],
      address: json['address'],
      images: json['images'],
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
    };
  }

}