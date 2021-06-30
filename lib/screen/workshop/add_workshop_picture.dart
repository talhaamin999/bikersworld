import 'dart:io';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_native_image/flutter_native_image.dart';


class WorkshopProfilePhoto extends StatefulWidget {
  @override
  _WorkshopProfilePhotoState createState() => _WorkshopProfilePhotoState();
}

class _WorkshopProfilePhotoState extends State<WorkshopProfilePhoto> {
  File _image;
  bool _isButtonVisible = true;

  Future getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera,);
    setState(() {
      _image = image;
    });
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery,);
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
            color: Colors.orange,
            fontSize: 22,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            Center(
              child: Text(
                "Add  Profile Photo ",
                style: GoogleFonts.quicksand(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 200,
                height: 230,
               child:DottedBorder(
                 color: Color(0xffd4d4d4),//color of dotted/dash line
                 strokeWidth: 2, //thickness of dash/dots
                 dashPattern: [10,6],
                 //dash patterns, 10 is dash width, 6 is space width
                 child: Container(  //inner container
                     height:double.infinity, //height of inner container
                     width: double.infinity,
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
              ),
            ),
            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.only(left:15,right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: InkWell(
                      onTap: (){
                        getImagefromcamera();
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffa80b00),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5)),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                FontAwesomeIcons.camera,
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
                              child: Text('Get form Camera',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: InkWell(
                      onTap: (){
                        getImagefromGallery();
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
                                FontAwesomeIcons.images,
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
                              child: Text('Get form Gallery',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.only(left:25,right: 25,bottom: 25),
              child: Center(
                 child : Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 60,
                      child: RaisedButton(
                        onPressed: _isButtonVisible ? () => {uploadImage(_image)} : null,
                        child: Text('Submit',style: GoogleFonts.quicksand(
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

  uploadImage(File image) async {

    final _storage = FirebaseStorage.instance;
    final _error = ToastErrorMessage();
    final _valid = ToastValidMessage();
    final _upload = RegisterWorkshopQueries();
    String imageUploadComplete;

    try {
      setState(() {
        _isButtonVisible = false;
      });
      if (image != null) {
        print("FILE SIZE BEFORE: " + image.lengthSync().toString());
        File compressedFile = await FlutterNativeImage.compressImage(image.path,
            quality: 50,);
        print("FILE SIZE  AFTER: " + compressedFile.lengthSync().toString());
        String imageName = path.basename(compressedFile.path);
          var snapshot = await _storage.ref()
              .child('workshopImages/$imageName')
              .putFile(compressedFile)
              .whenComplete(() =>
          imageUploadComplete = "image is uploaded to firebase storage")
              .catchError((onError) =>
          imageUploadComplete = onError.toString());

          if (imageUploadComplete == "image is uploaded to firebase storage") {
            var imageUrl = await snapshot.ref.getDownloadURL();
            await _upload.uploadWorkshopImage(imageUrl);
            if (RegisterWorkshopQueries.imageResult == 'Image Uploaded') {
              _valid.validToastMessage(
                  validMessage: RegisterWorkshopQueries.imageResult);
              Future.delayed(
                  new Duration(seconds: 1),
                      () {
                    Navigator.pop(context);
                  }
              );
            } else {
              _error.errorToastMessage(
                  errorMessage: RegisterWorkshopQueries.imageResult);
            }
          } else {
            _error.errorToastMessage(errorMessage: imageUploadComplete);
          }
        }
        // check for update or upload
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

}


/*
* import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:compressimage/compressimage.dart';
import 'package:image_picker/image_picker.dart';

Future<Null> main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<File> _futureImage;
  File _imageFile;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
  }

  Future compressNow() async {
    _futureImage = ImagePicker.pickImage(source: ImageSource.gallery);
    _imageFile = await _futureImage;
    print("FILE SIZE BEFORE: " + _imageFile.lengthSync().toString());
    await CompressImage.compress(imageSrc: _imageFile.path, desiredQuality: 80); //desiredQuality ranges from 0 to 100
    print("FILE SIZE  AFTER: " + _imageFile.lengthSync().toString());

    setState(() {
      _imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Compress Image Example App'),
        ),
        body: new Center(
          child: _imageFile == null
              ? new Text('No image selected.')
              : new Image.file(_imageFile),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            compressNow();
          },
          tooltip: 'Pick Image',
          child: new Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}*/
