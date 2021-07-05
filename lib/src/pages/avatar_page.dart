import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/11837703?v=4'),
              radius: 25.0,
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(right: 10.0),
          //   child: CircleAvatar(
          //     child: Text('G'),
          //     backgroundColor: Colors.blue.shade100,
          //   ),
          // )
        ],
      ),
      body: Center( 
        child: Container(
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200), 
            image: NetworkImage('https://avatars.githubusercontent.com/u/11837703?v=4')),
        ),
      ),
    );
  }
}