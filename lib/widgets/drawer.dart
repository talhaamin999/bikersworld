import 'package:bikersworld/screen/autoPartStore/auto_part_store_owner/auto_part_store_dashboard_owner.dart';
import 'package:bikersworld/screen/autoPartStore/auto_part_store_owner/register_auto_part_store.dart';
import 'package:bikersworld/screen/dashboard/searchPages/auto_partstore_search_page.dart';
import 'package:bikersworld/screen/workshop/workshop_dashboard.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/user_role_queries/add_user_role.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/workshop/register_workshop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/welcome_page.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:bikersworld/screen/dashboard/Ads/postAdsSeller.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autopart_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/ads_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/workshop_search_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/service_search_page.dart';
import 'package:bikersworld/screen/loginSignup/update_profile.dart';
import 'package:bikersworld/screen/dashboard/Ads/seller/sellerDashbaord.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

enum userOption{updateProfile,signOut,logInSignOut , partStore}

class _CustomDrawerState extends State<CustomDrawer> {

  String user;
  final _userRole = AddUserRoleQuerie();
  final _firebaseUser = FirebaseAuth.instance;

  @override
  void initState() {
    setUser();
    super.initState();
  }

  Future<void> navigateToOtherScreen(userOption option) async{
    if(option == userOption.updateProfile) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UpdateProfile()));
    }else if(option == userOption.signOut){
      await _firebaseUser.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeDashboard()));
    }else if(option == userOption.logInSignOut) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GettingStartedScreen()));
    }
  }
  void setUser() {
    if (_firebaseUser.currentUser != null && _firebaseUser.currentUser.emailVerified) {
      setState(() {
        user = _firebaseUser.currentUser.email.split('@')[0];
      });
    }
    else {
      setState(() {
        user = 'Bikers World';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebaseUser.currentUser != null && _firebaseUser.currentUser.emailVerified ? _userRole.getUserRole(_firebaseUser.currentUser.uid) : _userRole.getUserRole('abc'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          print("doc");
          if(snapshot.data != null){
            return Drawer(
              child: ListView(
                  children: <Widget>[
                    Container(
                      height: 185,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: Color(0XFF012A4A),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.orange,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundImage: _firebaseUser.currentUser !=
                                      null &&
                                      _firebaseUser.currentUser.photoURL != null
                                      ? NetworkImage(
                                      _firebaseUser.currentUser.photoURL)
                                      : AssetImage(
                                      "assets/user.png"),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      user != null ? user : '',
                                      style: GoogleFonts.quicksand(
                                        fontSize: 23,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    PopupMenuButton(
                                      icon: new Icon(FontAwesomeIcons.ellipsisV,
                                          color: Colors.white),
                                      onSelected: (option) {
                                        navigateToOtherScreen(option);
                                      },
                                      itemBuilder: (_) =>
                                      <PopupMenuItem<userOption>>[
                                        new PopupMenuItem<userOption>(
                                          child: Visibility(
                                            visible: _firebaseUser
                                                .currentUser != null
                                                ? true
                                                : false,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.edit,
                                                    size: 15,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Edit Profile",
                                                    style: GoogleFonts
                                                        .quicksand(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          value: userOption.updateProfile,
                                        ),
                                        new PopupMenuItem<userOption>(
                                          child: Visibility(
                                            visible: _firebaseUser
                                                .currentUser != null
                                                ? true
                                                : false,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.signOutAlt,
                                                    size: 15,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Sign Out",
                                                    style: GoogleFonts
                                                        .quicksand(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          value: userOption.signOut,
                                        ),
                                        new PopupMenuItem<userOption>(
                                          child: Visibility(
                                            visible: _firebaseUser
                                                .currentUser == null
                                                ? true
                                                : false,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.signInAlt,
                                                    size: 15,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Login / Sign Up",
                                                    style: GoogleFonts
                                                        .quicksand(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          value: userOption.logInSignOut,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home", style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomeDashboard()));
                      },
                    ),

                    Visibility(
                      visible: snapshot.data == 'workshop_owner' ? true : false,
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.registered),
                        title: Text("Register Workshop",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, color: Colors.black),),
                        trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => RegisterWorkshop()));
                        },
                      ),
                    ),
                    Visibility(
                      visible: snapshot.data == 'workshop_owner' ? true : false,
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.registered),
                        title: Text("Workshop Dashboard",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, color: Colors.black),),
                        trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => WorkshopDashboard()));
                        },
                      ),
                    ),

                    Visibility(
                      visible: snapshot.data == 'seller' ? true : false,
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.ad),
                        title: Text("Post An Ad", style: GoogleFonts.montserrat(
                            fontSize: 15, color: Colors.black),),
                        trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PostBikeInfo()));
                        },

                      ),
                    ),
                    Visibility(
                      visible: snapshot.data == 'seller' ? true : false,
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.ad),
                        title: Text("Your Adds", style: GoogleFonts.montserrat(
                            fontSize: 15, color: Colors.black),),
                        trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SellerHomeScreen()));
                        },

                      ),
                    ),
                    Visibility(
                      visible: snapshot.data == 'partstore_owner'
                          ? true
                          : false,
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.registered),
                        title: Text("Register Part Store",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, color: Colors.black),),
                        trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => RegisterAutoPartStore()));
                        },

                      ),
                    ),
                    Visibility(
                      visible: snapshot.data == 'partstore_owner'
                          ? true
                          : false,
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.registered),
                        title: Text("PartStore Dashboard",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, color: Colors.black),),
                        trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  AutoPartStoreDashboardOwner()));
                        },
                      ),
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
                          Text('Find More',
                            style: GoogleFonts.quicksand(fontSize: 15),),
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
                      title: Text(
                        "Find Workshop", style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => WorkshopSearchPage()));
                      },
                    ),

                    ListTile(
                      leading: Icon(FontAwesomeIcons.tools),
                      title: Text(
                        "Find Services", style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ServiceSearcPage()));
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.adversal),
                      title: Text("Find Ads", style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AdSearchPage()));
                      },

                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.cog),
                      title: Text(
                        "Find Auto Part", style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AutoPartSearchPage()));
                      },
                    ),

                    ListTile(
                      leading: Icon(FontAwesomeIcons.storeAlt),
                      title: Text("Find Auto Part Store",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AutoPartStoreSearchPage()));
                      },

                    ),
                  ]
              ),
            );
          }
        }
        else if(!snapshot.hasData){
          return Drawer(
            child: ListView(
                children: <Widget>[
                  Container(
                    height: 185,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0XFF012A4A),
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.orange,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                    "assets/user.png"),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    user != null ? user : '',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 23,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  PopupMenuButton(
                                    icon: new Icon(FontAwesomeIcons.ellipsisV,
                                        color: Colors.white),
                                    onSelected: (option) {
                                      navigateToOtherScreen(option);
                                    },
                                    itemBuilder: (_) =>
                                    <PopupMenuItem<userOption>>[
                                      new PopupMenuItem<userOption>(
                                        child: Visibility(
                                          visible: _firebaseUser
                                              .currentUser != null
                                              ? true
                                              : false,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.edit,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Edit Profile",
                                                  style: GoogleFonts
                                                      .quicksand(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        value: userOption.updateProfile,
                                      ),
                                      new PopupMenuItem<userOption>(
                                        child: Visibility(
                                          visible: _firebaseUser
                                              .currentUser != null
                                              ? true
                                              : false,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.signOutAlt,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Sign Out",
                                                  style: GoogleFonts
                                                      .quicksand(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        value: userOption.signOut,
                                      ),
                                      new PopupMenuItem<userOption>(
                                        child: Visibility(
                                          visible: _firebaseUser
                                              .currentUser == null
                                              ? true
                                              : false,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.signInAlt,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Login / Sign Up",
                                                  style: GoogleFonts
                                                      .quicksand(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        value: userOption.logInSignOut,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home", style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomeDashboard()));
                    },
                  ),

                  ListTile(
                    leading: Icon(FontAwesomeIcons.registered),
                    title: Text("Register Workshop",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => RegisterWorkshop()));
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.registered),
                    title: Text("Workshop Dashboard",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WorkshopDashboard()));
                    },
                  ),

                  ListTile(
                    leading: Icon(FontAwesomeIcons.ad),
                    title: Text("Post An Ad", style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PostBikeInfo()));
                    },

                  ),

                  ListTile(
                    leading: Icon(FontAwesomeIcons.registered),
                    title: Text("Register Part Store",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => RegisterAutoPartStore()));
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.registered),
                    title: Text("PartStore Dashboard",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              AutoPartStoreDashboardOwner()));
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
                        Text('Find More',
                          style: GoogleFonts.quicksand(fontSize: 15),),
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
                    title: Text(
                      "Find Workshop", style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WorkshopSearchPage()));
                    },
                  ),

                  ListTile(
                    leading: Icon(FontAwesomeIcons.tools),
                    title: Text(
                      "Find Services", style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ServiceSearcPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.cog),
                    title: Text(
                      "Find Auto Part", style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AutoPartSearchPage()));
                    },
                  ),

                  ListTile(
                    leading: Icon(FontAwesomeIcons.adversal),
                    title: Text("Find Ads", style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AdSearchPage()));
                    },

                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.storeAlt),
                    title: Text("Find Auto Part Store",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AutoPartStoreSearchPage()));
                    },

                  ),
                ]
            ),
          );
        }
        else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return CircularProgressIndicator();
      },
    );
  }
}