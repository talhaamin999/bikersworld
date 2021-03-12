
final String _namePattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
final String _contactPattern = r'^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$';

class ValidateWorkshop {

  bool validateOwnerName(String name){

    //String namePattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regExp = RegExp(_namePattern);
    if(!regExp.hasMatch(name)){
      return false;
    }
    else{
      return true;
    }
  }
  bool validateOwnerContact(String contact){

    //String _contactPattern = r'^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$';
    RegExp _regExp = RegExp(_contactPattern);
    if(!_regExp.hasMatch(contact)){
      return false;
    }
    else{
      return true;
    }
  }
  bool validateShopTitle(String title){

    String _titlePattern = r"^[a-zA-Z0-9]+(([',. -][a-zA-Z0-9 ])?[a-zA-Z0-9]*)*$";
    RegExp _regExp = RegExp(_titlePattern);
    if(!_regExp.hasMatch(title)){
      return false;
    }
    else{
      return true;
    }
  }
  bool validateShopCity(String city){

    String _cityPattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp _regExp = RegExp(_cityPattern);
    if(!_regExp.hasMatch(city)){
      return false;
    }
    else{
      return true;
    }
  }
  bool validateShopArea(String area){

    String _areaPattern = r'^(?!\s*$)[a-zA-Z0-9-/ ]{1,20}$';
    RegExp _regExp = RegExp(_areaPattern);
    if(!_regExp.hasMatch(area)){
      return false;
    }
    else{
      return true;
    }
  }

}

class ValidateWorkshopServices {

  final ValidateWorkshop shop = ValidateWorkshop();

  bool validateServiceCategory(String category) {
    RegExp regExp = RegExp(_namePattern);
    if(!regExp.hasMatch(category)){
      return false;
    }
    else{
      return true;
    }
  }
  bool validateServiceTitle(String title) {
    RegExp regExp = RegExp(_namePattern);
    if(!regExp.hasMatch(title)){
      return false;
    }
    else{
      return true;
    }
  }
  bool validateServicePrice(int price) {
     if(price <= 2000){
       return true;
     }
     else{
       return false;
     }
  }
}
class ValidateWorkshopMechanics {

  bool validateMechanicName(String name) {
    RegExp regExp = RegExp(_namePattern);
    if(!regExp.hasMatch(name)){
      return false;
    }
    else{
      return true;
    }
  }
  bool validateMechanicContact(String contact) {
    RegExp regExp = RegExp(_contactPattern);
    if(!regExp.hasMatch(contact)){
      return false;
    }
    else{
      return true;
    }
  }
  bool validateMechanicSpeciality(String speciality) {
    RegExp regExp = RegExp(_namePattern);
    if(!regExp.hasMatch(speciality)){
      return false;
    }
    else{
      return true;
    }
  }
}