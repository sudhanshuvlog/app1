import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'firestore.dart';
import 'package:permission_handler/permission_handler.dart';
class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();

  
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact> _contacts;
 
  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    await [ Permission.contacts].request();
    //Make sure we already have permissions for contacts when we get to this
    //page, so we can just retrieve it
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
      
    });
    
  }
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: (Text('Here we go...')),
      ),
      body: _contacts != null
          //Build a list view of all contacts, displaying their avatar and
          // display name
          ? ListView.builder(
              itemCount: _contacts?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Contact contact = _contacts?.elementAt(index);
var phoneNo;
contact.phones.forEach((phone) => phoneNo= phone.value);
               
               return  AddUser(contact.displayName, phoneNo);
                               
              },
            )
          : Center(child: const CircularProgressIndicator()),
    );
  }
}
