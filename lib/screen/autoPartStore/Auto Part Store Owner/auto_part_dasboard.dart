import 'package:bikersworld/model/partstore_model.dart';
import 'package:bikersworld/screen/autoPartStore/Auto%20Part%20Store%20Owner/register_auto_parts.dart';
import 'package:bikersworld/services/part_store_queries/part_queries.dart';
import 'package:bikersworld/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:bikersworld/screen/autoPartStore/Auto Part Store Owner/auto_part_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class AutoPartDashboard extends StatefulWidget {
  final String category;
  final String partStoreId;
  AutoPartDashboard({@required this.partStoreId,@required this.category});
  @override
  _AutoPartDashboardState createState() => _AutoPartDashboardState();
}

class _AutoPartDashboardState extends State<AutoPartDashboard> {

  final _autoParts = AutoPartQueries();
  final _valid = ToastValidMessage();

  Future<void> deleteAutoPart(String docId) async{
    bool result = await _autoParts.deleteAutoPart(docId: docId);
    if(result){
      _valid.validToastMessage(validMessage: 'Part Successfully Deleted');
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
              color: Colors.white,
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
                color: Colors.orange,
              )
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:25,top: 15),
                child: Container(
                 child: Text(
                   widget.category,
                   style:GoogleFonts.quicksand(
                     fontSize: 23,
                     color: Colors.orange,
                   ),
                 ),
                ),
              ),
              SizedBox(height: 20,),
              StreamBuilder(
                stream: _autoParts.getAutoPartByCategory(userId: widget.partStoreId, category: widget.category),
                builder: (BuildContext context, AsyncSnapshot<List<AutoPartModel>> snapshot) {
                  if(snapshot.hasData && snapshot.data.isNotEmpty){
                    return GridView.builder(
                      physics:  NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 1,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Column(
                          children: [
                            Container(
                              height: 150,
                              color: Colors.transparent,
                              child: FlatButton(
                                child: ActiveProjectsCard(
                                  cardColor: Colors.white,
                                  image: NetworkImage(snapshot.data[index].imageURL),
                                  title: snapshot.data[index].title,
                                  price: snapshot.data[index].price.toString(),
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AutoPartDetail(autoPartDetails: snapshot.data[index],)));
                                },
                              ),
                            ),
                            SizedBox(height: 5,),
                            Expanded(
                              child:Padding(
                                padding: const EdgeInsets.only(left:5),
                                child: Container(
                                  child: Row(
                                    children: [
                                      FlatButton(
                                        padding:EdgeInsets.zero,
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.redAccent,
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: (){
                                          deleteAutoPart(snapshot.data[index].docId);
                                        },
                                      ),
                                      FlatButton (
                                        padding:EdgeInsets.all(0),
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.blue,
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: (){
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(builder: (context) => RegisterAutoParts(autoPartInfo: snapshot.data[index],))); // ignore: missing_required_param
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),],
                        );
                      },
                    );
                  }
                  else if(snapshot.hasData && snapshot.data.isEmpty){
                    return Center(child: Text('No Data Found'));
                  }
                  else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
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



class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String price;
  final image;

  ActiveProjectsCard({
    this.cardColor,
    this.image,
    this.title,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xfff0f0f0),
        ),
        color: cardColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:MediaQuery.of(context).size.width-50,
            height:105,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8,top: 2),
            child: Container(
              child: Text(
                title,
                style: GoogleFonts.varelaRound(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8,top: 2),
            child: Container(
              child: Text(
                price,
                style: GoogleFonts.varelaRound(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}