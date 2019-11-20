import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import '../home.dart';
import 'package:http/http.dart' as http;

class Latab2 extends StatefulWidget {
  List list;
  int index;
  Latab2({this.index,this.list});
  @override
  _Latab2State createState() => new _Latab2State();
}
class MyItem {
  MyItem({ this.isExpanded: false, this.header, this.body });
  bool isExpanded;
  final String header;
  final String body;
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class _Latab2State extends State<Latab2> {

  List<MyItem> _items = <MyItem>[
    MyItem( header: 'header', body: 'body' ),
  ];

  void deleteData() {
    var url = "http://apiuladech.grupodcv.com/my_store/getdata.php";
    http.post( url, body: {
      'idaluno': widget.list[widget.index]['idaluno']
    } );
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text( "Are You sure want to delete '${widget.list[widget
          .index]['nombre']}'" ),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK DELETE!", style: new TextStyle( color: Colors.black ), ),
          color: Colors.red,
          onPressed: () {
            deleteData( );
            Navigator.of( context ).push(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new Home( null ),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text(
              "CANCEL", style: new TextStyle( color: Colors.black ) ),
          color: Colors.green,
          onPressed: () => Navigator.pop( context ),
        ),
      ],
    );

    showDialog( context: context, child: alertDialog );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:
      ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.lightBlueAccent,
            child: const Center(child: Text('Média  do Aluno')),
          ),
          /*Container(
              child: SfCircularChart(

              )
          ),*/
          Container(
            height: 50,
            color: Colors.amber,
            child: const Center(child: Text('Média para Perfil Normal no Curso')),
          ),
          Container(
            width: 300,
            height: 300,
            child: RadarChart(
              values: [1, 2, 4, 7, 9],
              labels: [
                "Créditos Cursados",
                "Periodos Cursados",
                "Nota Exame de Admissão",
                "Média Geral",
                "Média Último Período",
              ],
              maxValue: 12,
              fillColor: Colors.amber,
            ),
          ),
        ],
      )

    );
  }
}
