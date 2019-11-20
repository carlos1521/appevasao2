import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Materialdidactico extends StatefulWidget {
  Materialdidactico(this.idaluno);
  String idaluno;

  @override
  _MaterialdidacticoState createState() => new _MaterialdidacticoState();
}

class _MaterialdidacticoState extends State<Materialdidactico> {

  final formatdate = DateFormat("yyyy-MM-dd");
  final formattime = DateFormat("HH:mm");

  TextEditingController controllerDatainicio = new TextEditingController( );
  TextEditingController controllerHorainicio = new TextEditingController( );
  TextEditingController controllerDatafim = new TextEditingController( );
  TextEditingController controllerHorafim = new TextEditingController( );
  TextEditingController controllerDescricao = new TextEditingController( );
  TextEditingController controllerSala = new TextEditingController( );

  void addData() {
    var url = "http://apiuladech.grupodcv.com/addestrategia3.php";

    http.post( url, body: {
      "aluno": widget.idaluno,
      "professor": controllerDatainicio.text,
      "descricao": controllerDescricao.text,
      "datainicio": controllerDatainicio.text,
      "horainicio": controllerHorainicio.text,
      "datafim": controllerDatafim.text,
      "horafim": controllerHorafim.text,
      "sala": controllerSala.text
    } );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text( "Cadastrar Material de Apoio Didáctico" ),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all( 10.0 ),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerDescricao,
                  decoration: new InputDecoration(
                      hintText: "Descrição", labelText: "Descrição" ),
                ),
                new  Column(children: <Widget>[
                  Text('Data de Inicio (${formatdate.pattern})'),
                  DateTimeField(
                    controller: controllerDatainicio,
                    format: formatdate,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                ]),
                new Column(children: <Widget>[
                  Text('Hora de Inicio (${formattime.pattern})'),
                  DateTimeField(
                    controller: controllerHorainicio,
                    format: formattime,
                    onShowPicker: (context, currentValue) async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.convert(time);
                    },
                  ),
                ]),
                new Column(children: <Widget>[
                  Text('Data de Fim (${formatdate.pattern})'),
                  DateTimeField(
                    controller: controllerDatafim,
                    format: formatdate,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                ]),
                new Column(children: <Widget>[
                  Text('Hora de Fim (${formattime.pattern})'),
                  DateTimeField(
                    controller: controllerHorafim,
                    format: formattime,
                    onShowPicker: (context, currentValue) async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.convert(time);
                    },
                  ),
                ]),
                new TextField(
                  controller: controllerSala,
                  decoration: new InputDecoration(
                      hintText: "Sala", labelText: "Sala" ),
                ),
                new Padding(
                  padding: const EdgeInsets.all( 10.0 ),
                ),
                new RaisedButton(
                  child: new Text("Salvar",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red[900],
                  onPressed: () {
                    addData( );
                    Navigator.pop( context );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
