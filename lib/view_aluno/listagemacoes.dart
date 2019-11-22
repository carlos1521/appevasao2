import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/tabs/latab3_detalhe.dart';


class Listagemacoes extends StatefulWidget {
  List list;
  Listagemacoes(this.list);
  @override
  _ListagemacoesState createState() => new _ListagemacoesState();
}

class _ListagemacoesState extends State<Listagemacoes> {

  Future<List> getData() async {
    final response = await http.get("http://apiuladech.grupodcv.com/getestrategiaxaluno.php?idaluno=${widget.list[0]['idaluno']}");
    return json.decode(response.body);
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
      new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
            list: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}


class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new Latab3_detalhe(list:list, index:i,)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['tipoestrategia']),
                //leading: list[i]['tipoestrategia']=='ORIENTACAO PEDAGOGICA' ? Icon(Icons.school,color: Colors.blueAccent,) : Icon(Icons.collections_bookmark,color: Colors.blueAccent,),
                leading: Icon(Icons.directions_run,color: Colors.blueAccent,),
                subtitle: new Text("Data de Inicio : ${list[i]['datainicio']}"),
              ),

            ),
          ),
        );
      },
    );
  }
}

