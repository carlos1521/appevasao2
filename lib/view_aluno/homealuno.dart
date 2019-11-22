import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/view_aluno/listagemacoes.dart';
import '../login.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Homealuno extends StatefulWidget{
  List itemJson;
  Homealuno(this.itemJson);


  @override
  _Homealuno createState()=> new _Homealuno();
}

class _Homealuno extends State<Homealuno>{
  bool selected = false;

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
                        backgroundImage: new AssetImage(widget.itemJson[0]['foto']),
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
                    builder: (BuildContext context) => Homealuno(widget.itemJson),
                  )),
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Ações Cadastradas"),
                  trailing: new Icon(Icons.school),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Listagemacoes(widget.itemJson),
                  )),
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
      body:
      GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 200.0 : 150.0,
            height: selected ? 150.0 : 200.0,
            color: selected ? Colors.red[900] : Colors.blue[900],
            alignment:
            selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: Text(
              "Bem-vindo ${widget.itemJson[0]['nome']}", style: new TextStyle( color: Colors.white , fontSize: 20.0), ),
          ),
        ),
      ),
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