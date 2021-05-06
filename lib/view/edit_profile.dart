import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = '/editar-perfil';

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Editar Perfil'),
        ),
        body: Text('Edite aqui o seu perfil!'));
  }
}
