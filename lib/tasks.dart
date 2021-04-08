import 'package:flutter/material.dart';

class MyTasksPage extends StatefulWidget {
  @override
  _MyTasksPageState createState() => _MyTasksPageState();
}


class _MyTasksPageState extends State<MyTasksPage> with AutomaticKeepAliveClientMixin{
  List<Map<String, dynamic>> myTasks = [
    {
      'title': 'task1',
      'subtitle': 'task1 sub title is here',
      'isChecked': true
    },
    {
      'title': 'task2',
      'subtitle': 'task2 sub title is here',
      'isChecked': false
    },
    {
      'title': 'task3',
      'subtitle': 'task3 sub title is here',
      'isChecked': true
    },
    {
      'title': 'task4',
      'subtitle': 'task4 sub title is here',
      'isChecked': false
    }
  ];

 void _addNewTask(){
   setState((){
     
         myTasks.add({
      'title': 'task4',
      'subtitle': 'task4 sub title is here',
      'isChecked': false});
    });
   
 }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body:ListView.builder(
      itemCount: myTasks.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
            value: myTasks[index]['isChecked'],
            onChanged: (bool value) {
              setState(() {
                myTasks[index]['isChecked'] = value;
                print(myTasks[index].toString());
              });
            },
            title: ListTile(
              title: Text(myTasks[index]['title']),
              subtitle: Text(myTasks[index]['subtitle']),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue,
            checkColor: Colors.white);
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _addNewTask
      ,
      child:Icon(Icons.add)
    ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
