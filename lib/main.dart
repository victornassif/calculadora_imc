import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IMC Calculator",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              color: Colors.green,
              size: 120.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso(kg)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 15.0,
                  )),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura(cm)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 15.0,
                  )),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Text(
              "Info",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
