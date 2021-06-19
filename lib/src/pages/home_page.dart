import 'package:flutter/material.dart';
import 'package:flutter_playing_components/src/pages/alert_page.dart';
import 'package:flutter_playing_components/src/providers/menu_provider.dart';
import 'package:flutter_playing_components/src/utils/icons_utils.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playing w/ components'),
        backgroundColor: Color(Colors.deepPurpleAccent.value),
      ),
      body: _list()
    );
  }

  Widget _list() {
    
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
      
      return ListView(
        children: _createItems(snapshot.data, context),
      );
        
      },
    );

  }
  List<Widget> _createItems(List<dynamic> data, BuildContext context) {
    final List <Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.check, color: Colors.deepPurple),
        onTap: () => Navigator.pushNamed(context, opt['route']),
      );

      options..add(widgetTemp)
             ..add(Divider());
    }); 
    return options;
  }
}