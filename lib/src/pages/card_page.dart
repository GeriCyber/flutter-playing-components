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
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
    final card = Container(

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

    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(15.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
    );
  }
}