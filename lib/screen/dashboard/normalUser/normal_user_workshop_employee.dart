import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/search_queries/search_workshop_mechanics.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/workshop_queries/mechanic_queries.dart';
import 'package:bikersworld/services/workshop_queries/workshop_queries.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/screen/dashboard/normalUser/normal_user_workhop_employee_profile.dart';

class NormalUserWorkshopEmployee extends StatefulWidget {
  final String workshopId;
  NormalUserWorkshopEmployee({@required this.workshopId});
  @override
  _NormalUserWorkshopEmployeeState createState() =>
      _NormalUserWorkshopEmployeeState();
}

class _NormalUserWorkshopEmployeeState
    extends State<NormalUserWorkshopEmployee> {
  final _mechanic = SearchWorkshopMechanics();
  final _error = ToastErrorMessage();

  Stream<List<Mechanics>> getMechanics() {
    try {
      if (widget.workshopId != null) {
        return _mechanic.fetchWorkshopMechanics(workshopId: widget.workshopId);
      }
    } catch (e) {
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  @override
  void initState() {
    print(widget.workshopId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BIKERSWORLD',
          style: GoogleFonts.quicksand(
            color: Colors.orange,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0XFF012A4A),
        iconTheme: IconThemeData(color: Color(0xfffbb448)),
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Workshop',
                    style: GoogleFonts.quicksand(
                      fontSize: 25,
                      color: Color(0xfff7892b),
                    ),
                    children: [
                      TextSpan(
                          text: ' Mechanics',
                          style: GoogleFonts.quicksand(
                            fontSize: 25,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StreamBuilder(
              stream: getMechanics(),
              builder: (BuildContext context, AsyncSnapshot<List<Mechanics>> snapshot) {
                if(snapshot.hasData){
                  print('${snapshot.data.first.name}');
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      return FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NormalUserWorkshopEmployeeProfile(data: snapshot.data[index],workshopId: widget.workshopId,)));
                        },
                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: ListTile(

                          leading: SizedBox(
                            child: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.white,
                              child:  CircleAvatar(
                                backgroundImage: AssetImage("assets/mechanicavatar.jpg",),
                                radius: 38.0,
                              ),
                            ),
                          ),
                            title: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[index].name,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  snapshot.data[index].mechanicStatus ? Text(
                                    "Avaliable",style: GoogleFonts.quicksand(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),
                                  ):Text(
                                    "Not Avaliable",style: GoogleFonts.quicksand(fontSize: 15,color: Colors.red, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                else if(snapshot.hasData && snapshot.data.isEmpty){
                  return Center(child: Text('NO MECHANICS FOUND'),);
                }
                else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
