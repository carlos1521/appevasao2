import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Latab3_detalhe extends StatefulWidget {
  List list;
  int index;
  Latab3_detalhe({this.index,this.list});
  @override
  _Latab3_detalheState createState() => new _Latab3_detalheState();
}

class _Latab3_detalheState extends State<Latab3_detalhe> {

  void getData() {
    var url = "http://apiuladech.grupodcv.com/getestrategiadetalhe.php";
    http.post( url, body: {
      'idestrategia': widget.list[widget.index]['idestrategia']
    } );
  }


  @override
  Widget build(BuildContext context) {
   return new Scaffold(
       body:
       Column(
         children: <Widget>[
           new Padding(
             padding: const EdgeInsets.only( top: 30.0 ), ),
           new Text( widget.list[widget.index]['idestrategia'],
             style: new TextStyle(
                 fontSize: 20.0, fontWeight: FontWeight.bold ), ),
           new Text(
             "Descrição : ${widget.list[widget.index]['descripcion']}",
             style: new TextStyle( fontSize: 18.0 ), ),
           new Text(
             "Data Inicio : ${widget.list[widget.index]['datainicio']}",
             style: new TextStyle( fontSize: 18.0 ), ),
           new Text(
             "Hora Inicio : ${widget.list[widget.index]['horainicio']}",
             style: new TextStyle( fontSize: 18.0 ), ),
           new Text(
             "Data Fim : ${widget.list[widget.index]['datafim']}",
             style: new TextStyle( fontSize: 18.0 ), ),
           new Text(
             "Hora Fim : ${widget.list[widget.index]['horafim']}",
             style: new TextStyle( fontSize: 18.0 ), ),
           new Text(
             "Sala : ${widget.list[widget.index]['sala']}",
             style: new TextStyle( fontSize: 18.0 ), ),
           new Padding(
             padding: const EdgeInsets.only( top: 30.0 ), ),
         ],
       )
   );
  }
}
