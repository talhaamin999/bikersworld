import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/city_dropdown.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/auto_part_store_dashboard_owner.dart';


bool monday=false,tuesday=false,wednesday=false,thursday=false,friday=false,saturday=false,sunday=false;


class RegisterAutoPartStore extends StatefulWidget {
  @override
  _RegisterAutoPartStoreState createState() => _RegisterAutoPartStoreState();
}

class _RegisterAutoPartStoreState extends State<RegisterAutoPartStore> {
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
    final height = MediaQuery.of(context).size.height;

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
            leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.orange,),
              onPressed:() => Navigator.pop(context),
            )
        ),
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      _title(),
                      SizedBox(height: 20),
                      _registerWorkshopWidget(),
                      SizedBox(height: 20),

                      FlatButton(
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
                                  colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                          child: Text(
                            'Submit',
                            style: GoogleFonts.krub(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                                builder: (context) => AutoPartStoreDashboardOwner()
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 30),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //drawer: Drawer(),
      ),
    );
  }
}

Widget _entryField(String title, {bool isPassword = false})
{
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
        TextField(
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

Widget _registerWorkshopWidget() {
  return Column(
    children: <Widget>[
      _entryField("Store Name"),

      SizedBox(height: 5,),
      Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          "City",
          style: GoogleFonts.quicksand(
            fontSize:18,
          ),
        ),
      ),

      SizedBox(height: 5,),
      CityDropDown(controller: null,),
      SizedBox(height: 5,),

      _entryField("Specific Area"),

      SizedBox(height: 15,),
      Container(
        child: Text(
            "Day",
            style: GoogleFonts.quicksand(
              fontSize: 18,
            )
        ),
      ),
      SizedBox(height: 10,),

      BottomModalSheet(),

      SizedBox(height: 20,),
      Container(
        child: Text(
            "Date",
            style: GoogleFonts.quicksand(
              fontSize: 18,
            )
        ),
      ),
      Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      "Opening Time",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: TimePicker(time: 'open',),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 30,),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                    "Closing Time",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: TimePicker(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
            
            Text('Store Status' ,style: GoogleFonts.quicksand(fontSize: 15),),
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

      _entryField("Owner Name"),
      _entryField("Contact Number"),


    ],
  );
}

Widget _title() {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
        text: 'Register',
        style: GoogleFonts.quicksand(
          fontSize: 30,
          color: Color(0xfff7892b),
        ),
        children: [
          TextSpan(
              text: ' PartStore',
              style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.black,
              )
          ),
        ]),
  );
}



class TimePicker extends StatefulWidget {
  final String time;
  TimePicker({this.time});
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _openTimeSelected = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _closeTimeSelected = TimeOfDay(hour: 8, minute: 00);

//  void _selectTime() async {
//    final TimeOfDay newTime = await showTimePicker(
//      context: context,
//      initialTime: widget.time == 'open' ? _openTimeSelected : _closeTimeSelected,
//    );
//    if (newTime != null) {
//      setState(() {
//        if(widget.time == 'open'){
//          _openTimeSelected = newTime;
//          openTime = _openTimeSelected.format(context);
//          print(openTime);
//        }else{
//          _closeTimeSelected = newTime;
//          closeTime = _closeTimeSelected.format(context);
//          print(closeTime);
//        }
//      });
//    }
//  }

  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          color: Color(0XFF012A4A),

          onPressed: () {

          },
          child: Text(
            'Time',
            style: GoogleFonts.quicksand(
              fontSize: 18,
              color: Colors.orange,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Selected Time: ${widget.time == 'open' ? _openTimeSelected.format(context) : _closeTimeSelected.format(context)}",
          style: GoogleFonts.quicksand(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}



class BottomModalSheet extends StatelessWidget {

  const BottomModalSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        height: 50,
        minWidth: MediaQuery.of(context).size.width,
        color: Color(0XFF012A4A),
        child: Text(
          'Working Days',
          style: GoogleFonts.quicksand(
            fontSize: 17,
            color: Colors.orange,
          ),
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 600,
                color: Color(0xfff3f3f4),
                child:Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Select working days',
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      MyCheckBox(),
                      SizedBox(height: 20,),
                      Center(
                        child: FlatButton(
                          color: Colors.orange,
                          child: Text(
                            'Submit',
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



class MyCheckBox extends StatefulWidget {

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: null,
                    onChanged: (bool value) {
                      setState(() {
                        //monday = value;
                      });
                    },
                  ),
                  Text("Monday", style: GoogleFonts.quicksand(fontSize: 16),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      value: null,
                      onChanged: (bool value) {
                        setState(() {
                          //  tuesday = value;
                        });
                      },
                    ),
                    Text(
                      "Tuesday", style: GoogleFonts.quicksand(fontSize: 16),),
                  ],
                ),
              ),
              SizedBox(width: 40,),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: null,
                    onChanged: (bool value) {
                      setState(() {
                        //  wednesday = value;
                      });
                    },
                  ),
                  Text(
                    "Wednesday", style: GoogleFonts.quicksand(fontSize: 16),),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: null,
                    onChanged: (bool value) {
                      setState(() {
                        //    thursday = value;
                      });
                    },
                  ),
                  Text("Thursday", style: GoogleFonts.quicksand(fontSize: 16),),
                ],
              ),
              SizedBox(width: 40,),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: null,
                    onChanged: (bool value) {
                      setState(() {
                        // friday = value;
                      });
                    },
                  ),
                  Text("Friday", style: GoogleFonts.quicksand(fontSize: 16),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Checkbox(
                      value: null,
                      onChanged: (bool value) {
                        setState(() {
                          //saturday = value;
                        });
                      },
                    ),
                    Text(
                      "Saturday", style: GoogleFonts.quicksand(fontSize: 16),),
                  ],
                ),
              ),
              SizedBox(width: 40,),

            ],
          ),
        ),


        Row(
          children: [
            Checkbox(
              value: null,
              onChanged: (bool value) {
                setState(() {
                  //   sunday = value;
                });
              },
            ),
            Text("Sunday", style: GoogleFonts.quicksand(fontSize: 16),),
          ],
        ),
      ],
    );
  }
}