import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/postAdTextfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:io';

class postAdSeller extends StatefulWidget {
  @override
  _postAdSellerState createState() => _postAdSellerState();
}

class _postAdSellerState extends State<postAdSeller> with SingleTickerProviderStateMixin {
  int _state = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
          iconTheme: IconThemeData(color: Color(0xfffbb448)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),

        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Bike",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "Information",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          color: Color(0XFF012A4A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Title"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Make"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Modal"),
              ), Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Year"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Price"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Description"),
              ),
              SizedBox(height: 20,),
              Center(
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SellerInformation()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xfffbb448),
                          Color(0xfff7892b),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.quicksand(
                          fontSize: 21,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}

class SellerInformation extends StatefulWidget {
  @override
  _SellerInformationState createState() => _SellerInformationState();
}

class _SellerInformationState extends State<SellerInformation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
          iconTheme: IconThemeData(color: Color(0xfffbb448)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),

        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Seller",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "Information",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          color: Color(0XFF012A4A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Name"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Contact"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Location"),
              ), Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: postAdTextfield("Address"),
              ),
              SizedBox(height: 20,),
              Center(
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xfffbb448),
                          Color(0xfff7892b),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.quicksand(
                          fontSize: 21,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#012A4A",
          actionBarTitle: "Select Images",
          actionBarTitleColor: "#fbb448",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text(
            'BIKERSWORLD',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0XFF012A4A),
          iconTheme: IconThemeData(color: Color(0xfffbb448)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),

        ),
        body: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Select",
                      style: GoogleFonts.raleway(
                        fontSize: 25,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "Images",
                      style: GoogleFonts.raleway(
                        fontSize: 25,
                        color: Color(0XFF012A4A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: buildGridView(),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                loadAssets();
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xfffbb448),
                      Color(0xfff7892b),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Pick Images",
                    style: GoogleFonts.quicksand(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
