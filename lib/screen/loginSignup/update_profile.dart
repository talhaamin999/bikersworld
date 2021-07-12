import 'package:bikersworld/services/authenticate_service.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/add_profile_picture.dart';


class UpdateProfile extends StatefulWidget {


  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}



class _UpdateProfileState extends State<UpdateProfile> {

  bool isVisible = false,
      _isButtonVisible = true;
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _firebaseUser = AuthenticationService();
  final _error = ToastErrorMessage();
  final _valid = ToastValidMessage();

  Future<void> updatePassword() async {
    if (newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      if (newPasswordController.text == confirmPasswordController.text) {
        bool result = await _firebaseUser.updatePassword(
            confirmPasswordController.text.trim());
        if (result) {
          clear();
          _valid.validToastMessage(
              validMessage: 'Password Successfully Changed');
        }
      } else {
        _error.errorToastMessage(
            errorMessage: "You'r New and Confirm Password Don't match");
      }
    } else {
      _error.errorToastMessage(errorMessage: 'Please Fill All The Fields');
    }
  }

  void clear() {
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print('${_firebaseUser.getUserImageUrl()}');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery.of(context).size.width * .5,
                    child: BezierContainer()
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'EDIT',
                            style: GoogleFonts.quicksand(
                              fontSize: 27,
                              color: Color(0xfff7892b),
                            ),
                            children: [
                              TextSpan(
                                text: ' PROFILE',
                                style: GoogleFonts.quicksand(
                                  fontSize: 27,
                                  color: Colors.black,
                                ),
                              ),
                            ]
                            ,),
                        ),

                       SizedBox(height: 20,),
                       Container(
                         child: Column(
                           children: [
                             Container(
                               height: 150,
                               width: 150,
                               child: Stack(
                                 children: <Widget>[
                                   FlatButton(
                                     padding:EdgeInsets.zero,
                                     onPressed:(){
                                       showModalBottomSheet(
                                           context: context,
                                           builder: (context) {
                                             return Container(
                                               height: 200,
                                               child: Column(
                                                 children: <Widget>[
                                                   SizedBox(height: 10,),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 20,right: 30),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Select Profile Picture",
                                                          style: GoogleFonts.quicksand(
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 20,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                   SizedBox(height: 5,),
                                                   ListTile(
                                                     leading: new Icon(Icons.photo),
                                                     title: new Text('Add profile Picture',style: GoogleFonts.montserrat(fontSize: 15),),
                                                     onTap: () {
                                                       Navigator.push(context, MaterialPageRoute(builder: (context) => AddProfilePicture()));
                                                     },
                                                   ),
                                                   SizedBox(height: 20,),
                                                 ],
                                               ),
                                             );
                                           });
                                     },
                                     child: CircleAvatar(
                                       child: CircleAvatar(
                                         radius:70,
                                         backgroundImage: _firebaseUser.getUserImageUrl() != null ?  NetworkImage(_firebaseUser.getUserImageUrl()) : AssetImage('assets/user.png'),
                                         backgroundColor: Colors.white,
                                       ),
                                       radius: 90,
                                       backgroundColor: Colors.orange,
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                             SizedBox(height: 15,),
                             Text(
                               _firebaseUser.getUserEmail() != null ? _firebaseUser.getUserEmail():'',
                               style: GoogleFonts.varelaRound(
                                 fontSize: 20,
                               ),
                             ),
                           ],
                         ),
                       ),

                        SizedBox(height: 20,),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatButton(
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Color(0xffdbdbdb),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:20,right: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.edit,
                                          size: 18,
                                        ),
                                        SizedBox(width: 15,),
                                        Text(
                                          "Update Password",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onPressed: (){
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                              ),
                              Visibility(
                                visible: isVisible,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          "New Password",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 18,
                                          )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        controller: newPasswordController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Color(0xffe3e3e3),
                                          filled: true,
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                          "Confirm Password",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 18,
                                          )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        controller: confirmPasswordController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Color(0xffe3e3e3),
                                          filled: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20,),
                        Visibility(
                          visible: isVisible,
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 30,
                              height: 60,
                              child: RaisedButton(
                                onPressed: _isButtonVisible ? () => {updatePassword()} : null,
                                child: Text('Change Password',style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                                ),
                                color: Color(0xfff7892b),
                                disabledColor: Colors.grey.shade400,
                                disabledTextColor: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black,
                            ),
                          ),
                          Text('Back',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




//
//    var themeSwitcher = ThemeSwitcher(
//      builder: (context) {
//        return AnimatedCrossFade(
//          duration: Duration(milliseconds: 200),
//          crossFadeState:
//          ThemeProvider.of(context).brightness == Brightness.dark
//              ? CrossFadeState.showFirst
//              : CrossFadeState.showSecond,
//          firstChild: GestureDetector(
//            onTap: () =>
//                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
//            child: Icon(
//              LineAwesomeIcons.sun,
//              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//            ),
//          ),
//          secondChild: GestureDetector(
//            onTap: () =>
//                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
//            child: Icon(
//              LineAwesomeIcons.moon,
//              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//            ),
//          ),
//        );
//      },
//    );
//
//    var header = Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        SizedBox(width: kSpacingUnit.w * 3),
//        Icon(
//          LineAwesomeIcons.arrow_left,
//          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//        ),
//        profileInfo,
//        themeSwitcher,
//        SizedBox(width: kSpacingUnit.w * 3),
//      ],
//    );
//
//    return ThemeSwitchingArea(
//      child: Builder(
//        builder: (context) {
//          return Column(
//              children: <Widget>[
//                SizedBox(height: kSpacingUnit.w * 5),
//                header,
//                Expanded(
//                  child: ListView(
//                    children: <Widget>[
//                      ProfileListItem(
//                        icon: LineAwesomeIcons.user_shield,
//                        text: 'Privacy',
//                      ),
//                      ProfileListItem(
//                        icon: LineAwesomeIcons.history,
//                        text: 'Purchase History',
//                      ),
//                      ProfileListItem(
//                        icon: LineAwesomeIcons.question_circle,
//                        text: 'Help & Support',
//                      ),
//                      ProfileListItem(
//                        icon: LineAwesomeIcons.cog,
//                        text: 'Settings',
//                      ),
//                      ProfileListItem(
//                        icon: LineAwesomeIcons.user_plus,
//                        text: 'Invite a Friend',
//                      ),
//                      ProfileListItem(
//                        icon: LineAwesomeIcons.alternate_sign_out,
//                        text: 'Logout',
//                        hasNavigation: false,
//                      ),
//                    ],
//                  ),
//                )
//              ],
//          );
//        },
//      ),
//    );
//  }
//}
//
//
//class ProfileListItem extends StatelessWidget {
//  final IconData icon;
//  final String text;
//  final bool hasNavigation;
//
//  const ProfileListItem({
//    Key key,
//    this.icon,
//    this.text,
//    this.hasNavigation = true,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: kSpacingUnit.w * 5.5,
//      margin: EdgeInsets.symmetric(
//        horizontal: kSpacingUnit.w * 4,
//      ).copyWith(
//        bottom: kSpacingUnit.w * 2,
//      ),
//      padding: EdgeInsets.symmetric(
//        horizontal: kSpacingUnit.w * 2,
//      ),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
//        color: Theme.of(context).backgroundColor,
//      ),
//      child: Row(
//        children: <Widget>[
//          Icon(
//            this.icon,
//            size: kSpacingUnit.w * 2.5,
//          ),
//          SizedBox(width: kSpacingUnit.w * 1.5),
//          Text(
//            this.text,
//            style: kTitleTextStyle.copyWith(
//              fontWeight: FontWeight.w500,
//            ),
//          ),
//          Spacer(),
//          if (this.hasNavigation)
//            Icon(
//              LineAwesomeIcons.angle_right,
//              size: kSpacingUnit.w * 2.5,
//            ),
//        ],
//      ),
//    );
//  }
//}
//
//
const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kLightSecondaryColor,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: 'SFProText',
    bodyColor: kLightSecondaryColor,
    displayColor: kLightSecondaryColor,
  ),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
    color: kDarkSecondaryColor,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'SFProText',
    bodyColor: kDarkSecondaryColor,
    displayColor: kDarkSecondaryColor,
  ),
);

/*
*                                     PopupMenuButton(
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
                                      ],
                                    ),
*/


/*
* showDialog(
                                     context: context,
                                     builder: (BuildContext context)
                                     {
                                       return AlertDialog(
                                         content: Container(
                                           height: 180,
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             children: <Widget>[
                                               Padding(
                                                 padding: const EdgeInsets.only(top:15),
                                                 child: Text(
                                                   "Select Option",
                                                   style: GoogleFonts.quicksand(
                                                     fontSize: 20,
                                                     color: Colors.black,
                                                     fontWeight: FontWeight.bold,
                                                   ),
                                                 ),
                                               ),
                                               SizedBox(height: 20,),
                                               FlatButton(
                                                 child: Container(
                                                   child: Row(
                                                     children: [
                                                       CircleAvatar(
                                                         child: Icon(
                                                           FontAwesomeIcons.image,
                                                           color: Color(0XFF012A4A),
                                                         ),
                                                         backgroundColor: Color(0xffd6d6d6),
                                                       ),
                                                       SizedBox(width:20),
                                                       Text(
                                                         "Upload Photo",
                                                         style: GoogleFonts.quicksand(
                                                           fontSize: 18,
                                                           color: Colors.black,
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                 ),
                                                 onPressed: (){
                                                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddProfilePicture()));
                                                 },
                                               ),
                                               SizedBox(height: 20,),
                                               Center(
                                                 child: Container(
                                                   decoration: BoxDecoration(
                                                     color: Colors.red,
                                                     borderRadius: BorderRadius.circular(10),
                                                   ),
                                                   child: FlatButton(
                                                     onPressed: (){
                                                       Navigator.pop(context);
                                                     },
                                                     child: Text(
                                                       "Cancel",
                                                       style: GoogleFonts.quicksand(
                                                         fontSize:18,
                                                         color: Colors.white,
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                       );
                                     }
                                 );*/