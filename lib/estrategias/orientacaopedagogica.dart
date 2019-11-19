import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrientacaoPedagogica extends StatefulWidget {
  @override
  _OrientacaoPedagogicaState createState() => new _OrientacaoPedagogicaState();
}

class _OrientacaoPedagogicaState extends State<OrientacaoPedagogica> {

  DateTime _dataInfo;
  TimeOfDay _timeInfo;

  TextEditingController controllerCode = new TextEditingController( );
  TextEditingController controllerName = new TextEditingController( );
  TextEditingController controllerPrice = new TextEditingController( );
  TextEditingController controllerStock = new TextEditingController( );

  void addData() {
    var url = "http://apiuladech.grupodcv.com/adddata.php";

    http.post( url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    } );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text( "Cadastrar Orientação Pedagógica" ),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all( 10.0 ),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: "Descrição", labelText: "Descrição" ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Data Inicio", labelText: "Data Inicio" ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Hora Inicio", labelText: "Hora Inicio" ),
                ),
                /*new Text ('Date selected: ${_date.toString()}'),
                new RaisedButton(
                    child: new Text("Selected Date"),
                    onPressed: (){_selectDate(context);}
                ),*/
                new FlatButton(
                  child: new Row(
                    children: <Widget>[
                      new Text( '${_dataInfo}' ),
                      new Icon( Icons.calendar_today ),
                    ],
                  ),
                  onPressed: () async {
                    final dtPick = await showDatePicker(
                        context: context,
                        initialDate: new DateTime.now( ),
                        firstDate: new DateTime( 2000 ),
                        lastDate: new DateTime( 2100 ));
                    if(dtPick !=null && dtPick != _dataInfo ){
                      setState(() {
                        _dataInfo = dtPick;
                      });
                    }
                  },
                ),
                new FlatButton(
                  child: new Row(
                    children: <Widget>[
                      new Text( '${_timeInfo}' ),
                      new Icon( Icons.access_time ),
                    ],
                  ),
                  onPressed: () async {
                    final tmPick = await showTimePicker(
                        context: context,
                        initialTime: _timeInfo);
                    if(tmPick !=null && tmPick != _timeInfo ){
                      setState(() {
                        _timeInfo = tmPick;
                      });
                    }
                  },
                ),
                new Padding(
                  padding: const EdgeInsets.all( 10.0 ),
                ),
                new RaisedButton(
                  child: new Text( "Salvar" ),
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
