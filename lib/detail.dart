import 'package:flutter/material.dart';
import './tabs/latab1.dart' as latab1;
import './tabs/latab2.dart' as latab2;
import './tabs/latab3.dart' as latab3;


class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TabController controller;

  /*Future<List> getData() async {
    final response = await http.get("http://192.168.0.14:80/my_store/getdata.php");
    return json.decode(response.body);
  }*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Informação do Aluno"),
          backgroundColor: Colors.red[900],
          centerTitle: true,
          bottom: new TabBar(
              controller: controller,
              tabs: <Tab>[
                new Tab(icon: new Icon(Icons.info),text: 'Informação'),
                new Tab(icon: new Icon(Icons.show_chart),text: 'Estatística'),
                new Tab(icon: new Icon(Icons.format_list_bulleted),text: 'Ações'),
              ]
          ),
        ),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new latab1.Latab1(list: widget.list, index: widget.index),
            new latab2.Latab2(list: widget.list, index: widget.index),
            new latab2.Latab2(list: widget.list, index: widget.index),
          ],
        ),

      ),
    );

  }
}




