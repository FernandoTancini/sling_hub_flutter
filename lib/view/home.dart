import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/view/news_list.dart';
import 'package:sling_hub_flutter/view/startup_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  final String title = 'Sling Hub';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<Marker> markers = {
    Marker(
        markerId: MarkerId('123456'), position: LatLng(-22.939055, -43.1939485))
  };
  LatLng _initialcameraposition = LatLng(-22.9387144, -43.1931696);
  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                '${widget.title} (${AppLocalizations.of(context).helloWorld})')),
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: ListView(children: [
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
                      Permission.location.request().isGranted.then((isGranted) {
                        if (!isGranted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("vsf"),
                          ));
                        }
                      });
                      Navigator.pushNamed(context, NewsListPage.routeName);
                      WidgetsFlutterBinding.ensureInitialized();
                      availableCameras().then((print));
                    },
                  )),
                ])),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _initialcameraposition, zoom: 18),
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  markers: markers,
                )),
          ],
        ));
  }
}
