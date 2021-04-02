import 'dart:async';
import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/workshop/workshop_dashboard.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/validate_service.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:bikersworld/widgets/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:bikersworld/widgets/bottom_modal_sheet.dart';


ToastErrorMessage error = ToastErrorMessage();
ToastValidMessage valid = ToastValidMessage();
bool _isTitleEmpty = false;
bool _isCityEmpty = false;
bool _isAreaEmpty = false;
bool _isNameEmpty = false;
bool _isContactEmpty = false;
int fieldEmptyChecker = 0;
String dayFromSelected = 'Monday',dayToSelected = 'Saturday',openTime = '7:15 am',closeTime = '8:00 pm';
bool monday=false,tuesday=false,wednesday=false,thursday=false,friday=false,saturday=false,sunday=false;

class RegisterWorkshop extends StatefulWidget {

  final WorkshopDashboardModel data;
  RegisterWorkshop({this.data});
  @override
  _RegisterWorkshopState createState() => _RegisterWorkshopState();
}

class _RegisterWorkshopState extends State<RegisterWorkshop> {
  int currentIndex;
  final TextEditingController _shopTitleController = TextEditingController();
  final TextEditingController _shopCityController = TextEditingController();
  final TextEditingController _shopSpecificAreaController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _ownerContactController = TextEditingController();
  String imageUrl;

