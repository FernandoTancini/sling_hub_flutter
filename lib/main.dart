import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/view/home.dart';
import 'package:sling_hub_flutter/view/startup_list.dart';
import 'package:sling_hub_flutter/view/startup_detailing.dart';
import 'package:sling_hub_flutter/view/news_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sling_hub_flutter/notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper.getInstance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<FirebaseApp> get _fbApp => Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sling Hubb',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('pt', ''),
        ],
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigo[800],
          accentColor: Colors.cyan[600],

          fontFamily: 'helvetica',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0),
              headline6: TextStyle(fontSize: 36.0),
              bodyText2: TextStyle(fontSize: 16.0)),
        ),
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        routes: <String, WidgetBuilder>{
          StartupDetailingPage.routeName: (BuildContext context) =>
              StartupDetailingPage(),
          StartupListPage.routeName: (BuildContext context) =>
              StartupListPage(),
          NewsListPage.routeName: (BuildContext context) => NewsListPage()
        });
  }
}
