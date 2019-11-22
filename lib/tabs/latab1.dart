import 'package:flutter/material.dart';
import '../home.dart';
import 'package:http/http.dart' as http;


class Latab1 extends StatefulWidget {
  List list;
  int index;
  Latab1({this.index,this.list});
  @override
  _Latab1State createState() => new _Latab1State();
}
class MyItem {
  MyItem({ this.isExpanded: false, this.header, this.body });
  bool isExpanded;
  final String header;
  final String body;
}


class _Latab1State extends State<Latab1> {

  List<MyItem> _items = <MyItem>[
    MyItem( header: 'header', body: 'body' ),
  ];

  void deleteData() {
    var url = "http://apiuladech.grupodcv.com/getdata.php";
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
      Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB( 100, 0, 0, 0 ),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all( 20.0 ),
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only( top: 30.0 ), ),
                      new Text( widget.list[widget.index]['nombre'],
                        style: new TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold ), ),
                      new Text(
                        "Matrícula : ${widget.list[widget.index]['idaluno']}",
                        style: new TextStyle( fontSize: 18.0 ), ),
                      new Text( "Curso : ${widget.list[widget
                          .index]['cursograduacao']}",
                        style: new TextStyle( fontSize: 18.0 ), ),
                      new Text( "Idade : ${widget.list[widget.index]['idade']}",
                        style: new TextStyle( fontSize: 18.0 ), ),
                      new Text( "Periodo Ingresso : ${widget.list[widget
                          .index]['periodoingresso']}",
                        style: new TextStyle( fontSize: 18.0 ), ),
                      new Padding(
                        padding: const EdgeInsets.only( top: 30.0 ), ),
                      new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new RaisedButton(
                            child: widget.list[widget.index]['class'] ==
                                'CONCLUIDO' ? Text( "Perfil Normal" ) : Text(
                                "Risco de Evasão" ),
                            color: widget.list[widget.index]['class'] ==
                                'CONCLUIDO' ? Colors.green : Colors.red,
                            onPressed: () =>
                                Navigator.of( context ).push(
                                    new MaterialPageRoute(
                                      /*builder: (
                                          BuildContext context) => new EditData(
                                        list: widget.list,
                                        index: widget.index, ),*/
                                    )
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(

              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ExpansionTile(
                    leading: Icon( Icons.school ),
                    title: Text( 'Ver Rendimento Académico' ),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                              "Nota Exame Admissão: ${widget.list[widget
                                  .index]['notaexameadmissao']}" )
                      ),
                      ListTile(
                        title: Text( "Total Níveis Curso: ${widget.list[widget
                            .index]['totalniveiscurso']}" ),
                      ),
                      ListTile(
                        title: Text( "Total Creditos Curso: ${widget.list[widget
                            .index]['totalcreditoscurso']}" ),
                      ),
                      ListTile(
                        title: Text(
                            "Total Níveis Cursados: ${widget.list[widget
                                .index]['totalniveiscursados']}" ),
                      ),
                      ListTile(
                        title: Text( "% Níveis Cursados: ${widget.list[widget
                            .index]['porcentagemniveiscursados']}" ),
                      ),
                      ListTile(
                        title: Text(
                            "Total Creditos Cursados: ${widget.list[widget
                                .index]['totalcreditoscursados']}" ),
                      ),
                      ListTile(
                        title: Text( "% Creditos Cursados: ${widget.list[widget
                            .index]['porcentagemcreditoscursados']}" ),
                      ),
                      ListTile(
                        title: Text(
                            "Periodo Ultíma Matricula: ${widget.list[widget
                                .index]['periodoultimamatricula']}" ),
                      ),
                      ListTile(
                        title: Text(
                            "Ultimo Nivel Estudado: ${widget.list[widget
                                .index]['ultimonivelestudado']}" ),
                      ),
                      ListTile(
                        title: Text( "Média Ultimo Periodo: ${widget.list[widget
                            .index]['promedioultimoperiodo']}" ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon( Icons.monetization_on ),
                    title: Text( 'Ver Situação Socio-económica' ),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                              "Sexo: ${widget.list[widget.index]['sexo']}" )
                      ),
                      ListTile(
                        title: Text( "Moradia: ${widget.list[widget
                            .index]['moradia']}" ),
                      ),
                      ListTile(
                        title: Text( "Trabalha: ${widget.list[widget
                            .index]['trabalha']}" ),
                      ),
                      ListTile(
                        title: Text( "Estado Civil: ${widget.list[widget
                            .index]['estadocivil']}" ),
                      ),
                      ListTile(
                        title: Text(
                            "Escola: ${widget.list[widget.index]['escola']}" ),
                      ),
                      ListTile(
                        title: Text( "Religiao: ${widget.list[widget
                            .index]['religiao']}" ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ] ),
      /*floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new AddData(),
            )
        ),
      ),*/
      /*floatingActionButton: SpeedDial(
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
      ),*/
    );
  }
}
