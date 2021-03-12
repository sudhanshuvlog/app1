import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'messg_firestore.dart';

class MessageFetch extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   //   title: 'Flutter Demo',
     // theme: ThemeData(
       // primarySwatch: Colors.blue,
      //),
      home: MyInbox(),
    );
  }
}

class MyInbox extends StatefulWidget {
  @override
  State createState() {
    return MyInboxState();
  }
}

class MyInboxState extends State {
  SmsQuery query = new SmsQuery();

  List messages = new List();
  
  @override
  initState() {
    super.initState();
    fetchSMS();
    for (var i = 0; i < messages.asMap().length; i++)
    Messg(messages[i].body, messages[i].address);
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < messages.asMap().length; i++)
     return Messg(messages[i].body, messages[i].address); //just sending only latest message
    //i==0 have the latest mesaage 
    return Container(width:10.0, height: 0.0,);
    //child: Messg(messages[0].body, messages[0].address),
    //);
    //..ar getMssg;
   /* return Scaffold(
        appBar: AppBar(
          title: Text("SMS Inbox"),
          backgroundColor: Colors.pink,
        ),
        body: FutureBuilder(
            future: fetchSMS(),
            builder: (context, snapshot) {
              return Column(children: [
                for (var i = 0; i < messages.asMap().length; i++)
                  Container(
                    child: Messg(messages[i].body, messages[i].address),
                  ),
              ]);
            })); */
  }

  fetchSMS() async {
    messages = await query.getAllSms;

    var m = messages.asMap();
    print(m.length);
    print(m[1].body);
  }
}
