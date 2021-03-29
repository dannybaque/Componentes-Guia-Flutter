import 'package:flutter/material.dart';

/* 
Creamos una clase final abstracta privada de MAP que tome dos variables por defecto
<String, Data>
luego modificamos los iconos que devuelven para que tengan otro color, en este caso Azul


*/
final _icons=<String, IconData>{
  'notifications_on_outlined': Icons.notifications_on_outlined,
  'account_box': Icons.account_box,
  'folder_special_rounded': Icons.folder_special_rounded,
  'animation': Icons.animation,
  'textsms': Icons.textsms,
  'tune': Icons.tune,
  'list': Icons.list,
};

Icon getIcon (String nombreIcono){

  return Icon(_icons[nombreIcono],color: Colors.purple[200], size: 50);

}