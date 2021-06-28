import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/view/news_list.dart';
import 'package:sling_hub_flutter/view/startup_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  final String title = 'Sling Hub';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${widget.title} (${AppLocalizations.of(context).helloWorld})')),
      body: ListView(children: [
        Card(
            child: ListTile(
          title: Text('Startups'),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            FirebaseFirestore.instance
                .collection('events')
                .add({'text': 'Hola!'});
            Navigator.pushNamed(context, StartupListPage.routeName);
          },
        )),
        Card(
            child: ListTile(
          title: Text('Notícias'),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.pushNamed(context, NewsListPage.routeName);
            WidgetsFlutterBinding.ensureInitialized();
            availableCameras().then((print));
          },
        ))
      ]),
    );
  }
}
