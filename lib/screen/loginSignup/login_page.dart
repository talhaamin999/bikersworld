import 'package:bikersworld/services/authenticate_service.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/widgets/bezierContainer.dart';
import 'package:bikersworld/screen/loginSignup/signup.dart';
import 'package:bikersworld/screen/dashboard/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bikersworld/screen/loginSignup/forgot_password_page.dart';

class LoginPage extends StatefulWidget {

  static String id = "loginScreen";

  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthenticationService auth;
  ToastErrorMessage error = ToastErrorMessage();
  ToastValidMessage valid = ToastValidMessage();
  bool _isButtonVisible = true;


  @override
  dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void clear(){
    emailController.clear();
    passwordController.clear();
  }

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
              validator: (value){
                if(value.isEmpty){
                  return "$title is a Required Field";
                }
                return null;
              },
            ),
          ],
        ),
      );
  }


  Widget _passwordentryField(String title) {

   //bool _isObscure = true;

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
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
//                suffixIcon: IconButton(
//                    icon: Icon(
//                        _isObscure ? Icons.visibility : Icons.visibility_off),
//                    onPressed: () {
//                      setState(() {
//                        _isObscure = !_isObscure;
//                      });
//                    },
//                ),
            ),
            validator: (value){
              if(value.isEmpty){
                return "$title is a Required Field";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 60,
          child: RaisedButton(
            onPressed: _isButtonVisible ? () => {checkFormState()} : null,
            child:Text(
              'Login',
              style: GoogleFonts.krub(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            color: Color(0xfff7892b),
            disabledColor: Colors.grey.shade400,
            disabledTextColor: Colors.black,
          ),
        ),
      );
  }

  void checkFormState(){
    if(!_formKey.currentState.validate()){
      return null;
    }
    validateFields();
  }

  void validateFields(){

    if (emailController.text.trim().isEmpty ||  passwordController.text.trim().isEmpty){
      error.errorToastMessage(errorMessage: "Please Fill All The Fields");
    }// end of if for checking if fields are empty or not

    else{

      if(!EmailValidator.validate(emailController.text.trim())){
        error.errorToastMessage(errorMessage: "Enter Valid Email Address");
      }
      else if(passwordController.text.length < 6){
        error.errorToastMessage(errorMessage: "Password should have at least 6 characters");
      }else{
        setState(() {
          _isButtonVisible = false;
        });
        signInWithEmailAndPassword();
      }

    }//end of else of main if statement
  }//


  void signInWithEmailAndPassword() async{
    try {
      auth = AuthenticationService();
      String result = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );

      if (result == AuthenticationService.signedIn) {
        valid.validToastMessage(validMessage: "Signed In Successful");
        clear();
        await Future.delayed(
            new Duration(
              seconds: 1,
            ),
                () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeDashboard()),
              );
            }
        );
      }
      else {
        error.errorToastMessage(errorMessage: result);
      }

    }catch(e){
      error.errorToastMessage(errorMessage: e.toString());
    }finally{
      setState(() {
        _isButtonVisible = true;
      });
    }
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
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
  void facebookSignIn() async{
    try {
      auth = AuthenticationService();
      String result = await auth.signInWithFacebook();
      if(result == AuthenticationService.signedUp) {
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

        error.errorToastMessage(errorMessage: result);
      }
    }catch (e){
      error.errorToastMessage(errorMessage: e.toString());
    }
  }
  Widget _facebookButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: (){
          facebookSignIn();
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

  signInWithGoogle() async{
    try {
      auth = AuthenticationService();
      String result = await auth.signInWithGoogle();
      if(result == AuthenticationService.signedIn) {
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

        error.errorToastMessage(errorMessage: result);
      }
    }catch (e){
      error.errorToastMessage(errorMessage: e.toString());
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
          signInWithGoogle();
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



  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: GoogleFonts.quicksand(
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
          text: 'LOG',
          style: GoogleFonts.quicksand(
            fontSize: 30,
            color: Color(0xfff7892b),
          ),
          children: [
            TextSpan(
              text: 'IN',
              style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: _formKey,
     child: Column(
      children: <Widget>[
        _entryField("Email"),
        _passwordentryField("Password")
      ],
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
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                  FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                    },
                    child: TextButton(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassword())),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        margin: EdgeInsets.only(right: 20, top: 10),
                        alignment: Alignment.centerRight,
                         child: Text('Forgot Password ?',
                            style: GoogleFonts.quicksand(
                                fontSize: 18,),
                        ),
                      ),
                    ),
                  ),
                  _divider(),
                  _GoogleButton(),
                  SizedBox(height: 15,),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
