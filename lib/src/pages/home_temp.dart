import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ['Javascript', 'Typescript', 'Dart', 'Angular', 'PHP'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('<gericyber />')
      ),
      body: ListView(
        children: _createItems(),
      ),
    );
  }

  List<Widget> _createItems() {
    return options.map((item) {
      return Column(
        children: <Widget>[
        ListTile(
          title: Text(item),
          subtitle: Text('Lorem ipsum'),
          leading: Icon(Icons.account_balance),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        Divider()
        ],
      );
    }).toList();
  }
}