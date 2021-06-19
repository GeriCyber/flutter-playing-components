import 'package:flutter/material.dart';

final _formattedIcons = <String, IconData> {
  'add_alert' : Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open
};

Icon getIcon(String icon) => Icon(_formattedIcons[icon], color: Colors.deepPurple);