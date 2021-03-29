import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _date = '';
  String _selectedOption ='Soltero';
  List<String> _estado = ['Soltero', 'Casado', 'Divorciado', 'Viudo', 'Separacion en Proceso Judicial','Concubinato']; 

  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text('Formulario'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearDate(context),
          Divider(height: 40),
          _crearDropDown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle, color: Colors.purple[200],size: 40,)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }
  
  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')
      );
      if (picked != null) {
        setState(() {
          _date = picked.toString();
          _inputFieldDateController.text = _date;
        });
      }
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );
  }
  
  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)
          ),
          hintText: 'Correo de la Persona',
          labelText: 'Correo',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email,color: Colors.purple[200],size: 40)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }
  
  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)
          ),
          hintText: 'Tu Contraseña',
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock,color: Colors.purple[200],size: 40)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }
  
  Widget _crearDate(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)
          ),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today_outlined, color: Colors.purple[200],size: 40)),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropDrown(){

    List<DropdownMenuItem<String>> lista = new List();
    
    _estado.forEach((estado) {

      lista.add(DropdownMenuItem(
        child: Text(estado),
        value: estado,
      ));
    });
    return lista;
  }

  Widget _crearDropDown(){
    return Row(
      children: <Widget>[
        Icon(Icons.view_list, color: Colors.purple[200],size: 40),
        SizedBox(
          width: 30,
        ),
        Expanded(
                  child: DropdownButton(
            value: _selectedOption,
            items: getOpcionesDropDrown(), 
            onChanged: (opt){
              setState(() {
                _selectedOption = opt;
              });
            }
          ),
        ),
      ],
    );
  }

}