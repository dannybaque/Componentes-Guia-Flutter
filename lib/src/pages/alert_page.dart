import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title:Text('Alertas'),
        ),
        body: Center(
          child: RaisedButton(
            child:Text('Mostrar alerta'),
            color: Colors.purple[200],
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: ()=> _mostrarAlert(context),
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

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja lateral'),
              FlutterLogo(size: 50)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: Text('ok')
              ),
            FlatButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: Text('cancelar')
              )
          ],

        );
      }
    );
  }
}