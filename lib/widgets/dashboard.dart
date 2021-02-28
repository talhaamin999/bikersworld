import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/drawer.dart';


class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  int currentIndex;

  TextEditingController _textFieldController = new TextEditingController();
  @override
  void initState() {
    super.initState();

    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
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
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide.none,
                        ),
                        hintText: "Search Anything",
                        fillColor: Color(0xffe6e6e6),
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: drawer(),


//          floatingActionButton: FloatingActionButton(
//            onPressed: () {
//
//            },
//            child: Icon(Icons.add),
//            backgroundColor: Color(0xfff7892b),
//          ),
//          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//          bottomNavigationBar: BubbleBottomBar(
//            opacity: 0.2,
//            backgroundColor: Colors.white,
//            borderRadius: BorderRadius.vertical(
//              top: Radius.circular(16.0),
//            ),
//            currentIndex: currentIndex,
//            hasInk: true,
//            inkColor: Colors.black12,
//            hasNotch: true,
//            fabLocation: BubbleBottomBarFabLocation.end,
//            onTap: changePage,
//            items: [
//              BubbleBottomBarItem(
//                backgroundColor: Colors.red,
//                icon: Icon(
//                  Icons.dashboard,
//                  color: Colors.black,
//                ),
//                activeIcon: Icon(
//                  Icons.directions_car,
//                  color: Colors.red,
//                ),
//                title: Text('Car'),
//              ),
//              BubbleBottomBarItem(
//                backgroundColor: Colors.indigo,
//                icon: Icon(
//                  Icons.directions_bike,
//                  color: Colors.black,
//                ),
//                activeIcon: Icon(
//                  Icons.folder_open,
//                  color: Colors.indigo,
//                ),
//                title: Text('Folders'),
//              ),
//              BubbleBottomBarItem(
//                backgroundColor: Colors.deepPurple,
//                icon: Icon(
//                  Icons.access_time,
//                  color: Colors.black,
//                ),
//                activeIcon: Icon(
//                  Icons.access_time,
//                  color: Colors.deepPurple,
//                ),
//                title: Text('Log'),
//              ),
//            ],
//          ),
        ),
      );
  }
}

