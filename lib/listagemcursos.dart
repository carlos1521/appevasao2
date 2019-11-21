import 'package:flutter/material.dart';
import 'mediasxcurso.dart';


class ListagemCursos extends StatefulWidget {

  @override
  _MediasxcursoState createState() => _MediasxcursoState();
}

class _MediasxcursoState extends State<ListagemCursos> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("EvApp"),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            child: RaisedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mediasxcurso(1)),
                );// 11
              },
              textColor: Colors.black,
              color: Colors.grey[350],
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Administração",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 20
              },
              textColor: Colors.black,
              color: Color(0xFFFFCC00),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Administração Turística",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 3
              },
              textColor: Colors.white,
              color: Color(0xFFA20005),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Contabilidade",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 6
              },
              textColor: Colors.black,
              color: Colors.grey[350],
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Direito",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 34
              },
              textColor: Colors.black,
              color: Color(0xFFFFCC00),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Educação em Ciencias Religiosas",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 7
              },
              textColor: Colors.white,
              color: Color(0xFFA20005),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Educação Inicial",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 5
              },
              textColor: Colors.black,
              color: Colors.grey[350],
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Educação Primaria",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 32
              },
              textColor: Colors.black,
              color: Color(0xFFFFCC00),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Educação Secundaria - Hist",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 31
              },
              textColor: Colors.white,
              color: Color(0xFFA20005),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Educação Secundaria - Lingua",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 30
              },
              textColor: Colors.black,
              color: Colors.grey[350],
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Educação Secundaria - Mat",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 12
              },
              textColor: Colors.black,
              color: Color(0xFFFFCC00),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Enfermagem",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 1
              },
              textColor: Colors.white,
              color: Color(0xFFA20005),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Engenharia Civil",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 9
              },
              textColor: Colors.black,
              color: Colors.grey[350],
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Engenharia de Sistemas",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 8
              },
              textColor: Colors.black,
              color: Color(0xFFFFCC00),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Farmacia e Bioquímica",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 2
              },
              textColor: Colors.white,
              color: Color(0xFFA20005),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Obstetricia",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 10
              },
              textColor: Colors.black,
              color: Colors.grey[350],
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Odontología",
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                // 23
              },
              textColor: Colors.black,
              color: Color(0xFFFFCC00),
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Psicología",
              ),
            ),
          ),
        ],
      )
    );

  }
}



