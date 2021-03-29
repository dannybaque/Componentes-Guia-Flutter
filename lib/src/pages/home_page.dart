import 'package:flutter/material.dart';

import 'package:flutter_application_2/src/providers/menu_provider.dart';
import 'package:flutter_application_2/src/utils/icono_string_util.dart';

/*
Pagina Principal
solo indicamos el titulo en el appBar y su metodo para cargar los componentes
*/

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aprendiendo Dart || Componentes'),
          backgroundColor: Colors.purple[200],
        ),
        body: _lista());
  }

/*
Creacion del metodo Widget que hará carga de las opciones del mediante un FutureBuilder
a traves de future con el metodo cargarData() del archivo menu_provider.dart
*/

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

/*
Aqui creamos la lista dinamica que hara referencia(por la ruta) y nos llevara al
componente que nosotros indiquemos, esta definida por un icono, texto y ruta.
al final retorna la lista llamada OPCIONES[] que carga los widgets y un divider por cada uno
*/

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
