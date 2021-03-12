import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
//import 'messg_firestore.dart';

class MessageFetch1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyInbox(),
    );
  }
}

class MyInbox extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return MyInboxState();
  }
}

class MyInboxState extends State {
  SmsQuery query = new SmsQuery();

  List messages = new List();
  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("SMS Inbox"),
          backgroundColor: Colors.pink,
        ),
        body: FutureBuilder(
          future: fetchSMS(),
        
          builder: (context, snapshot) {
            //  var itemCount =messages.length;
            //  print("item count is,$itemCount");

            return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                    ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.markunread,
                        color: Colors.pink,
                      ),
                      title: Text(messages[index].address),
                      subtitle: Text(
                        messages[index].body,
                        maxLines: 2,
                        style: TextStyle(),
                      ),
                      
                    ),
                  );
                });
          },
        )
        );
  }

  fetchSMS() async {
    
    messages = await query.getAllSms;
    //print(messages.asMap());
    //var m= messages.asMap();
    //print(m.length);
    //print(m[35].body);

    //for(var i=m.length; i==0; i--){
    //  print(i);

    //print(m[i].body);

    //}
    //messages.forEach((messg) => print(messg.body));
    //print("aa gye");
    //messages.forEach((messg) => Messg(messg.body));         
    
    //var getMssg;
    //messages.forEach((messg) => getMssg = messg.body);
    //print(getMssg);
   

//print("bahar");
//var getMssg;
//messages.forEach((messg) => getMssg = messg.body);
//Messg(getMssg);
  }
     
  }

