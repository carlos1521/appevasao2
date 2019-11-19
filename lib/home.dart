import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listagemalunos.dart';
import 'login.dart';

class Home extends StatefulWidget{
  List itemJson;
  Home(this.itemJson);

  //List datos = json.decode(body);

  //Map<String, dynamic> data = jsonDecode(parsedJson);
  //var String a = '["one", "two", "three", "four"]';
  //var ab = json.decode(body.);
  //print(body.);

  @override
  _Home createState()=> new _Home();
}

class _Home extends State<Home>{
@override
Widget build (BuildContext context){
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("EvApp"), 
      backgroundColor: Color(0xFFA20005),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(widget.itemJson[0]['nome']),
              accountEmail: new Text(widget.itemJson[0]['email']),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("Este é o usuário atual"),
                child: new CircleAvatar(
                  backgroundImage: new AssetImage("images/user-default.png"),
                )
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage("images/backmenu.jpg"),
                ),
              ),
            ),
            new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home)
            ),
            new Divider(),
            new ListTile(
              title: new Text("Listagem Geral"),
              trailing: new Icon(Icons.school),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => ListagemAlunos(),
              )),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Médias por Curso"),
              trailing: new Icon(Icons.multiline_chart)
            ),
            new Divider(),
            new ListTile(
              title: new Text("Sair"),
              trailing: new Icon(Icons.exit_to_app),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => Login(),
              )),
            ),
          ]
          
        )
      ),
      body: new Center(
        child: new Text("App para Deteção e Monitoramento de Alunos com Risco de Evasão", style: new TextStyle(fontSize: 35.0),),
      )
  );
}

}