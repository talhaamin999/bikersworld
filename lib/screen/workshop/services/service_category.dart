import 'dart:developer';

import 'package:bikersworld/model/workshop_model.dart';
import 'package:bikersworld/screen/workshop/add_services.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:bikersworld/services/workshop_queries/service_queries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class ServiceCategoryInformation extends StatefulWidget {

  final String serviceCategory;
  final String workshopId;
  ServiceCategoryInformation({this.serviceCategory,@required this.workshopId,});

  @override
  _ServiceCategoryInformationState createState() => _ServiceCategoryInformationState();
}

class _ServiceCategoryInformationState extends State<ServiceCategoryInformation> {
  int currentIndex;
  final WorkshopServiceQueries _servicesQuery = WorkshopServiceQueries();

  TextEditingController _textFieldController = new TextEditingController();
  final _valid = ToastValidMessage();
  final _error = ToastErrorMessage();

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
  Future<void> deleteService(Services serviceData) async{
    try {
      bool result = await _servicesQuery.deleteService(docId: serviceData.id);
      if (result) {
        _valid.validToastMessage(
            validMessage: WorkshopServiceQueries.serviceDeletionMessage);
      } else {
        _error.errorToastMessage(
            errorMessage: _servicesQuery.errorMessage);
      }
    }catch(e){
      _error.errorToastMessage(errorMessage: e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'BIKERSWORLD',
              style: GoogleFonts.quicksand(
                color: Colors.orange,
                fontSize: 18,
              ),
            ),
            backgroundColor: Color(0XFF012A4A),
            leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.white,),
              onPressed:() => Navigator.pop(context),
            )
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 29),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: widget.serviceCategory != null ? widget.serviceCategory : '[]',
                      style: GoogleFonts.quicksand(
                        fontSize: 25,
                        color: Color(0xfff7892b),
                      ),
                      children: [
                        TextSpan(
                            text: ' Services',
                            style: GoogleFonts.quicksand(
                              fontSize: 25,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<List<Services>>(
                  stream: _servicesQuery.getServices(serviceCategory: widget.serviceCategory,workshopId: widget.workshopId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data.isNotEmpty) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 15, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              CircleAvatar(
                                                  child: Icon(Icons.settings)),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.hasData ? snapshot.data[index].title:'Service',
                                                style: GoogleFonts.raleway(
                                                  fontSize: 18,
                                                  color: Color(0XFF012A4A),
                                                ),
                                              ),
                                            ],
                                          ),
                                          subtitle: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 50),
                                            child: Text(
                                                snapshot.hasData ? snapshot.data[index].price.toString() : 'Price'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, bottom: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        RaisedButton(
                                          color: Colors.blue,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Edit",
                                                style: GoogleFonts.raleway(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          onPressed: () {
                                            print(snapshot.data[index].id);
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (context) => AddServices(service: snapshot.data[index],index: index,)));
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        RaisedButton(
                                          color: Colors.red,
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.userMinus,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                "Delete",
                                                style: GoogleFonts.raleway(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          onPressed: () {
                                            deleteService(snapshot.data[index]);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    else if (snapshot.hasData && snapshot.data.isEmpty) {
                      return Center(child: Text("No Services Found"),);
                    }
                    else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    return CircularProgressIndicator();
                  },
                ),
                SizedBox(height: 30,),
                //SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
