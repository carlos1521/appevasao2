import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import './home.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'homealuno.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

String username='';
class _LoginState extends State<Login> {

  TextEditingController controllerUsuario = new TextEditingController();
  TextEditingController controllerSenha = new TextEditingController();

  String msg='';

  Future loginUser() async {
    var url="http://apiuladech.grupodcv.com/login.php?usuario=${controllerUsuario.text}&senha=${controllerSenha.text}";
    final response = await http.post(url);
    //return json.decode(response.body);
    //var parsedJson = json.decode(response.body);
    //Map<String, dynamic> itemJson = parsedJson;

    if(response.body=='Login nao autorizado'){
      //return print("ERROR LOGIN");
      return Alert(
        context: context,
        type: AlertType.error,
        title: "Acesso Denegado",
        desc: "O nome de usuário ou a senha sao incorretos. Pode tentar outra vez",
        buttons: [
          DialogButton(
            child: Text(
              "Fechar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }else{
      //return print(response.body);
      return Navigator.push(
          context, MaterialPageRoute(
        builder: jsonDecode(response.body)[0]['nivel']=='Aluno'? (context)=> Homealuno(jsonDecode(response.body)) : (context)=> Home(jsonDecode(response.body)),
      )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("images/logoerp.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerUsuario,
              decoration: InputDecoration(
                hintText: 'Usuário'
              ),           
            ),
            SizedBox(
              height: 10,
            ),
            TextField(  
              controller: controllerSenha,
              obscureText: true,                
              decoration: InputDecoration(
                hintText: 'Sehna'
              ),                
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFA20005),
                    Color(0xFFFFCC00),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onPressed: () {
                   loginUser();
                  },
                ),
              ),
            ),         
          ],
        ),
      ),
    );
  }
}