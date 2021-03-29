import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/pages/alert_page.dart';
import 'package:flutter_application_2/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

 
/*
Iniciamos la app 
*/
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',

      // Quitamos la franja diagonal que aparece en el simulador
      debugShowCheckedModeBanner: false,

      //Este widget nos permite internacionalizar la app en los idiomas que permite
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      /* 
      Definimos los lenguajes que queremos permitir en la app. 
      ingles por default y el siguiente, es el que queremos
      */
      supportedLocales: [
        const Locale('en','US'),
        const Locale('es','ES')
      ],

      /* 
      Aqui declaramos cual es la primera pagina que vamos a 
      mostrar en el inicio, toma un valor String por defecto 
      */
      initialRoute: '/',
      /*
      Para no hacer mucho codigo de todas las rutas que vamos a usar, creamos un metodo
      getApplicationRoutes() el cual devuelve todas las rutas a usar. este se encuentra en
      la carpeta Routes/routes.dart
      */
      routes: getApplicationRoutes(),
      /*
      Esta propiedad permite hacer una llamada a una ruta por defecto 
      cuando no hay una ruta definida.
      en este caso si no hay una ruta declarada y pulsamos, esta no
      redirecciona a la ruta por defecto que escogimos AlertPage()
      */
      onGenerateRoute: (RouteSettings settings){

        print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context)=>AlertPage()
        );
      },
    );
  }
}