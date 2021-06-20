import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/services/search_queries/search_workshop_mechanics.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bikersworld/widgets/rating_bar.dart';
import 'package:bikersworld/screen/dashboard/normalUser/reviews/employee_feedback_form.dart';
class NormalUserWorkshopEmployeeProfile extends StatefulWidget {

  final Mechanics data;
  final String workshopId;
  NormalUserWorkshopEmployeeProfile({@required this.data,this.workshopId});

  @override
  _NormalUserWorkshopEmployeeProfileState createState() => _NormalUserWorkshopEmployeeProfileState();
}

class _NormalUserWorkshopEmployeeProfileState extends State<NormalUserWorkshopEmployeeProfile> {

  final _error = ToastErrorMessage();
  final _mechanicReviews = SearchWorkshopMechanics();

  Future<List<MechanicReviews>> getMechanicReviews(){
    try{
      if(widget.workshopId != null && widget.data.id != null) {
        return _mechanicReviews.fetchWorkshopMechanicsReviews(
            mechanicId:widget.data.id, workshopId: widget.workshopId);
      }
    }catch(e){
     _error.errorToastMessage(errorMessage: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
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
              )
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20,top: 20),
                      child: CircleAvatar(
                        backgroundColor:Colors.orange,
                        radius: 55,
                        child: CircleAvatar(
                          radius:50,
                          backgroundColor: Colors.white,
                         backgroundImage: AssetImage("assets/mechanicavatar.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              widget.data != null ? widget.data.name : "Ibtasam Ur Rehman",
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              widget.data != null ? widget.data.contact : "03355437782",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              widget.data != null ? widget.data.speciality : "Electrican",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5,),
                            RatingsBar(20),

                            SizedBox(height: 10,),
                            FlatButton(

                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xffedb97e),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(FontAwesomeIcons.edit,color: Colors.white, size: 20,),
                                    SizedBox(width: 10,),
                                    Text("Review", style: GoogleFonts.quicksand(fontSize: 18,color: Colors.white),),
                                  ],
                                ),
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeFeedbackForm(mechanicId: widget.data.id,workshopId: widget.workshopId,)));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:30,top: 20),
                child: Text(
                  "Reviews",
                  style: GoogleFonts.varelaRound(
                    fontSize:22,
                    color: Colors.black,
                  ),
                ),
              ),
              FutureBuilder(
                future: getMechanicReviews(),
                builder: (BuildContext context, AsyncSnapshot<List<MechanicReviews>> snapshot) {
                  if(snapshot.hasData && snapshot.data.isNotEmpty){
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(left:15,right:15),
                          child: Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor:Colors.orange,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/user.png"),
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(
                                      snapshot.data[index].title,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    RatingsBar(18,userRating: snapshot.data[index].starRating,),
                                    SizedBox(height: 5,),
                                    Text(
                                      snapshot.data[index].description,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
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
                    return Center(child: Text('NO REVIEWS FOUND'),);
                  }
                  else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);
                  }
                  return Center(child: CircularProgressIndicator());
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