  @override
  void initState() {
    mapValues();
    super.initState();
    currentIndex = 0;
  }
  mapValues(){
    if(widget.data != null) {
      _shopTitleController.text = widget.data.shopTitle;
      _shopCityController.text = widget.data.city;
      _shopSpecificAreaController.text = widget.data.area;
      _ownerNameController.text = widget.data.ownerName;
      _ownerContactController.text = widget.data.ownerContact;
      openTime = widget.data.openTime;
      closeTime = widget.data.closeTime;
      monday = widget.data.monday;
      tuesday = widget.data.tuesday;
      wednesday = widget.data.wednesday;
      thursday = widget.data.thursday;
      friday = widget.data.friday;
      saturday = widget.data.saturday;
      sunday = widget.data.sunday;
      imageUrl = widget.data.imageURL;
    }
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  void dispose() {
    _shopTitleController.dispose();
    _shopCityController.dispose();
    _shopSpecificAreaController.dispose();
    _ownerNameController.dispose();
    _ownerContactController.dispose();
    super.dispose();
  }
  void clear(){
    _shopTitleController.clear();
    _shopCityController.clear();
    _shopSpecificAreaController.clear();
    _ownerNameController.clear();
    _ownerContactController.clear();
    monday = false;
    tuesday = false;
    wednesday = false;
    thursday = false;
    friday = false;
    saturday = false;
    sunday = false;
  }
  void checkEmptyField(){
    setState(() {
    if(_shopTitleController.text.isEmpty){
      _isTitleEmpty = true;
    }
    else{
      _isTitleEmpty = false;
    }
    if(_shopSpecificAreaController.text.isEmpty){
      _isAreaEmpty = true;
    }
    else{
      _isAreaEmpty = false;
    }
    if(_ownerNameController.text.isEmpty){
      _isNameEmpty = true;
    }
    else{
      _isNameEmpty = false;
    }
    if(_ownerContactController.text.isEmpty){
      _isContactEmpty = true;
    }
    else{
      _isContactEmpty = false;
    }
    if(_isTitleEmpty == false && _isCityEmpty == false && _isAreaEmpty == false && _isNameEmpty == false && _isContactEmpty == false) {
      fieldEmptyChecker = 1;
    }
    });

  }
  void validateFields(){

    if(fieldEmptyChecker == 1){
      ValidateWorkshop _workShop = ValidateWorkshop();
      if(!_workShop.validateShopTitle(_shopTitleController.text.trim()) && !_workShop.validateShopCity(_shopCityController.text.trim()) && !_workShop.validateShopArea(_shopSpecificAreaController.text.trim()) && !_workShop.validateOwnerName(_ownerNameController.text.trim()) && !_workShop.validateOwnerContact(_ownerContactController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Data in every Fields");
      }
      else if(!_workShop.validateShopTitle(_shopTitleController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Shop Title");
      }
      else if(!_workShop.validateShopCity(_shopCityController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid City Name");
      }
      else if(!_workShop.validateShopArea(_shopSpecificAreaController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Specific Area Title");
      }
      else if(!_workShop.validateOwnerName(_ownerNameController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Owner Name");
      }
      else if(!_workShop.validateOwnerContact(_ownerContactController.text.trim())){
        error.errorToastMessage(errorMessage: "You Need To Enter Valid Pakistan Number");
      }
      else if(!monday && !tuesday && !wednesday && !thursday && !friday && !saturday && !sunday){
        error.errorToastMessage(errorMessage: "Working days not selected");
      }
      else{
        addWorkshop();
      }
    }
  }

  Future<void> addWorkshop() async{
    try {

      final _data = WorkshopDashboardModel(shopTitle: _shopTitleController.text,city: _shopCityController.text,area: _shopSpecificAreaController.text,openTime: openTime,closeTime: closeTime, ownerName: _ownerNameController.text,ownerContact: _ownerContactController.text,monday: monday,tuesday: tuesday,wednesday: wednesday,thursday: thursday,friday: friday,saturday: saturday,sunday: sunday,imageURL: imageUrl);
      final RegisterWorkshopQueries register = RegisterWorkshopQueries();
      await register.registerWorkshop(_data);
        if(RegisterWorkshopQueries.resultMessage == "Workshop Successfully Registered"){
          if(widget.data != null){
            valid.validToastMessage(validMessage: 'Workshop Successfully Updated');
          }
          else{
            valid.validToastMessage(
                validMessage: RegisterWorkshopQueries.resultMessage);
           }
          clear();
          Future.delayed(
              new Duration(seconds: 2),
                (){
                Navigator.of(this.context)
                    .push(MaterialPageRoute(builder: (context) => WorkshopDashboard())
                );
          },
          );

        }
        else{
          error.errorToastMessage(errorMessage: RegisterWorkshopQueries.resultMessage);
        }
    }catch(e){
      error.errorToastMessage(errorMessage: e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
            leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
              onPressed:() => Navigator.pop(context),
            )
        ),
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      _title(widget.data != null ? 'Update' : 'Register'),
                      SizedBox(height: 20),
                      _registerWorkshopWidget(shopTitleController: _shopTitleController,shopCityController: _shopCityController,shopSpecificAreaController: _shopSpecificAreaController,ownerNameController: _ownerNameController,ownerContactController: _ownerContactController),
                      SizedBox(height: 20),

                    FlatButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                        child: Text(
                         widget.data != null ? 'Update' : 'Register',
                          style: GoogleFonts.krub(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: (){
                        checkEmptyField();
                        validateFields();
                      },
                    ),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: drawer(),
      ),
    );
  }
}
Widget _entryField(String title,TextEditingController controller,TextInputType inputType,FilteringTextInputFormatter filter,bool _isFieldEmpty,)
{

  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.quicksand(
            fontSize: 18,
          )
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          inputFormatters: <TextInputFormatter>[
            filter,
          ],
          decoration: InputDecoration(
            errorText: _isFieldEmpty ? "$title is a Required property": null,
            border: InputBorder.none,
            fillColor: Color(0xfff3f3f4),
            filled: true,
          ),
        ),
      ],
    ),
  );
}
Widget _registerWorkshopWidget({@required TextEditingController shopTitleController,@required TextEditingController shopCityController,@required TextEditingController shopSpecificAreaController,@required TextEditingController ownerNameController,@required TextEditingController ownerContactController}) {

  BuildContext context;

  String city_id;
  List<String> city = [
    'Karachi','Lahore','Faisalabad','Rawalpindi','Gujranwala','Peshawar',"Multan",'Hyderabad',
    'Islamabad','Quetta','Bahawalpur','Sargodha','Sialkot','Sukkur','Larkana','Sheikhupura',
    'Rahim Yar Khan','Jhang','Dera Ghazi Khan','Gujrat','Sahiwal','Wah Cantonment','Mardan',
    'Kasur','Okara','Mingora','Nawabshah','Chiniot','Kotri','Kāmoke','Hafizabad','Sadiqabad',
    'Mirpur Khas','Burewala','Kohat','Khanewal','Dera Ismail Khan','Turbat','Muzaffargarh',
    'Abbotabad','Mandi Bahauddin','Shikarpur','Jacobabad','Jhelum','Khanpur','Khairpur',
    'Khuzdar','Pakpattan','Hub','Daska','Gojra','Dadu','Muridke','Bahawalnagar',
    'Samundri','Tando Allahyar','Tando Adam','Jaranwala','Chishtian','Muzaffarabad',
    'Attock','Vehari','Kot Abdul Malik','Ferozwala','Chakwal','Gujranwala Cantonment',
    'Kamalia','Umerkot','Ahmedpur East','Kot Addu','Wazirabad','Mansehra','Layyah',
    'Mirpur','Swabi','Chaman','Taxila','Nowshera','Khushab','Shahdadkot','Mianwali',
    'Kabal','Lodhran','Hasilpur', 'Charsadda', 'Bhakkar', 'Badin', 'Arif Wala','Ghotki','Sambrial','Jatoi','Haroonabad','Daharki','Narowal','Tando Muhammad Khan','Kamber Ali Khan','Mirpur Mathelo','Kandhkot','Bhalwal',
  ];

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              Text('Workshop Information', style: GoogleFonts.quicksand(
                  fontSize: 16, fontWeight: FontWeight.w600),),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        _entryField("Workshop Name", shopTitleController, TextInputType.text,
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
            _isTitleEmpty),
//        _entryField("City", shopCityController, TextInputType.text,
//            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
//            _isCityEmpty),

      Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          "City",
          style: GoogleFonts.quicksand(
            fontSize:18,
          ),
        ),
      ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            child: Column(
                children: <Widget>[
                  DropDownField(
                    controller: shopCityController,
                    onValueChanged: (dynamic value) {
                      city_id = value;
                    },
                    value: city_id,
                    required: false,
                    items: city,
                    textStyle: GoogleFonts.quicksand(
                      fontSize: 15,
                    ),
                  ),
                ],
            ),
          ),
        ),

        SizedBox(height: 10,),
        _entryField("Address", shopSpecificAreaController, TextInputType.text,
            FilteringTextInputFormatter.allow(
                RegExp(r'^(?!\s*$)[a-zA-Z0-9-#,/ ]{1,30}$')), _isAreaEmpty),

        SizedBox(height: 10),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Text('Workshop Status', style: GoogleFonts.quicksand(
                        fontSize: 16, fontWeight: FontWeight.w600),),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Container(
                child: Text(
                    "Day",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                    )
                ),
              ),

              SizedBox(height: 10,),

              BottomModalSheet(),


              SizedBox(height: 20,),

              Container(
                child: Text(
                    "Date",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                    )
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text(
                              "Opening Time",
                              style: GoogleFonts.quicksand(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: TimePicker(time: 'open',),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30,),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Text(
                            "Closing Time",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TimePicker(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              Text('Owner Information', style: GoogleFonts.quicksand(
                  fontSize: 16, fontWeight: FontWeight.w600),),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),

        _entryField("Owner Name", ownerNameController, TextInputType.text,
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
            _isNameEmpty),
        _entryField(
            "Contact Number", ownerContactController, TextInputType.number,
            FilteringTextInputFormatter.digitsOnly, _isContactEmpty),

      ],
    );

}

