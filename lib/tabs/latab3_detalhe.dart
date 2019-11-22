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
       appBar: new AppBar(
         title: new Text("EvApp"),
         backgroundColor: Colors.red[900],
         centerTitle: true,
       ),
       body:
       SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: Column(
             children: <Widget>[
               Card(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     ListTile(
                       title: Text("ID Estrategia"),
                       subtitle: Text(widget.list[widget.index]['idestrategia']),
                     ),
                     ListTile(
                       title: Text("Descrição"),
                       subtitle: Text("${widget.list[widget.index]['descripcion']}"),
                     ),
                     ListTile(
                       title: Text("Data Inicio"),
                       subtitle: Text("${widget.list[widget.index]['datainicio']}"),
                     ),
                     ListTile(
                       title: Text("Hora Inicio"),
                       subtitle: Text("${widget.list[widget.index]['horainicio']}"),
                     ),
                     ListTile(
                       title: Text("Data Fim"),
                       subtitle: Text("${widget.list[widget.index]['datafim']}"),
                     ),
                     ListTile(
                       title: Text("Hora Fim"),
                       subtitle: Text("${widget.list[widget.index]['horafim']}"),
                     ),
                     ListTile(
                       title: Text("Sala"),
                       subtitle: Text("${widget.list[widget.index]['sala']}"),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       )
   );
  }
}
