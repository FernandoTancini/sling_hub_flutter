import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/view/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/perfil';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
        ),
        body: Center(
            child: ListView(children: [
          Card(
              child: ListTile(
            title: Text('Editar sua startup'),
            onTap: () =>
                Navigator.pushNamed(context, EditProfilePage.routeName),
          ))
        ])));
  }
}
