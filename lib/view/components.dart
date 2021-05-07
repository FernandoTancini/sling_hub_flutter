import 'package:flutter/material.dart';

Column entitledWidget(String title, Widget widget) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.w200)),
      Container(margin: EdgeInsets.only(top: 8), child: widget)
    ]);

Column entitledText(String title, String data) => entitledWidget(
    title, Text(data, style: TextStyle(fontWeight: FontWeight.w500)));
