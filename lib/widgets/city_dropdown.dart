import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';


class CityDropDown extends StatefulWidget {
  final TextEditingController controller;
  CityDropDown({@required this.controller});
  @override
  _CityDropDownState createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( top:10,right: 0),
      child:Container(
        color: Colors.white,
        child: SizedBox(
          width: MediaQuery.of(context).size.width ,
          child: DropdownSearch<String>(
              validator: (v) => v == null ? "required field" : null,
              hint: "Select your city",
              searchBoxDecoration: InputDecoration(
                  fillColor: Color(0xffe3e3e3)
              ),
              showSelectedItem: true,
              items: ['Karachi','Lahore','Faisalabad','Rawalpindi',"Islamabad",'Gujranwala','Peshawar',"Multan",'Hyderabad',
                'Quetta','Bahawalpur','Sargodha','Sialkot','Sukkur','Larkana','Sheikhupura',
                'Rahim Yar Khan','Jhang','Dera Ghazi Khan','Gujrat','Sahiwal','Wah Cantonment','Mardan',
                'Kasur','Okara','Mingora','Nawabshah','Chiniot','Kotri','Kāmoke','Hafizabad','Sadiqabad',
                'Mirpur Khas','Burewala','Kohat','Khanewal','Dera Ismail Khan','Turbat','Muzaffargarh',
                'Abbotabad','Mandi Bahauddin','Shikarpur','Jacobabad','Jhelum','Khanpur','Khairpur',
                'Khuzdar','Pakpattan','Hub','Daska','Gojra','Dadu','Muridke','Bahawalnagar',
                'Samundri','Tando Allahyar','Tando Adam','Jaranwala','Chishtian','Muzaffarabad',
                'Attock','Vehari','Kot Abdul Malik','Ferozwala','Chakwal','Gujranwala Cantonment',
                'Kamalia','Umerkot','Ahmedpur East','Kot Addu','Wazirabad','Mansehra','Layyah',
                'Mirpur','Swabi','Chaman','Taxila','Nowshera','Khushab','Shahdadkot','Mianwali',
                'Kabal','Lodhran','Hasilpur', 'Charsadda', 'Bhakkar', 'Badin', 'Arif Wala','Ghotki','Sambrial','Jatoi','Haroonabad','Daharki','Narowal','Tando Muhammad Khan','Kamber Ali Khan','Mirpur Mathelo','Kandhkot','Bhalwal',],
             // showClearButton: true,
              onChanged: (value){
                widget.controller.text = value;
              },
              popupItemDisabled: (String s) => s.startsWith('i'),
             // selectedItem: "Karachi",
            ),
        ),
      ),
    );
  }
}

