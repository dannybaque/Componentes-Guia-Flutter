import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  const AvatarPage
({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title:Text('Avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://img.icons8.com/color/452/avatar.png'),
              radius: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL')
            ),
          )
        ],
        ),
        body: Center(
          child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'), 
            image: NetworkImage('https://img.icons8.com/color/452/avatar.png'),
            ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[200],
          child: Icon(Icons.home),
          onPressed: (){
            Navigator.pop(context);
          },
          ),
    );
  }
}