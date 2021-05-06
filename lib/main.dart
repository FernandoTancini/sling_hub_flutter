import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/view/home.dart';
import 'package:sling_hub_flutter/view/detailing.dart';
import 'package:sling_hub_flutter/view/profile.dart';
import 'package:sling_hub_flutter/view/edit_profile.dart';

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
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          DetailingPage.routeName: (BuildContext context) => DetailingPage(),
          ProfilePage.routeName: (BuildContext context) => ProfilePage(),
          EditProfilePage.routeName: (BuildContext context) => EditProfilePage()
        });
  }
}
