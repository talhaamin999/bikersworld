import 'package:flutter/material.dart';


class postAdTextfield extends StatelessWidget {
  postAdTextfield(this.Text,);

  String Text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width - 90,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffe6e6e6),
          border: InputBorder.none,
          labelText: Text,
        ),
      ),
    );
  }
}
