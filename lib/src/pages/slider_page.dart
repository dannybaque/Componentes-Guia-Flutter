import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text('Control Deslizante'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _crearSlider(), 
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            )
          ],
        ),
      ),
    );
  }
  Widget _crearSwitch(){
    return SwitchListTile(
      activeColor: Colors.purple[200],
      title: Text('Bloquear Switch'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      });
  }

  Widget _crearCheckBox(){

    return CheckboxListTile(
      activeColor: Colors.purple[200],
      title: Text('Bloquear Slider'),
      value: _bloquearCheck, 
      onChanged: (valor){

        setState(() {
          _bloquearCheck = valor;
        });
        
      });
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.purple[200],
      label: 'Tamano de la imagen',
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck) ? null: (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/9/90/Spiderman.JPG'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
