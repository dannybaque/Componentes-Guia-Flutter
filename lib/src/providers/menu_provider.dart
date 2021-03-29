import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/*
Aqui vamos a crear una clase PRIVADA que primeramente importe los servicios de dart e 
implementamos 
rooBundle y
convert,
que nos permite tomar paquetes declarados en el archivo pubspec.yaml
Creamos una lista dinamica llamada OPCIONES[]
Despues
Creamos el metodo cargarData()
ese metodo lo vamos asignar como una <lista dinamica en Future>
creamos la variable RESP la cual obtiene datos del acrhivo .json
atraves de la propiedad loadString del metodo rooBundle.
Para luego crear un MAP llamado [dataMap] que convierta el string a .json
mediante la propieda DECODE() del import Convert y le asignamos la variable RESP
para finalmente 
Asignar los valores del [dataMap] a la lista dinamica OPCIONES
En este caso toma los valores de la propiedad ['rutas']
para hacer la redireccion en el menu de los componentes
y como parte final retorna la lista OPCIONES[]

como ultimo damos como final la clase _MenuProvider 
para crear una instancia de ese bloque de codigo.
*/

class _MenuProvider{
  List<dynamic> opciones = [];
  _MenuProvider(){
    cargarData();
    }
    Future<List<dynamic>> cargarData() async {
     final resp= await rootBundle.loadString('data/menu_opts.json');
      Map dataMap= json.decode(resp);
        opciones=dataMap['rutas'];

        return opciones;
    }
}
final menuProvider = new _MenuProvider();