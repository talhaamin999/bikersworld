import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class postAdTextfield extends StatelessWidget {

  final String title;
  final TextEditingController controller;
  final TextInputType inputType;

  postAdTextfield(this.title,{@required this.controller,@required this.inputType});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              title,
              style: GoogleFonts.quicksand(
                fontSize: 18,
              )
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            keyboardType: inputType,
            validator: (value){
              if(value.isEmpty){
                return "$title is a Required Field";
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xffe3e3e3),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
