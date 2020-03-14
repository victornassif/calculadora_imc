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
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Info";

  void changeInfo(String txt) {
    setState(() {
      _infoText = txt;
    });
  }

  void _resetFields() {
    heightController.text = "";
    weightController.text = "";
    changeInfo("Informe seus dados");
  }

  void calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);

    String txtclass;

    if (imc < 18.6) {
      txtclass = "Abaixo do peso";
    } else if (imc >= 18.6 && imc < 24.9) {
      txtclass = "Peso Ideal";
    } else if (imc >= 24.9 && imc < 29.9) {
      txtclass = "Levemente acima do Peso";
    } else if (imc >= 29.9 && imc < 34.9) {
      txtclass = "Obesidade Grau I";
    } else if (imc >= 34.9 && imc < 39.9) {
      txtclass = "Obesidade Grau II";
    } else if (imc >= 40.0) {
      txtclass = "Obesidade Grau III";
    }

    String txt = "Seu IMC é: ${imc.toStringAsFixed(2)} ($txtclass)";

    changeInfo(txt);
  }

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
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_outline,
                  color: Colors.green,
                  size: 120.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso(kg)",
                      labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                      )),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),
                  controller: weightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira seu peso";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura(cm)",
                      labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                      )),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),
                  controller: heightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira sua altura";
                    }
                  },
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
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          calculate();
                        }
                      },
                    ),
                  ),
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
