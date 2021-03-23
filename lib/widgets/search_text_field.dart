import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SearchTextField(){
  return TextField(
    decoration: new InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(50),
          ),
        ),
        filled: true,
        hintStyle: GoogleFonts.quicksand(color: Colors.black, fontSize:15),
        hintText: "Search Anything",
        prefixIcon: Icon(Icons.search, size: 25,),
        fillColor: Colors.white),
  );
}