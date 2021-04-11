import 'package:bikersworld/screen/dashboard/searchPages/auto_partstore_search_page.dart';
import 'package:bikersworld/screen/workshop/workshop_dashboard.dart';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/workshop/register_workshop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/welcomePage.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:bikersworld/screen/dashboard/Ads/postAdsSeller.dart';
import 'package:bikersworld/screen/autoPartStore/registerAutoPartStore.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autopart_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/ads_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/workshop_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/service_search_page.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';



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
      child: new  ListView(
        children: <Widget>[
          Container(
            height:200,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/user.png"),
                    ),
                    radius: 53,
                    backgroundColor: Colors.orange,
                  ),

                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user,
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext bc){
                                  return SingleChildScrollView(
                                    child: Container(
                                      child: new Wrap(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(top:15, left:15),
                                            child: Text(
                                              "Select Option",
                                              style: GoogleFonts.quicksand(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
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
                                              leading: Icon(FontAwesomeIcons.outdent),
                                              title: Text("Sign Out",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
                                              trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                                              onTap: () async {
                                                AuthenticationService auth = AuthenticationService();
                                                await auth.signOut();
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDashboard())
                                                );
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
                                          SizedBox(height: 20,),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Icon(
                            FontAwesomeIcons.chevronDown,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
               color: Color(0XFF012A4A),
              ),
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
            title: Text("Login" ,style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) =>WorkshopSearchPage()));
            },
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.tools),
            title: Text("Find Services",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceSearcPage()));
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




