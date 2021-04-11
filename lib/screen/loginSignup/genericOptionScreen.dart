import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/signup.dart';
import 'package:bikersworld/screen/dashboard/home.dart';

import 'package:bikersworld/widgets/bezierContainer.dart';


class GenericOptionScreen extends StatefulWidget {

  @override
  _GenericOptionScreenState createState() => _GenericOptionScreenState();
}

class _GenericOptionScreenState extends State<GenericOptionScreen> {

  Widget _submitButton() {
    return FlatButton(
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
            colors: [Color(0xfffbb448), Color(0xfff7892b),
            ],
          ),
        ),
        child: Text(
          'Submit',
          style: GoogleFonts.quicksand(
              fontSize: 20,
              color: Colors.white
          ),
        ),
      ),
      onPressed: (){

      },
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

class Role extends StatefulWidget {
  Role({Key key}) : super(key: key);

  @override
  _RoleState createState() => _RoleState();
}

class _RoleState extends State<Role> {
  UserRole _site = UserRole.WorkshopOwner;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 15,),
        ListTile(
          title: Text('Workshop Owner' , style: GoogleFonts.varelaRound(fontSize: 20),),
          leading: Radio(
            value: UserRole.WorkshopOwner,
            groupValue: _site,
            onChanged: (UserRole value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        SizedBox(height: 15,),
        ListTile(
          title: Text('Auto Part Store Owner', style: GoogleFonts.varelaRound(fontSize: 20),),
          leading: Radio(
            value: UserRole.StoreOwner,
            groupValue: _site,
            onChanged: (UserRole value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        SizedBox(height: 15,),
        ListTile(
          title: Text('Seller', style: GoogleFonts.varelaRound(fontSize: 20),),
          leading: Radio(
            value: UserRole.Seller,
            groupValue: _site,
            onChanged: (UserRole value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        SizedBox(height: 15,),
        ListTile(
          title: Text('General User', style: GoogleFonts.varelaRound(fontSize: 20),),
          leading: Radio(
            value: UserRole.generalUser,
            groupValue: _site,
            onChanged: (UserRole value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
      ],
    );
  }
}