import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/view/home.dart';
import 'package:sling_hub_flutter/view/startup_list.dart';
import 'package:sling_hub_flutter/view/startup_detailing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sling Hub',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigo[800],
          accentColor: Colors.cyan[600],

          fontFamily: 'helvetica Now Text',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0),
              headline6: TextStyle(fontSize: 36.0),
              bodyText2: TextStyle(fontSize: 16.0)),
        ),
        home: HomePage(),
        routes: <String, WidgetBuilder>{
          StartupDetailingPage.routeName: (BuildContext context) =>
              StartupDetailingPage(),
          StartupListPage.routeName: (BuildContext context) => StartupListPage()
        });
  }
}
