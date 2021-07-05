import 'package:flutter/material.dart';

final _formattedIcons = <String, IconData> {
  'add_alert' : Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input_rounded,
  'slider': Icons.slideshow_rounded,
  'list': Icons.list,
};

Icon getIcon(String icon) => Icon(_formattedIcons[icon], color: Colors.deepPurple);