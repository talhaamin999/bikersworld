import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/widgets/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/loginSignup/add_profile_picture.dart';


class EditProfile extends StatefulWidget {


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  bool isVisible = true;

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
                             FlatButton(
                               child: Container(
                                 height: 150,
                                 width: 150,
                                // margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
                                 child: Stack(
                                   children: <Widget>[
                                     CircleAvatar(
                                       child: CircleAvatar(
                                         radius:70,
                                         backgroundImage: AssetImage('assets/user.png'),
                                         backgroundColor: Colors.white,
                                       ),
                                       radius: 90,
                                       backgroundColor: Colors.orange,
                                     ),
                                     Align(
                                       alignment: Alignment.bottomRight,
                                       child: Container(
                                         height: 40,
                                         width: 40,
                                         decoration: BoxDecoration(
                                           color: Colors.orange,
                                           shape: BoxShape.circle,
                                         ),
                                         child: Center(
                                           heightFactor: 40,
                                           widthFactor: 40,
                                           child: Icon(
                                             FontAwesomeIcons.camera,
                                             color: Colors.white,
                                             size: 20
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               onPressed: (){
                                 showModalBottomSheet<void>(
                                   context: context,
                                   builder: (BuildContext context) {
                                     return Container(
                                       height: 200,
                                       color: Color(0xffe8e8e8),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                           Padding(
                                             padding: const EdgeInsets.only(left: 15, top:15),
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
                                             child: Padding(
                                               padding: const EdgeInsets.only(left:15),
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
                                             ),
                                             onPressed: (){
                                               Navigator.push(context, MaterialPageRoute(builder: (context) => AddProfilePicture()));
                                             },
                                           ),
                                         ],
                                       ),
                                     );
                                   },
                                 );
                               },
                             ),
                             SizedBox(height: 15,),
                             Text(
                               'Ibtasam Ur Rehman',
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
                                          "Password",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 18,
                                          )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Color(0xffe3e3e3),
                                          filled: true,
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                          "Update Password",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 18,
                                          )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
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
                        FlatButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
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