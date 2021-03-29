import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimo = 0;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();

    _agregarImagenes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text('Lista'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator(
                backgroundColor: Colors.purple[200],
              )]
          ),
          SizedBox(height:15)
        ],
      );
    } else {
      return Container();
    }
  }

  void _agregarImagenes() {
    for (var i = 1; i < 10; i++) {
      _ultimo++;
      _listaNumeros.add(_ultimo);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {
      final duration = new Duration(seconds: 2);
      return new Timer(duration, respuestaHTTP);
    });
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn);
    _agregarImagenes();

  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'));
        },
      ),
    );
  }

  Future<Null> obtenerPagina()async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimo++;
      _agregarImagenes();
    });
    return Future.delayed(duration);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
