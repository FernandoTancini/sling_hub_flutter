import 'package:flutter/material.dart';

Column entitledWidget(String title, Widget widget) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.w200)),
      widget
    ]);

Column entitledText(String title, String data) => entitledWidget(
    title, Text(data, style: TextStyle(fontWeight: FontWeight.w500)));
