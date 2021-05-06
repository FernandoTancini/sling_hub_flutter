import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/model.dart';
import 'package:sling_hub_flutter/view/detailing.dart';
import 'package:sling_hub_flutter/view/profile.dart';
import 'package:sling_hub_flutter/view/components.dart';

class MyHomePage extends StatefulWidget {
  final String title = 'Sling Hub';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () => Navigator.pushNamed(context, ProfilePage.routeName),
        )
      ]),
      body: ListView(children: [
        for (var i = 0; i < startupList.length; i += 1)
          _startupCard(context, startupList[i])
      ]),
    );
  }
}

Widget _startupCard(BuildContext context, Startup startup) {
  void openStartupDetailing() =>
      Navigator.pushNamed(context, DetailingPage.routeName,
          arguments: startup.id);

  void showToast() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Esse é um teste pra disciplina!"),
      ));

  return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      child: GestureDetector(
          onLongPress: showToast,
          onTap: openStartupDetailing,
          child: Card(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Startup.iconData, size: 50.0),
                        Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(startup.name,
                                style: TextStyle(fontSize: 20)))
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          children: [
                            Expanded(
                                child: entitledText('Setor', startup.sector)),
                            Expanded(
                                child: entitledText(
                                    'Fundação', '${startup.foundationYear}'))
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        children: [
                          Expanded(
                              child: entitledText('Captando',
                                  startup.wantsinvestment ? 'Sim' : 'Não')),
                          Expanded(
                              child: entitledText('Recrutando',
                                  startup.wantsToHire ? 'Sim' : 'Não'))
                        ],
                      ),
                    ),
                    ElevatedButton(
                      child: Center(
                        child: Text('Explorar'),
                      ),
                      onPressed: openStartupDetailing,
                    )
                  ],
                )),
          )));
}
