import 'package:flight_booking/searchFlight.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Search Flights'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum TripType { oneway, roundtrip }

Map<TripType, String> _tripTypes = {
  TripType.oneway: "ONE WAY",
  TripType.roundtrip: "ROUND TRIP",
};

class _MyHomePageState extends State<MyHomePage> {
  TripType _selectedTrip = TripType.oneway;
  String from = " ";
  String to = " ";
  int _currentIndex = 0;
  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1947),
      lastDate: DateTime(2222),
    );

    if (_datePicker != null && _datePicker != _date) {
      _date = _datePicker;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        centerTitle: true,
        title: Text(
          widget.title,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_tripTypes.length, (index) {
                      return buildTripTypeSelector(
                          _tripTypes.keys.elementAt(index));
                    })),
              )
            ],
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "From",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  value: "1",
                  child: Center(
                    child: Text("San Francisco"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "2",
                  child: Center(
                    child: Text("Barcelona"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "3",
                  child: Center(
                    child: Text("Tokyo"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "4",
                  child: Center(
                    child: Text("London"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "5",
                  child: Center(
                    child: Text("Sydney"),
                  ),
                ),
              ],
              onChanged: (_value) => {
                print(_value.toString()),
                setState(() {
                  from = _value;
                })
              },
              hint: Text("FROM"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "To",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  value: "1",
                  child: Center(
                    child: Text("San Francisco"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "2",
                  child: Center(
                    child: Text("Barcelona"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "3",
                  child: Center(
                    child: Text("Tokyo"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "4",
                  child: Center(
                    child: Text("London"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "5",
                  child: Center(
                    child: Text("Sydney"),
                  ),
                ),
              ],
              onChanged: (_value) => {
                print(_value.toString()),
                setState(() {
                  to = _value;
                })
              },
              hint: Text("TO"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                "Departure",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 0.5,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Expanded(
                  child: SizedBox(
                      width: 50.0,
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _selectDate(context);
                          });
                        },
                      ))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                "Return",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 0.5,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Expanded(
                  child: SizedBox(
                      width: 50.0,
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _selectDate(context);
                          });
                        },
                      ))),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              GestureDetector(
                  onTap: () {
                    _showPopupMenu();
                  },
                  child: SizedBox(
                    height: 75.0,
                    width: 320.0,
                    child: Container(
                      child: Container(
                        color: Colors.blueGrey[100],
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Passengers",
                          style: TextStyle(color: Colors.blueGrey[300]),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchFlight()));
            },
            child: Text("Search"),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.flight),
              title: Text("Search"),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.flight_takeoff),
              title: Text("Boarding Pass"),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle),
              title: Text("Check-in"),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text("More"),
              backgroundColor: Colors.deepPurple),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildTripTypeSelector(TripType tripType) {
    var isSelected = _selectedTrip == tripType;
    return FlatButton(
      padding: EdgeInsets.only(left: 4, right: 16),
      onPressed: () {
        setState(() {
          _selectedTrip = tripType;
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: isSelected ? Colors.blue : Colors.transparent,
      child: Row(
        children: <Widget>[
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          Text(
            _tripTypes[tripType],
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 300, 100, 0.0),
      items: [
        PopupMenuItem(
          child: Text("Adult"),
        ),
        PopupMenuItem(
          child: Text("Child"),
        ),
        PopupMenuItem(
          child: Text("Baby"),
        ),
      ],
      elevation: 8.0,
    );
  }
}
