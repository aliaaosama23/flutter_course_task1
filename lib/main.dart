import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList;
import 'package:intl/intl.dart';

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
          // floatingActionButton: FloatingActionButton(
          //   child: Icon(Icons.add),
          //   onPressed: () {},
          //   tooltip: 'add new',
          // ),
          appBar: AppBar(
            title: Text('FlutterBook'),
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'appointments',
                  icon: Icon(Icons.contact_page),
                ),
                Tab(
                  text: 'contacts',
                  icon: Icon(Icons.contact_page),
                ),
                Tab(
                  text: 'notes',
                  icon: Icon(Icons.contact_page),
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

class MyTasksPage extends StatefulWidget {
  @override
  _MyTasksPageState createState() => _MyTasksPageState();
}

class MyCustomCalender extends StatefulWidget {
  @override
  _MyCustomCalenderState createState() => _MyCustomCalenderState();
}

class _MyCustomCalenderState extends State<MyCustomCalender> {
  DateTime _currentDate = DateTime(2020, 8, 3);
  DateTime _currentDate2 = DateTime(2020, 8, 4);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2020, 8, 3));
  DateTime _targetDateTime = DateTime(2020, 8, 3);

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 8, 5): [
        new Event(
          date: new DateTime(2020, 8, 5),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.green,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2020, 8, 5),
          title: 'Event 2',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {
    _markedDateMap.addAll(new DateTime(2020, 8, 13), [
      new Event(
        date: new DateTime(2020, 8, 13),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 8, 13),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 8, 13),
        title: 'Event 3',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 8, 13),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),

      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return new SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //custom icon
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: _calendarCarousel,
          ), // This trailing comma makes auto-formatting nicer for build methods.
          //custom icon without header
          // Container(
          //   margin: EdgeInsets.only(
          //     top: 30.0,
          //     bottom: 16.0,
          //     left: 16.0,
          //     right: 16.0,
          //   ),
          //   child: new Row(
          //     children: <Widget>[
          //       Expanded(
          //           child: Text(
          //             _currentMonth,
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 24.0,
          //             ),
          //           )),
          //       ElevatedButton(
          //         child: Text('PREV'),
          //         onPressed: () {
          //           setState(() {
          //             _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month -1);
          //             _currentMonth = DateFormat.yMMM().format(_targetDateTime);
          //           });
          //         },
          //       ),
          //       ElevatedButton(
          //         child: Text('NEXT'),
          //         onPressed: () {
          //           setState(() {
          //             _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month +1);
          //             _currentMonth = DateFormat.yMMM().format(_targetDateTime);
          //           });
          //         },
          //       )
          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: _calendarCarouselNoHeader,
          ), //
        ],
      ),
    );
  }
}

class _MyTasksPageState extends State<MyTasksPage> {
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}

class MyNotesPage extends StatefulWidget {
  @override
  _MyNotesPageState createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
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

class MyContactsPage extends StatefulWidget {
  @override
  _MyContactsPageState createState() => _MyContactsPageState();
}

class _MyContactsPageState extends State<MyContactsPage> {
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
}

class Contact {
  String name;
  String email;
  String image;

  Contact({this.name, this.email, this.image});
}
