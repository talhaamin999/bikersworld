import 'package:bikersworld/screen/dashboard/Ads/seller/sellerDashbaord.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autoPartStoreSearchPage.dart';
import 'package:bikersworld/screen/workshop/workshopDashboard.dart';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/workshop/registerWorkshop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/welcomePage.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:bikersworld/screen/dashboard/Ads/postAdsSeller.dart';
import 'package:bikersworld/screen/workshop/registerWorkshop.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'dashboard.dart';
import 'package:bikersworld/screen/autoPartStore/registerAutoPartStore.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autoPartSearchPage.dart';
import 'package:bikersworld/screen/dashboard/searchPages/adsSearchPage.dart';
import 'package:bikersworld/screen/dashboard/searchPages/workshopSearchPage.dart';



class drawer extends StatefulWidget {
  const drawer({
    Key key,
  }) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {

  String user;

  @override
  Widget build(BuildContext context) {

    if(FirebaseAuth.instance.currentUser != null){
      setState(() {
        user = FirebaseAuth.instance.currentUser.email.split('@')[0];
      });
    }
    else{
      setState(() {
        user = 'Bikers World';
      });
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30,),
                Text(
                  user,
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
                    color: Color(0xffffa354),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Dashboard",
                  style: GoogleFonts.quicksand(
                    fontSize: 26,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home" ,style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDashboard()));
            },
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.signInAlt),
            title: Text("Login | Signup",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
            },
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.outdent),
            title: Text("Sign Out",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: () async {
              AuthenticationService auth = AuthenticationService();
              await auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDashboard()));
            }
          ),


          ListTile(
            leading: Icon(FontAwesomeIcons.registered),
            title: Text("Register Workshop",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterWorkshop()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.registered),
            title: Text("Workshop Dashboard",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopDashboard()));
            },
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.ad),
            title: Text("Post An Ad",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => postAdSeller()));

            },

          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.registered),
            title: Text("Register Part Store",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAutoPartStore()));

            },

          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ),
                Text('Find More' ,style: GoogleFonts.quicksand(fontSize: 15),),
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

          ListTile(
            leading: Icon(FontAwesomeIcons.building),
            title: Text("Find Workshop" , style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>workshopSearchPage()));
            },
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.cog),
            title: Text("Find Auto Part",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartSearchPage()));
            },
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.adversal),
            title: Text("Find Ads",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => adSearchPage()));

            },

          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.storeAlt),
            title: Text("Find Auto Part Store",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => autoPartStoreSearchPage()));

            },

          ),
        ],
      ),
    );
  }
}