Widget _title(String value) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
        text: value,
        style: GoogleFonts.quicksand(
          fontSize: 30,
          color: Color(0xfff7892b),
        ),
        children: [
          TextSpan(
            text: ' Workshop',
            style: GoogleFonts.quicksand(
              fontSize: 30,
              color: Colors.black,
            )
          ),
        ]),
  );
}
class SpecializationComboBox extends StatefulWidget {

  final String day;
  SpecializationComboBox({Key key,this.day}) : super(key: key);
  @override
  _SpecializationComboBoxState createState() => _SpecializationComboBoxState();
}

class _SpecializationComboBoxState extends State<SpecializationComboBox> {

  var _dropDownItems=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff3f3f4),
      width: 160,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: widget.day == 'Monday' ? dayFromSelected : dayToSelected,
          icon: Container(
            margin: EdgeInsets.only(left: 10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
              child: Icon(
                FontAwesomeIcons.caretDown,
              ),
            ),
          ),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black,),
          underline: Container(
            height: 2,
          ),
          onChanged: (String newValue) {
            setState(() {
              if(widget.day == 'Monday'){
                dayFromSelected = newValue;
              }else{
                dayToSelected = newValue;
              }
            });
          },
          items: _dropDownItems
              .map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem, style: GoogleFonts.quicksand(fontSize: 15)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class TimePicker extends StatefulWidget {
  final String time;
  TimePicker({this.time});
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _openTimeSelected = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _closeTimeSelected = TimeOfDay(hour: 8, minute: 00);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: widget.time == 'open' ? _openTimeSelected : _closeTimeSelected,
    );
    if (newTime != null) {
      setState(() {
        if(widget.time == 'open'){
          _openTimeSelected = newTime;
          openTime = _openTimeSelected.format(context);
          print(openTime);
        }else{
          _closeTimeSelected = newTime;
          closeTime = _closeTimeSelected.format(context);
          print(closeTime);
        }
      });
    }
  }

  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          color: Color(0xfff3f3f4),
          onPressed: _selectTime,
          child: Text(
            'Time',
            style: GoogleFonts.quicksand(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Selected Time: ${widget.time == 'open' ? _openTimeSelected.format(context) : _closeTimeSelected.format(context)}",
          style: GoogleFonts.quicksand(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: shrinePink100,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
  )
      .apply(
    fontFamily: 'Rubik',
    displayColor: shrineBrown900,
    bodyColor: shrineBrown900,
  );
}


const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink400,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);
class BottomModalSheet extends StatelessWidget {

