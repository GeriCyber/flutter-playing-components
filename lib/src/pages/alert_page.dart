import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alert page')
      ),
      body: Center (child: ElevatedButton(
        child: Text('Show Alert'),
        onPressed: () => _showAlert(context),
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          shape: StadiumBorder()
        )
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  _showAlert(BuildContext context) {
    showDialog(context: context,
    builder: (context) { 
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Lorem ipsum'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Lorem ipsum dolor sit amet consectetur adipisicing elit. A quod eaque distinctio dolorum, corrupti unde reprehenderit deleniti dolorem dolore exercitationem labore delectus sed quaerat rerum quidem eum ea recusandae qui.'),
            FlutterLogo(size: 100.0),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: Text('Ok'))
        ],
      );
    },
    barrierDismissible: true,
    );
  }
}