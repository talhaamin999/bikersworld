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