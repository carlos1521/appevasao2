import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listagemalunos.dart';
import 'login.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget{
  List itemJson;
  Home(this.itemJson);


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
              trailing: new Icon(Icons.home),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => Home(widget.itemJson),
              )),
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
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          MyItems(Icons.select_all,"Total de Alunos",0xffed622b),
          MyItems(Icons.insert_chart,"Total Alunos Analisados",0xff19a8ff),
          MyItems(Icons.warning,"Com Risco",0xfff32525),
          MyItems(Icons.check_circle,"Sem Risco",0xff17d100),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
        ],
      ),
      /*new Center(
        child: new Text("App para Deteção e Monitoramento de Alunos com Risco de Evasão", style: new TextStyle(fontSize: 35.0),),
      )*/
  );
}

}

Material MyItems(IconData icon, String heading, int color){
  return Material(
      color:Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(heading,
                          style: TextStyle(
                            color: new Color(color),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Material(
                        color: new Color(color),
                        borderRadius: BorderRadius.circular(24.0),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              icon,
                              color: Colors.white,
                              size: 30.0,
                            )
                        ),
                      )


                    ],
                  )
                ],
              )
          )
      )
  );
}