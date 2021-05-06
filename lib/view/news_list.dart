import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/model.dart';
import 'package:sling_hub_flutter/view/components.dart';

class NewsListPage extends StatefulWidget {
  final title = 'Notícias';
  static const routeName = '/noticias';

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(children: [
        for (var i = 0; i < news.length; i += 1) _newsCard(context, news[i])
      ]),
    );
  }
}

Widget _newsCard(BuildContext context, News news) => Text('On Progress');
