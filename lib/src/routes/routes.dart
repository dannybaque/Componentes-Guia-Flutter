import 'package:flutter/material.dart';

import 'package:flutter_application_2/src/pages/alert_page.dart';
import 'package:flutter_application_2/src/pages/animated_container.dart';
import 'package:flutter_application_2/src/pages/avatar_page.dart';
import 'package:flutter_application_2/src/pages/card_page.dart';
import 'package:flutter_application_2/src/pages/home_page.dart';
import 'package:flutter_application_2/src/pages/input_page.dart';
import 'package:flutter_application_2/src/pages/listview_page.dart';
import 'package:flutter_application_2/src/pages/slider_page.dart';

/*
Creamos una carpeta con un archivo routes.dart para organizarlo de mejor forma.
Creamos un objeto que el cual nos va a retornar el mismo objeto con el nombre de su clase 
y nombre que posee en el archivo .json
*/

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListViewPage()
  };
}
