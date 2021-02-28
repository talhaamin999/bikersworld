import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/dashboard/Autopart/partDetail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class partGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildCard('Disc Brake', 'Rs. 1500', 'assets/p1.jpeg', 'Mechanical' , 'Local' , 'In Stock' ,false, false, context),
          _buildCard('Hydrulics', 'Rs. 2500', 'assets/part2.jpeg','Mechanical' ,'Geniune' , 'Out of Stock' ,true, false, context),
          _buildCard('Tire', 'Rs. 300', 'assets/part3.jpeg', 'Mechanical' ,'Geniune' , 'Out of Stock',false,true, context),
          _buildCard('Bike handle', 'Rs. 400', 'assets/part4.jpeg', 'Mechanical' , 'Local' , 'In Stock',false, false, context,),

        ],
      ),
    );
  }
}


Widget _buildCard(String name, String price, String imgPath,String category , String type , String status ,bool added,
    bool isFavorite, context) {
  return Padding(
    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => partDetail(
                assetPath: imgPath,
                partprice:price,
                partname: name,
                partCateogry: category,
                partStauts: status,
                partType: type,
            ),
            ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white
        ),
        child: Column(children: [
          Hero(
            tag: imgPath,
            child: Container(
              height: 115.0,
              width: 145.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(price,
            style: TextStyle(
                color: Color(0xfff7892b),
                fontSize: 17),
          ),
          SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 20,),
                  Container(
                    child: Text(name,
                      style: TextStyle(
                        color: Color(0xFF575E67),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5),

                    ),
                    child: Center(
                      child: Text(
                        "Check",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        ),
      ),
    ),
  );
}
