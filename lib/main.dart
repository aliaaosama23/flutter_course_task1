import 'package:flutter/material.dart';
import 'package:task/tasks.dart';

import 'appointments.dart';
import 'contacts.dart';
import 'notes.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTabPage(),
    );
  }
}

class MyTabPage extends StatefulWidget {
  @override
  _MyTabPageState createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage>  with SingleTickerProviderStateMixin{
  int i=0;
  TabController _tabController;//=TabController(length: length, vsync: vsync);

  @override
  void initState() {
    super.initState();
   _tabController=TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
   
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text('FlutterBook'),
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'appointments',
                  icon: Icon(Icons.event),
                ),
                Tab(
                  text: 'contacts',
                  icon: Icon(Icons.contact_page),
                ),
                Tab(
                  text: 'notes',
                  icon: Icon(Icons.description_outlined),
                ),
                Tab(
                  text: 'tasks',
                  icon: Icon(Icons.contact_page),
                )

                //  Column(
                //   children: [Icon(Icons.calendar_today), Text('appointments')],
                // ),
                // Column(
                //   children: [Icon(Icons.contact_page), Text('conatcts')],
                // ),
                // Column(
                //   children: [Icon(Icons.note), Text('notes')],
                // ),
                // Column(
                //   children: [Icon(Icons.list), Text('tasks')],
                // ),
              ],
            ),
          ),
          body:
          //  IndexedStack(
          //   index: i,
          //   children: [
          //     MyCustomCalender(),
          //     MyContactsPage(),
          //     MyNotesPage(),
          //     MyTasksPage(),
          //   ],
          // )
            TabBarView(
              controller: _tabController,
                  children:
                  [
                  MyCustomCalender(),
                  MyContactsPage(),
                  MyNotesPage(),
                  MyTasksPage(),
                  ]
            ),
          ),
    );
  }
}