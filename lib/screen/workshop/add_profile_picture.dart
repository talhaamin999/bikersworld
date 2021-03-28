import 'dart:ffi';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class workshopProfilePhoto extends StatefulWidget {
  @override
  _workshopProfilePhotoState createState() => _workshopProfilePhotoState();
}

class _workshopProfilePhotoState extends State<workshopProfilePhoto> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 200,
              height: 280,
              color: Colors.grey,
              child: Center(
                child: _image == null
                    ? Text("No Image is picked")
                    : Container( width: 220,
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
          Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: FlatButton(
                onPressed: (){
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
    );
  }
}