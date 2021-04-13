import 'dart:io';
import 'package:bikersworld/services/authenticate_service.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class AddProfilePicture extends StatefulWidget {
  @override
  _AddProfilePictureState createState() => _AddProfilePictureState();
}

class _AddProfilePictureState extends State<AddProfilePicture> {
  File _image;
  bool _isButtonVisible = true;

  Future getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BikersWorld"),
        elevation: 0,
        backgroundColor: Color(0XFF012A4A),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.orangeAccent,
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            Center(
              child: Text(
                "Select Profile Photo ",
                style: GoogleFonts.quicksand(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 200,
                height: 280,
                color: Colors.grey,
                child: Center(
                  child: _image == null
                      ? Text("No Image is picked")
                      : Container(width: 220,
                    child: Image.file(
                      _image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: Color(0XFF012A4A),
                        onPressed: getImagefromcamera,
                        tooltip: "pickImage",
                        child: Icon(Icons.add_a_photo),
                      ),
                      SizedBox(height: 15,),

                      Text(
                        "Select form Camera",
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: Color(0XFF012A4A),
                        onPressed: getImagefromGallery,
                        tooltip: "Pick Image",
                        child: Icon(Icons.camera_alt),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Select form Gallery",
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 30,
                  height: 60,
                  child: RaisedButton(
                    onPressed: _isButtonVisible ? () => {uploadImage(_image)} : null,
                    child: Text('Submit', style: GoogleFonts.quicksand(
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
    );
  }
//
 uploadImage(File image) async {

   final _storage = FirebaseStorage.instance;
   final _error = ToastErrorMessage();
   final _valid = ToastValidMessage();
   final _linkUrlWithAuth = AuthenticationService();
   String imageUploadComplete;

   try {
     setState(() {
       _isButtonVisible = false;
     });
     if (image != null) {
       var file = File(image.path);
       String imageName = path.basename(image.path);
       var snapshot = await _storage.ref()
           .child('userImages/$imageName')
           .putFile(file)
           .whenComplete(() =>
       imageUploadComplete = "image is uploaded to firebase storage")
           .catchError((onError) =>
       imageUploadComplete = onError.toString());

       if (imageUploadComplete == "image is uploaded to firebase storage") {
         var imageUrl = await snapshot.ref.getDownloadURL();
         bool result = await _linkUrlWithAuth.uploadProfileImage(imageUrl);
         if (result) {
           _valid.validToastMessage(
               validMessage: 'image Uploaded');
           Future.delayed(
               new Duration(seconds: 2),
                   () {
                 Navigator.pop(context);
               }
           );
         }
       } else {
         _error.errorToastMessage(errorMessage: imageUploadComplete);
       }
     }// check for update or upload
     else {
       _error.errorToastMessage(errorMessage: 'No Image was Selected');
     }
     // end of try block
   }catch(e){
     _error.errorToastMessage(errorMessage: e.toString());
   }finally{
     setState(() {
       _isButtonVisible = true;
     });
   }

 }

//
}