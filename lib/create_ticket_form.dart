import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

class CreateTicketForm extends StatefulWidget {
  const CreateTicketForm({Key? key}) : super(key: key);

  @override
  _CreateTicketFormState createState() => _CreateTicketFormState();
}

class _CreateTicketFormState extends State<CreateTicketForm> {
  String fieldTechnicianDropdownValue = 'Select Technician';
  String primaryIssueDropdownValue = 'Select Issue';
  String statusDropdownValue = 'OPEN';
  String priorityDropdownValue = 'HIGH';

  var appointmentDate="DD-MM-YYYY";
  var appointmentStartTime="HH:MM";
  var appointmentEndTime="HH:MM";

  void getDateofAppointment() async {
    var order = await getDate();
    setState(() {
      appointmentDate = DateFormat('dd-MM-yyyy').format(order);
    });
  }

  void getAppointmentStartTime() async {
    var time1 = await getTime();
    setState(() {
      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      appointmentStartTime = localizations.formatTimeOfDay(time1!, alwaysUse24HourFormat: false);
      // appointmentStartTime = TimeOfDayFormat.HH_colon_mm;
    });
  }

  void getAppointmentEndTime() async {
    var time2 = await getTime();
    setState(() {
      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      appointmentEndTime = localizations.formatTimeOfDay(time2!, alwaysUse24HourFormat: false);
      // appointmentStartTime = TimeOfDayFormat.HH_colon_mm;
    });
  }

  // void getAppointmentEndTime() async {
  //   var order = await getTime();
  //   setState(() {
  //     appointmentStartTime = DateFormat('HH:mm').format(order);
  //   });
  // }

