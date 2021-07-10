import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdressFieldWidget extends StatefulWidget {

  final String title;
  final TextEditingController controller;
  final TextInputType inputType;
  final hintText;
  AdressFieldWidget({@required this.title,this.hintText,@required this.controller,@required this.inputType,});

  @override
  _AdressFieldWidgetState createState() => _AdressFieldWidgetState();
}

class _AdressFieldWidgetState extends State<AdressFieldWidget> {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              this.widget.title,
              style: GoogleFonts.quicksand(
                fontSize: 18,
              )
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: this.widget.controller,
            keyboardType: this.widget.inputType,
            validator: (value){
              if(value.isEmpty){
                return "${this.widget.title} is a Required Field";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: this.widget.hintText,
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              errorBorder: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
