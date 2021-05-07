import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/model.dart';
import 'package:sling_hub_flutter/view/components.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:http/http.dart';

class StartupDetailingPage extends StatefulWidget {
  static const routeName = '/detalhamento';

  @override
  _StartupDetailingPageState createState() => _StartupDetailingPageState();
}

class _StartupDetailingPageState extends State<StartupDetailingPage> {
  Future<Response> apiResponse = get(Uri.parse(
      "http://www.randomnumberapi.com/api/v1.0/random?min=1&max=100&count=6"));

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
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Startup.iconData, size: 70.0)),
                    ),
                    Text(startup.name, style: TextStyle(fontSize: 24))
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      children: [
                        Expanded(child: entitledText('Setor', startup.sector)),
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
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: entitledText('Descrição', startup.description)),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  child: entitledWidget(
                      'Engajamento Instagram',
                      FutureBuilder<Response>(
                        future: apiResponse,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<dynamic> chartValues =
                                json.decode(snapshot.data.body);
                            return Container(
                                margin: EdgeInsets.only(top: 14),
                                height: 120,
                                child: LineChart(LineChartData(lineBarsData: [
                                  LineChartBarData(spots: [
                                    for (var i = 0;
                                        i < chartValues.length;
                                        i += 1)
                                      FlSpot(i.toDouble(),
                                          chartValues[i].toDouble())
                                  ])
                                ])));
                          } else if (snapshot.hasError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("${snapshot.error}"),
                            ));
                            return Text("Erro na requisição pra api");
                          }

                          return CircularProgressIndicator();
                        },
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