  Future<DateTime?> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
  }

  Future<TimeOfDay?> getTime() {
    // Imagine that this function is
    // more complex and slow.
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      // initialDate: DateTime.now(),
      // firstDate: DateTime(2018),
      // lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( resizeToAvoidBottomInset: true,
        appBar: new AppBar(
          title: new Text("Create Service Ticket"),
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

        ),
        body:Builder( builder:(context) =>Stack(children:[SingleChildScrollView(child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: <Widget>[

                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(alignment: Alignment.topLeft,
                                child: Text("CONTACT INFO",
                                    style: new TextStyle(fontSize: 15,color: colorCustom, fontWeight: FontWeight.bold))),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(alignment: Alignment.topLeft,
                                child: Text("Name",
                                    style: new TextStyle(fontSize: 13,color: colorCustom))),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 10, 0),
                            child: Container(
                                child: (Container(
                                    child:TextField(
                                        keyboardType: TextInputType.text,textAlignVertical: TextAlignVertical.center, decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(
                                            15,  // HERE THE IMPORTANT PART
                                          ),
                                          hintText: 'Name',

                                          hintStyle: TextStyle( color: Colors.grey),
                                          hoverColor: colorCustom,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: colorCustom, //this has no effect
                                            ),

                                            borderRadius: BorderRadius.circular(2.0),
                                          ),
                                        ))))),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(alignment: Alignment.topLeft,
                                child: Text("Phone Number",
                                    style: new TextStyle(fontSize: 13,color: colorCustom))),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 10, 0),
                            child: Container(
                                child: (Container(
                                    child:TextField(
                                        keyboardType: TextInputType.text,textAlignVertical: TextAlignVertical.center, decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(
                                        15,  // HERE THE IMPORTANT PART
                                      ),
                                      hintText: 'Phone Number',

                                      hintStyle: TextStyle( color: Colors.grey),
                                      hoverColor: colorCustom,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: colorCustom, //this has no effect
                                        ),

                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                    ))))),
                          ),

                        ],
                      ),

                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(alignment: Alignment.topLeft,
                                child: Text("SERVICE INFO.",
                                    style: new TextStyle(fontSize: 15,color: colorCustom, fontWeight: FontWeight.bold))),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(alignment: Alignment.topLeft,
                                child: Text("Subject",
                                    style: new TextStyle(fontSize: 13,color: colorCustom))),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 10, 0),
                            child: Container(
                                child: (Container(
                                    child:TextField(
                                        keyboardType: TextInputType.text,textAlignVertical: TextAlignVertical.center, decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(
                                        15,  // HERE THE IMPORTANT PART
                                      ),
                                      hintText: 'Subject',

                                      hintStyle: TextStyle( color: Colors.grey),
                                      hoverColor: colorCustom,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: colorCustom, //this has no effect
                                        ),

                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                    ))))),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(
                                alignment: Alignment.topLeft,
                                child: Text("Descripition",
                                    style: new TextStyle(fontSize: 13,color: colorCustom))),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 10, 0),
                            child: Container(
                                child: (Container(
                                    child:TextField(
                                        minLines: 3,
                                        maxLines: 6,
                                        keyboardType: TextInputType.multiline,textAlignVertical: TextAlignVertical.center, decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(
                                        15,  // HERE THE IMPORTANT PART
                                      ),
                                      hintText: 'Description',

                                      hintStyle: TextStyle( color: Colors.grey),
                                      hoverColor: colorCustom,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: colorCustom, //this has no effect
                                        ),

                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                    ))))),
                          ),

                        ],
                      ),

                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(alignment: Alignment.topLeft,
                                child: Text("APPOINTMENT INFO.",
                                    style: new TextStyle(fontSize: 15,color: colorCustom, fontWeight: FontWeight.bold))),
                          ),

                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Container(
                                    child: Align(alignment:Alignment.centerLeft,child:Text("Appointment Date",
                                        style: new TextStyle(fontSize: 15,color: colorCustom)))),
                              ),

                              Expanded(child:  Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 20, 10, 0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color:colorCustom)
                                    ),
                                    child:GestureDetector(
                                        onTap: (){
                                          getDateofAppointment();

                                        },
                                        child: Center(
                                          child: (Text(appointmentDate,  //measurement.requiredqty
                                            style: new TextStyle(fontSize: 15,),)),
                                        )

                                    )),
                              ), flex: 2),

                            ],
                          ),

                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Container(
                                    child: Align(alignment:Alignment.centerLeft,child:Text("Appointment Start Time",
                                        style: new TextStyle(fontSize: 15,color: colorCustom)))),
                              ),

                              Expanded(child:  Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 20, 10, 0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color:colorCustom)
                                    ),
                                    child:GestureDetector(
                                        onTap: (){
                                          getAppointmentStartTime();

                                        },
                                        child: Center(
                                          child: (Text(appointmentStartTime,  //measurement.requiredqty
                                            style: new TextStyle(fontSize: 15,),)),
                                        )

                                    )),
                              ), flex: 2),

                            ],
                          ),

                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Container(
                                    child: Align(alignment:Alignment.centerLeft,child:Text("Appointment End Time",
                                        style: new TextStyle(fontSize: 15,color: colorCustom)))),
                              ),

                              Expanded(child:  Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 20, 10, 0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color:colorCustom)
                                    ),
                                    child:GestureDetector(
                                        onTap: (){
                                          getAppointmentEndTime();

                                        },
                                        child: Center(
                                          child: (Text(appointmentEndTime,  //measurement.requiredqty
                                            style: new TextStyle(fontSize: 15,),)),
                                        )

                                    )),
                              ), flex: 2),

                            ],
                          ),

                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 10, 0, 0),
                                child: Container(alignment: Alignment.topLeft,
                                    child: Text("Assign Field Technician:",
                                        style: new TextStyle(fontSize: 15,color: colorCustom))),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Container(
                                    child: (Container(
                                      child: DropdownButton<String>(
                                        value: fieldTechnicianDropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(color: colorCustom, fontSize: 15, ),

                                        onChanged: (String? newValue) {
                                          setState(() {
                                            fieldTechnicianDropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>['Select Technician', 'Technician 1', 'Technician 2', 'Technician 3']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ))),
                              ),
                            ],
                          ),



                        ],
                      ),


                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(alignment: Alignment.topLeft,
                                child: Text("PROPERTIES",
                                    style: new TextStyle(fontSize: 15,color: colorCustom, fontWeight: FontWeight.bold))),
                          ),

                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 10, 0, 0),
                                child: Container(alignment: Alignment.topLeft,
                                    child: Text("Primary Issue:",
                                        style: new TextStyle(fontSize: 15,color: colorCustom))),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Container(
                                    child: (Container(
                                      child: DropdownButton<String>(
                                        value: primaryIssueDropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(color: colorCustom, fontSize: 15, ),

                                        onChanged: (String? newValue) {
                                          setState(() {
                                            primaryIssueDropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>['Select Issue', 'Issue 1', 'Issue 2', 'Issue 3']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ))),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                child: Container(alignment: Alignment.topLeft,
                                    child: Text("Status:",
                                        style: new TextStyle(fontSize: 15,color: colorCustom))),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Container(
                                    child: (Container(
                                      child: DropdownButton<String>(
                                        value: statusDropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(color: colorCustom, fontSize: 15, ),

                                        onChanged: (String? newValue) {
                                          setState(() {
                                            statusDropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>['OPEN', 'CLOSED']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ))),
                              ),
                            ],
                          ),


                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                child: Container(alignment: Alignment.topLeft,
                                    child: Text("Priority:",
                                        style: new TextStyle(fontSize: 15,color: colorCustom))),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Container(
                                    child: (Container(
                                      child: DropdownButton<String>(
                                        value: priorityDropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(color: colorCustom, fontSize: 15, ),

                                        onChanged: (String? newValue) {
                                          setState(() {
                                            priorityDropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>['HIGH', 'MEDIUM', 'LOW']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ))),
                              ),
                            ],
                          ),

                        ],
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(child:  Column(
                          children: <Widget>[
                            SizedBox(
                                width: 250,
                                child: FlatButton(
                                  padding: EdgeInsets.all(12.0),
                                  onPressed: ()  {
                                    // AddVisitor(context);
                                    // setState(() {
                                    //   indicatorvisible=true;
                                    // });



                                  },
                                  child: Text("CREATE TICKET"),
                                  color: colorCustom,
                                  textColor: Colors.white,
                                )),
                          ],
                        )),
                      ),






                    ]),
                  ),


                ],
              ),
            ))),])


    ));}
}
