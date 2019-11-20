import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mystore/estrategias/orientacaopedagogica.dart';
import '../editdata.dart';
import '../home.dart';
import 'package:http/http.dart' as http;



class Latab3 extends StatefulWidget {
  List list;
  int index;
  Latab3({this.index,this.list});
  @override
  _Latab3State createState() => new _Latab3State();
}

class _Latab3State extends State<Latab3> {

  Future<List> getData() async {
    final response = await http.get("http://apiuladech.grupodcv.com/getestrategiaxaluno.php?idaluno=${widget.list[widget.index]['idaluno']}");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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


      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.red[900],
        children: [
          SpeedDialChild(
            child: Icon( Icons.create ),
            backgroundColor: Colors.yellow[700],
            label: "Orientacao Pedagogica",
            onTap: () =>
                Navigator.of( context ).push(
                    new MaterialPageRoute(
                      builder: (
                          BuildContext context) => new OrientacaoPedagogica( ),
                    )
                ),
          ),
          SpeedDialChild(
              child: Icon( Icons.speaker_notes ),
              backgroundColor: Colors.yellow[700],
              label: "Conversa com Aluno",
              onTap: () => print( "first...." )
          ),
          SpeedDialChild(
              child: Icon( Icons.book ),
              backgroundColor: Colors.yellow[700],
              label: "Sugerir Material Apoio",
              onTap: () => print( "first...." )
          ),
          SpeedDialChild(
              child: Icon( Icons.thumbs_up_down ),
              backgroundColor: Colors.yellow[700],
              label: "Tutoría",
              onTap: () => print( "first...." )
          )
        ],
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
                    //builder: (BuildContext context)=> new Detail(list:list , index: i,)
                  //builder: (BuildContext context)=> new Detail(index: i)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['tipoestrategia']),
                //leading: list[i]['tipoestrategia']=='ORIENTACAO PEDAGOGICA' ? Icon(Icons.school,color: Colors.blueAccent,) : Icon(Icons.collections_bookmark,color: Colors.blueAccent,),
                leading: Icon(Icons.directions_run,color: Colors.blueAccent,),
                subtitle: new Text("Código : ${list[i]['datainicio']}"),
              ),

            ),
          ),
        );
      },
    );
  }
}