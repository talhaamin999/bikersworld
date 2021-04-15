import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryField extends StatefulWidget {
  @override
  _EntryFieldState createState() => _EntryFieldState();
  final String title;
  final TextEditingController controller;
  final TextInputType inputType;
  final FilteringTextInputFormatter filter;
  final hintText;
  EntryField({@required this.title,this.hintText,@required this.controller,@required this.inputType,this.filter});
}

class _EntryFieldState extends State<EntryField> {

  @override
  void dispose() {
    print("love");
    super.dispose();
  }

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
            inputFormatters: <TextInputFormatter>[
              this.widget.filter != null ? this.widget.filter : null,
            ],
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
