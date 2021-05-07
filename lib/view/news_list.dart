import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sling_hub_flutter/model.dart';
import 'package:sling_hub_flutter/util.dart';

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
        for (var i = 0; i < news.length; i += 1)
          _newsCard(context, news[i], setState)
      ]),
    );
  }
}

Widget _newsCard(
    BuildContext context, News news, void Function(VoidCallback) setState) {
  return GestureDetector(
      onTap: () => launchURL(news.url),
      onDoubleTap: () => setState(() => news.notification = !news.notification),
      child: Card(
          child: Padding(
              padding: EdgeInsets.all(16),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: news.notification
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.featured_play_list_outlined,
                          size: 50,
                        ))),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(news.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text(news.body
                                    .substring(0, min(200, news.body.length)) +
                                '...'))
                      ]),
                ))
              ]))));
}
