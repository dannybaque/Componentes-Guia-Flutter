import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text('Tarjetas'),
      ),
      body: ListView(padding: EdgeInsets.all(9), children: <Widget>[
        _cardTipo1(),
        SizedBox(height: 15.0),
        _cardTipo2(),
        SizedBox(height: 15.0),
        _cardTipo1(),
        SizedBox(height: 15.0),
        _cardTipo2(),
        SizedBox(height: 15.0),
        _cardTipo1(),
        SizedBox(height: 15.0),
        _cardTipo2(),
        SizedBox(height: 15.0),
        _cardTipo1(),
        SizedBox(height: 15.0),
        _cardTipo2()
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[200],
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.purple[200]),
            title: Text('Cards'),
            subtitle: Text('subtitulo'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(child: Text('Cancelar'), onPressed: () {}),
            FlatButton(
              child: Text('ok'),
              onPressed: () {},
            )
          ])
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(

      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://mymodernmet.com/wp/wp-content/uploads/2020/11/International-Landscape-Photographer-thumbnail.jpg'),
            placeholder: AssetImage('assets/loading.gif'),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No tengo idea de que poner'))
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2,10)
          )
        ]
        ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card,)
    );
  }
}
