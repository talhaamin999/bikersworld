import 'dart:ffi';
import 'dart:io';
import 'package:bikersworld/screen/workshop/workshop_dashboard.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/workshop_queries/service_queries.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class WorkshopProfilePhoto extends StatefulWidget {
  @override
  _WorkshopProfilePhotoState createState() => _WorkshopProfilePhotoState();
}

class _WorkshopProfilePhotoState extends State<WorkshopProfilePhoto> {
  File _image;

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
            SizedBox(height:30),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: FlatButton(
                  onPressed: () {
                    uploadImage(_image);
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xfffbb448),
                          Color(0xffed740c),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.raleway(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
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

  uploadImage(File image) async {

    final _storage = FirebaseStorage.instance;
    final _error = ToastErrorMessage();
    final _valid = ToastValidMessage();
    final _upload = RegisterWorkshopQueries();
    String imageUploadComplete;

    try {
      if (image != null) {
        var file = File(image.path);
        String imageName = path.basename(image.path);
        var snapshot = await _storage.ref()
            .child('workshopImages/$imageName')
            .putFile(file)
            .whenComplete(() => imageUploadComplete = "image is uploaded to firebase storage")
            .catchError((onError) => imageUploadComplete = onError.toString());

          if(imageUploadComplete == "image is uploaded to firebase storage") {
            var imageUrl = await snapshot.ref.getDownloadURL();
            await _upload.uploadWorkshopImage(imageUrl);
            if (RegisterWorkshopQueries.imageResult == 'Image Uploaded') {
              _valid.validToastMessage(
                  validMessage: RegisterWorkshopQueries.imageResult);
              Future.delayed(
                  new Duration(seconds: 2),
                      () {
                    Navigator.pop(context);
                  }
              );
            } else {
              _error.errorToastMessage(
                  errorMessage: RegisterWorkshopQueries.imageResult);
            }
          }else{
            _error.errorToastMessage(errorMessage: imageUploadComplete);
          }
       } else {
        _error.errorToastMessage(errorMessage: 'No Image was Selected');
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }

  }

}