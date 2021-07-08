import 'dart:async';
import 'package:bikersworld/services/user_role_queries/add_user_role.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:bikersworld/widgets/bezierContainer.dart';


class GenericOptionScreen extends StatefulWidget {

  @override
  _GenericOptionScreenState createState() => _GenericOptionScreenState();
}

class _GenericOptionScreenState extends State<GenericOptionScreen> {

  final _userRole = AddUserRoleQuerie();
  final _error = ToastErrorMessage();
  bool _isButtonVisisble = true;
  final _valid = ToastValidMessage();

  Future<void> createRole() async{
    bool _result = false;
    try {
      setState(() {
        _isButtonVisisble = false;
      });
      if(_role == UserRole.WorkshopOwner) {
        _result = await _userRole.addUserRole('workshop_owner');
      }else if(_role == UserRole.StoreOwner){
        _result = await _userRole.addUserRole('partstore_owner');
      }else if(_role == UserRole.Seller){
        _result = await _userRole.addUserRole('seller');
      }else{
        _result = await _userRole.addUserRole('general');
      }

      if(_result){
        _valid.validToastMessage(validMessage: 'Role Added');
        setState(() {
          _isButtonVisisble = true;
        });
        Future.delayed(
          new Duration(seconds: 2),
            (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeDashboard()));
            }
        );
      }else{
        _error.errorToastMessage(errorMessage: AddUserRoleQuerie.errorMessage);
      }

    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }finally{
      setState(() {
        _isButtonVisisble = true;
      });
    }
  }

  Widget _submitButton() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 60,
        child: RaisedButton(
          onPressed: _isButtonVisisble ? () => {createRole()} : null,
          child: Text('Submit Role',style: GoogleFonts.quicksand(
              fontSize: 20,
              color: Colors.white
          ),
          ),
          color: Color(0xfff7892b),
          disabledColor: Colors.grey.shade400,
          disabledTextColor: Colors.black,
        ),
      ),
    );
  }


  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'SELECT',
          style: GoogleFonts.quicksand(
            fontSize: 30,
            color: Color(0xfff7892b),
          ),
          children: [
            TextSpan(
              text: ' ROLE',
              style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(height: 20),
                      Role(),
                      SizedBox(height: 20,),
                      _submitButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

enum UserRole { StoreOwner, WorkshopOwner, Seller , generalUser }
UserRole _role = UserRole.generalUser;

class Role extends StatefulWidget {
  Role({Key key}) : super(key: key);

  @override
  _RoleState createState() => _RoleState();
}

class _RoleState extends State<Role> {

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 15,),
        ListTile(
          title: Text('Workshop Owner' , style: GoogleFonts.varelaRound(fontSize: 20),),
          leading: Radio(
            value: UserRole.WorkshopOwner,
            groupValue: _role,
            onChanged: (UserRole value) {
              setState(() {
                _role = value;
              });
            },
          ),
        ),
        SizedBox(height: 15,),
        ListTile(
          title: Text('AutoPart Store Owner', style: GoogleFonts.varelaRound(fontSize: 20),),
          leading: Radio(
            value: UserRole.StoreOwner,
            groupValue: _role,
            onChanged: (UserRole value) {
              setState(() {
                _role = value;
              });
            },
          ),
        ),
        SizedBox(height: 15,),
        ListTile(
          title: Text('Seller', style: GoogleFonts.varelaRound(fontSize: 20),),
          leading: Radio(
            value: UserRole.Seller,
            groupValue: _role,
            onChanged: (UserRole value) {
              setState(() {
                _role = value;
              });
            },
          ),
        ),
        SizedBox(height: 15,),
        ListTile(
          title: Text('General User', style: GoogleFonts.varelaRound(fontSize: 20),),
          leading: Radio(
            value: UserRole.generalUser,
            groupValue: _role,
            onChanged: (UserRole value) {
              setState(() {
                _role = value;
              });
            },
          ),
        ),

      ],
    );
  }
}