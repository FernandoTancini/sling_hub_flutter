import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/model.dart';
import 'package:sling_hub_flutter/view/components.dart';

class StartupDetailingPage extends StatefulWidget {
  static const routeName = '/detalhamento';

  @override
  _StartupDetailingPageState createState() => _StartupDetailingPageState();
}

class _StartupDetailingPageState extends State<StartupDetailingPage> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    Startup startup = getStartup(id);
    return Scaffold(
        appBar: AppBar(title: Text('Detalhes de ' + startup.name)),
        body: Container(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(Startup.iconData, size: 70.0),
                      Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(startup.name,
                              style: TextStyle(fontSize: 24)))
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
                  entitledText('Descrição', startup.description)
                ],
              )),
        ));
  }
}
