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