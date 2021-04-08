import 'package:flutter/material.dart';

class MyNotesPage extends StatefulWidget {
  @override
  _MyNotesPageState createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> with AutomaticKeepAliveClientMixin{
  final List<Map<String, dynamic>> notes = [
    {
      'color': Colors.yellow,
      'title': 'my note title',
      'subTitle': 'my note subtitle text here'
    },
    {
      'color': Colors.orange,
      'title': 'my note title',
      'subTitle': 'my note subtitle text here'
    },
    {
      'color': Colors.white,
      'title': 'my note title',
      'subTitle': 'my note subtitle text here'
    }
  ];

  void _incrementList() {
    setState(() {
      notes.add({
        'color': Colors.red,
        'title': 'new  note title',
        'subTitle': 'new note subtitle text here'
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementList,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return MyCustomCard(
                color: notes[index]['color'],
                title: notes[index]['title'],
                subTitle: notes[index]['subTitle']);
          },
          itemCount: notes.length,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class MyCustomCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subTitle;

  MyCustomCard({this.color, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      borderOnForeground: false,
      elevation: 5.0,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}