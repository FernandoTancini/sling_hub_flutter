import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static NotificationHelper _instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationHelper._();
  static NotificationHelper get getInstance =>
      _instance ??= NotificationHelper._();

  void initialize() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = AndroidInitializationSettings('mipmap');
    var initializationSettingsIOS = IOSInitializationSettings();

    var initializationSettingsMacOS = MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);

    // TODO: onSelectNotification
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void notiy(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'your channel id', 'your channel name', 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    print(flutterLocalNotificationsPlugin);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'item x');
  }
}
