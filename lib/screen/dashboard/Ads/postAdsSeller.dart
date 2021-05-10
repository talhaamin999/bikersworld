import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';
import 'package:bikersworld/screen/dashboard/Ads/seller/sellerDashbaord.dart';
import 'package:bikersworld/widgets/postAdTextfield.dart';

class postAdSeller extends StatefulWidget {
  @override
  _postAdSellerState createState() => _postAdSellerState();
}

class _postAdSellerState extends State<postAdSeller> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar:AppBar(
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
                  child: Text(
                    "Post An Ad",
                    style: GoogleFonts.raleway(
                      fontSize: 25,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.motorcycle),
                    postAdTextfield("Title"),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.building),
                    postAdTextfield("Make"),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.table),
                    postAdTextfield("Modal"),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.mapMarkerAlt),
                    postAdTextfield("Location"),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.city),
                    postAdTextfield("Specific Area"),
                  ],
                ),
              ),


              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.speed_sharp),
                    postAdTextfield("Milage"),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.tags),
                    postAdTextfield("Set Price"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.alignJustify),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width - 90,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffe6e6e6),
                          border: InputBorder.none,
                          labelText: 'Description',
                        ),
                      ),
                    ),
                  ],
                ),
              ),



              SizedBox(height: 40,),

              Container(
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
                    Text('Seller Information' ,style: GoogleFonts.quicksand(fontSize: 15),),
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
              ),

              SizedBox(height: 20,),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.user),
                    postAdTextfield("Name"),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.phone),
                    postAdTextfield("Contact"),
                  ],
                ),
              ),

              SizedBox(height: 40,),
              Container(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
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
                      'Post Ad',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
        //drawer: Drawer(),
      ),
    );
  }
}
