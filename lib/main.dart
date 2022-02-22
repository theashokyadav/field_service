import 'dart:convert';
import 'package:field_service/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';

import 'constants.dart';
import 'create_ticket_form.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Field Support Tickets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(

                  colors: [
                    gradientColor1,
                    gradientColor2,
                  ],
                ),
              ),
            ),
            actions: [

              IconButton(icon:
              Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateTicketForm()),
                    );
                    // Utility.CallNavigator(context, WalkinCustomerForm(), "");
                  }

              ),

            ]
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> data) {
            if(data.hasError)
              {
                return Center(child: Text("${data.error}"));
              }
            else if(data.hasData)
              {
                var items = data.data as List<User>;
                return ListView.builder(
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index){
                      return Card(
                          elevation: 4.0,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                alignment: Alignment.centerLeft,
                                child: Row(children: [
                                  Icon(Icons.account_circle_outlined),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(items[index].name.toString()),
                                  ),

                                  Spacer(),
                                  Text(items[index].status.toString(),
                                    style: TextStyle(
                                      background: Paint()
                                        ..color = items[index].status.toString()=="OPEN"?Colors.lightGreenAccent:Colors.redAccent
                                        ..strokeWidth = 17
                                        ..strokeJoin = StrokeJoin.round
                                        ..strokeCap = StrokeCap.round,
                                      // ..style = PaintingStyle.stroke,
                                      color: items[index].status.toString()=="OPEN"?Colors.black:Colors.white,
                                      // color: Colors.black54, fontWeight: FontWeight.bold
                                    ),)
                                ]),
                              ),
                              ListTile(
                                title: Text(items[index].subject.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                                subtitle: Text(items[index].address.toString(),),
                                // trailing: Icon(Icons.favorite_outline),
                              ),
                              Divider(
                                  color: Colors.grey
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                alignment: Alignment.centerLeft,
                                child: Row(children: [
                                  Icon(Icons.calendar_today),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(items[index].date.toString()+"  ", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),

                                  Icon(Icons.access_time),
                                  Text(" "+items[index].time.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                                  Spacer(),
                                  CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 15,
                                      child: Icon(Icons.location_on, color: Colors.white,)),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 15,
                                        child: Icon(Icons.call, color: Colors.white,)),
                                  ),
                                ]),
                              ),
                            ],
                          ));

                    });
              } else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          // child: Container(
          //   padding: EdgeInsets.all(16.0),
          //   child: SingleChildScrollView(
          //       scrollDirection: Axis.vertical,
          //       child: Column(
          //         children: [
          //           buildCard(),
          //         ],
          //       )),
          // ),
        ));
  }
  Future<List<User>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/userslist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => User.fromJson(e)).toList();
  }
}




//
// return Card(
// elevation: 5,
// margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
// child: Container(
// padding: EdgeInsets.all(8),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Expanded(
// child: Container(
// padding: EdgeInsets.only(bottom: 8),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.only(left: 8, right: 8),
// child: Text(
// items[index].name.toString(),
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(left: 8, right: 8),
// child: Text(items[index].address.toString()),
// )
// ],
// ),
// ))
//
// ],
// ),
// ),
// );