import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/model.dart';
import 'package:sling_hub_flutter/view/startup_detailing.dart';
import 'package:sling_hub_flutter/view/components.dart';

class StartupListPage extends StatefulWidget {
  final title = 'Startups';
  static const routeName = '/startups';

  @override
  _StartupListPageState createState() => _StartupListPageState();
}

class _StartupListPageState extends State<StartupListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(children: [
        for (var i = 0; i < startups.length; i += 1)
          _startupCard(context, startups[i])
      ]),
    );
  }
}

Widget _startupCard(BuildContext context, Startup startup) {
  void openStartupDetailing() =>
      Navigator.pushNamed(context, StartupDetailingPage.routeName,
          arguments: startup.id);

  void showToast() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Esse é um teste pra disciplina!"),
      ));

  return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      child: GestureDetector(
          onDoubleTap: showToast,
          onTap: openStartupDetailing,
          child: Card(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 12),
                            color: Colors.white,
                            child: Image.network(
                              startup.imgUrl,
                              width: 50,
                              height: 50,
                            )),
                        Text(startup.name, style: TextStyle(fontSize: 20))
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
