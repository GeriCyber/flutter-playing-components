import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards')
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _firstCard(),
          SizedBox(height: 20.0),
          _secondCard()
        ]
      )
    );
  }

  Widget _firstCard() {
    return Card(
      child: Column(
        children: <Widget> [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Lorem Ipsum'),
            subtitle: Text('Test')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {}
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {}
              )
            ]
          ) 
        ],
      )
    );
  }

  Widget _secondCard() {
    return Card(
      child: Column(
        children: <Widget> [
          FadeInImage(
            image: NetworkImage('https://www.ecestaticos.com/imagestatic/clipping/d51/cc6/d51cc6d551eefb0762cb3c9abe82dc2d/apple-empieza-manana-la-primera-wwdc-completamente-digital-de-su-historia.jpg?mtime=1622473782'),
            placeholder: AssetImage('assets/jar-loading.gif'), 
            fadeInDuration: Duration(milliseconds: 300),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Lorem pixel')
          )
        ],
      ),
    );
  }
}