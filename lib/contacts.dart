import 'package:flutter/material.dart';

class MyContactsPage extends StatefulWidget {
  @override
  _MyContactsPageState createState() => _MyContactsPageState();
}

class _MyContactsPageState extends State<MyContactsPage> with AutomaticKeepAliveClientMixin{
  List<Map<String, String>> contacts = [
    {
      'name': 'aliaa',
      'email': 'engaliaaosama@gmail.com',
      'image': 'assets/images/img.png'
    },
    {
      'name': 'nibal',
      'email': 'engaliaaosama@gmail.com',
      'image': 'assets/images/img.png'
    },
  ];

  void _incrementList() {
    print('ppp');
    setState(() {
      contacts.add({
        'name': 'new name',
        'email': 'engaliaaosama@gmail.com',
        'image': 'assets/images/img.png'
      });
    });
    print('list length is ${contacts.length}');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _incrementList,
        ),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(contacts[index]["image"]),
                ),
                title: Text(contacts[index]['name']),
                subtitle: Text(contacts[index]['email']),
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}

class Contact {
  String name;
  String email;
  String image;

  Contact({this.name, this.email, this.image});
}
