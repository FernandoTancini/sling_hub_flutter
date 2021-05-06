import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/view/startup_list.dart';

class HomePage extends StatefulWidget {
  final String title = 'Sling Hub';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(children: [
        ListTile(
          title: Text('Startups'),
          onTap: () => Navigator.pushNamed(context, StartupListPage.routeName),
        ),
        ListTile(title: Text('Notícias'))
      ]),
    );
  }
}
