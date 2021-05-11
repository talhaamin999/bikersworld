import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/onboarding/onboarding.dart';
import 'package:bikersworld/screen/loginSignup/welcome_page.dart';
import 'package:bikersworld/screen/dashboard/searchPages/autopart_search_page.dart';
Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      //home: LoadingScreen(),
      //home: GettingStartedScreen(),
      home: AutoPartSearchPage(),
    );
  }
}
