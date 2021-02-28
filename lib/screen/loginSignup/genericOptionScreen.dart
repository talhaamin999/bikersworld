import 'dart:async';

import 'package:bikersworld/screen/dashboard/Ads/postAdsSeller.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/user_role_queries/add_user_role.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/loginSignup/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/signup.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:bikersworld/screen/dashboard/Ads/seller/sellerDashbaord.dart';
import 'package:bikersworld/screen/dashboard/searchPages/workshopSearchPage.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autoPartSearchPage.dart';


class GenericOptionScreen extends StatefulWidget {

  @override
  _GenericOptionScreenState createState() => _GenericOptionScreenState();
}

class _GenericOptionScreenState extends State<GenericOptionScreen> {

  static final String _WORKSHOP_OWNER = "workshop owner";
  static final String _PARTSTORE_OWNER = "partstore owner";
  static final String _SELLER = "seller";
  static final String _GENERAL = "general";

  Future<void> addRole(String role) async{
   final AddUserRoleQuerie _user = AddUserRoleQuerie();
   final bool _result = await _user.addUserRole(role);
   if(_result){
     ToastValidMessage valid = ToastValidMessage(validMessage: "Success");
     valid.validToastMessage();
     await Future.delayed(
         new Duration(
           seconds: 1,
         ),
             (){
           Navigator.of(context).push(
             MaterialPageRoute(builder: (context) => HomeDashboard()),
           );
         }
     );
   }
   return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:SingleChildScrollView(
          child:Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _title(),
                SizedBox(
                  height: 40,
                ),
               Container(
                 child:Text(
                   "Select Option",
                   style: GoogleFonts.quicksand(
                     fontSize: 25,
                   ),
                 ),
               ),
                SizedBox(height: 30,),
                FlatButton(
                  onPressed: () async{
                   await addRole(_PARTSTORE_OWNER);
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0,20.0),
                            blurRadius: 30.0,
                            color: Colors.black12,
                          ),
                        ]
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.white)],
                              color: Color(0xff21255c),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22),
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(200),
                              )
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 8, left: 15),
                            child: Text(
                              'Part Store',
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.store,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30,),
                FlatButton(
                  onPressed: () async{
                       await addRole(_WORKSHOP_OWNER);
                    },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0,20.0),
                            blurRadius: 30.0,
                            color: Colors.black12,
                          ),
                        ]
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.white)],
                              color: Color(0xff21255c),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22),
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(200),
                              )
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 8, left: 15),
                            child: Text(
                              'Workshop Owner',
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.supervised_user_circle,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                FlatButton(
                  onPressed: () async{
                    await addRole(_SELLER);
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0,20.0),
                            blurRadius: 30.0,
                            color: Colors.white,
                          ),
                        ]
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.white)],
                              color: Color(0xff21255c),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22),
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(200),
                              )
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 8, left: 15),
                            child: Text(
                              'Seller',
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.home,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 80,),
            InkWell(
              onTap: (){
               Navigator.pop(context);
                },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
                SizedBox(height: 30,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget _title() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'BIKERS',
        style: GoogleFonts.quicksand(
          fontSize: 35,
          color: Color(0xfff7892b),
        ),
        children: [
          TextSpan(
              text: 'WORLD',
              style: GoogleFonts.quicksand(
                color: Color(0xffdf8e33).withAlpha(100),
                fontSize: 35,
              )
          ),

        ]
    ),
  );
}