  const BottomModalSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        height: 50,
        minWidth: MediaQuery.of(context).size.width,
        color: Color(0xfff3f3f4),
        child: Text(
          'Working Days',
          style: GoogleFonts.quicksand(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 330,
                color: Color(0xfff3f3f4),
                child:Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Select working days',
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      MyCheckBox(),
                      SizedBox(height: 20,),
                      Center(
                        child: FlatButton(
                          color: Colors.orange,
                          child: Text(
                            'Submit',
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class MyCheckBox extends StatefulWidget {

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: monday,
                    onChanged: (bool value) {
                      setState(() {
                        monday = value;
                      });
                    },
                  ),
                  Text("Monday" ,style: GoogleFonts.quicksand(fontSize: 16),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Row(
                  children: [
                    Checkbox(
                      value: tuesday,
                      onChanged: (bool value) {
                        setState(() {
                          tuesday = value;
                        });
                      },
                    ),
                    Text("Tuesday",style: GoogleFonts.quicksand(fontSize: 16),),
                  ],
                ),
              ),
              SizedBox(width: 40,),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: wednesday,
                    onChanged: (bool value) {
                      setState(() {
                        wednesday = value;
                      });
                    },
                  ),
                  Text("Wednesday" ,style: GoogleFonts.quicksand(fontSize: 16),),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: thursday,
                    onChanged: (bool value) {
                      setState(() {
                        thursday = value;
                      });
                    },
                  ),
                  Text("Thursday",style: GoogleFonts.quicksand(fontSize: 16),),
                ],
              ),
              SizedBox(width: 40,),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: friday,
                    onChanged: (bool value) {
                      setState(() {
                        friday = value;
                      });
                    },
                  ),
                  Text("Friday" ,style: GoogleFonts.quicksand(fontSize: 16),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:40),
                child: Row(
                  children: [
                    Checkbox(
                      value: saturday,
                      onChanged: (bool value) {
                        setState(() {
                          saturday = value;
                        });
                      },
                    ),
                    Text("Saturday",style: GoogleFonts.quicksand(fontSize: 16),),
                  ],
                ),
              ),
              SizedBox(width: 40,),

            ],
          ),
        ),


        Row(
          children: [
            Checkbox(
              value: sunday,
              onChanged: (bool value) {
                setState(() {
                  sunday = value;
                });
              },
            ),
            Text("Sunday",style: GoogleFonts.quicksand(fontSize: 16),),
          ],
        ),
      ],
    );
  }
}