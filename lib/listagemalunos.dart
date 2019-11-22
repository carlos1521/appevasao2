import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './Detail.dart';


class ListagemAlunos extends StatefulWidget {
  @override
  _ListagemAlunosState createState() => _ListagemAlunosState();
}

class _ListagemAlunosState extends State<ListagemAlunos> {

  Future<List> getData() async {
    final response = await http.get("http://apiuladech.grupodcv.com/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("EvApp"),
          backgroundColor: Colors.red[900],
          centerTitle: true,
        ),
        body: new FutureBuilder<List>(
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
                    builder: (BuildContext context)=> new Detail(list:list , index: i,)
                  //builder: (BuildContext context)=> new Detail(index: i)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nombre']),
                leading: list[i]['class']=='CONCLUIDO' ? Icon(Icons.verified_user,color: Colors.green,) : Icon(Icons.warning,color: Colors.red,),
                subtitle: new Text("Código : ${list[i]['idaluno']}"),
              ),

            ),
          ),
        );
      },
    );
  }
}




