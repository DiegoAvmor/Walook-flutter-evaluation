import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime selectedDate;

  Map<String, bool> checkBoxList = {
    'place': false,
    'food': false,
    'music': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(40),
                  child: Placeholder(
                    fallbackHeight: 40,
                    fallbackWidth: 40,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Please add the events main information. Date is very important in order to give you amazing results',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today_sharp,
                color: Colors.red,
                size: 30,
              ),
              title: Text("Event Date"),
              subtitle: Text(selectedDate == null
                  ? "No date selected"
                  : formatter.format(selectedDate)),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    new Duration(days: 600),
                  ),
                ).then((newdate) {
                  setState(() {
                    selectedDate = newdate;
                  });
                });
              },
            ),
            CheckboxListTile(
              title: Text('Place'),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkBoxList['place'],
              secondary: Icon(
                Icons.place,
                size: 35,
              ),
              onChanged: (bool value) {
                setState(() {
                  checkBoxList['place'] = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Food'),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkBoxList['food'],
              secondary: Icon(
                Icons.food_bank,
                size: 35,
              ),
              onChanged: (bool value) {
                setState(() {
                  checkBoxList['food'] = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Music'),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkBoxList['music'],
              secondary: Icon(
                Icons.library_music,
                size: 35,
              ),
              onChanged: (bool value) {
                setState(() {
                  checkBoxList['music'] = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}