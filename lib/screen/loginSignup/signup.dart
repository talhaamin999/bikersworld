import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/bezierContainer.dart';
import 'package:bikersworld/screen/loginSignup/loginPage.dart';
import 'package:bikersworld/screen/loginSignup/genericOptionScreen.dart';


class SignUpPage extends StatefulWidget {

  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ToastErrorMessage error;
  ToastValidMessage valid;
  AuthenticationService auth;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
              ),
          )
        ],
      ),
    );
  }


  Widget _passwordentryField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              keyboardType: TextInputType.text,
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

//  void validatepass(){
//    if (value.trim().isEmpty) {
//      print ("This field is required");
//    }
//    if (value.trim().length < 6) {
//      print ("Password must contain at least 6 characters ");
//    }
//  }

  void validateFields(){

    if (emailController.text.trim().isEmpty ||  passwordController.text.trim().isEmpty){

      error = ToastErrorMessage(errorMessage: "Please Fill All The Fields" );
      error.errorToastMessage();
    }// end of if for checking if fields are empty or not

    else{

      if(!EmailValidator.validate(emailController.text.trim())){

        error = ToastErrorMessage(errorMessage: "Enter Valid Email Address");
        error.errorToastMessage();

      }
      else if(passwordController.text.length < 6){

        error = ToastErrorMessage(errorMessage: "Password should have at least 6 characters");
        error.errorToastMessage();

      }else{

        signUpWithEmailAndPassword();
      }

    }//end of else of main if statement
  }// end of function

  void signUpWithEmailAndPassword() async{

    auth = AuthenticationService();
    String result = await auth.signUpWithEmailAndPasword(
      email: emailController.text.trim(),
      password: passwordController.text.trim()
    );

    if(result == AuthenticationService.signedUp){

      valid = ToastValidMessage(validMessage: "Signed Up Successful");
      valid.validToastMessage();

      await Future.delayed(
          new Duration(
            seconds: 1,
          ),
              (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => GenericOptionScreen()),
            );
          }
      );

    }
    else{
      error = ToastErrorMessage(errorMessage: result);
      error.errorToastMessage();
    }
  }

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
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          'Register Now',
          style: GoogleFonts.krub(fontSize: 20, color: Colors.white),
        ),
      ),
      onPressed: (){

        validateFields();
       // Navigator.push(context, MaterialPageRoute(builder: (context) => genericOptionScreen()));
      },
    );
  }


  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'REGIST',
          style: GoogleFonts.quicksand(
            fontSize:28,
            color: Color(0xfff7892b),
          ),
          children: [
            TextSpan(
              text: 'ERATION',
              style: GoogleFonts.quicksand(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
        children: <Widget>[
          _entryField("Email"),
          _passwordentryField("Password"),
        ],
      );
  }


  Widget _divider() {
    return Container(
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
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),

        ],
      ),
    );
  }

  void facebookSignUp() async{

    try {
      auth = AuthenticationService();
      String result = await auth.signInWithFacebook();
      if(result == AuthenticationService.signedUp) {
        valid = ToastValidMessage(validMessage: result);
        valid.validToastMessage();
        await Future.delayed(
            new Duration(
              seconds: 2,
            ),
                (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeDashboard()),
              );
            }
        );
      }
      else{

        error = ToastErrorMessage(errorMessage: result);
        error.errorToastMessage();
      }
    }catch (e){
      error = ToastErrorMessage(errorMessage: e.toString());
      error.errorToastMessage();
    }
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: () {
           facebookSignUp();
         },
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1959a9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2872ba),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in with Facebook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  signUpWithGoogle() async{
    try {
      auth = AuthenticationService();
      String result = await auth.signInWithGoogle();
      if(result == AuthenticationService.signedIn) {
        valid = ToastValidMessage(validMessage: result);
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
      else{

        error = ToastErrorMessage(errorMessage: result);
        error.errorToastMessage();
      }
    }catch (e){
      error = ToastErrorMessage(errorMessage: e.toString());
      error.errorToastMessage();
    }
  }
  Widget _GoogleButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: (){
          signUpWithGoogle();
          },
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffa80b00),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFFc7473e),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in with Google',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
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
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
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
                    SizedBox(
                      height: 20,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    _divider(),

                    _facebookButton(),
                    SizedBox(height: 15,),
                    _GoogleButton(),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
