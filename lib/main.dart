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
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _infomedia = "Informe suas notas!";

  TextEditingController g1 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  TextEditingController g2 = TextEditingController();
  TextEditingController p2 = TextEditingController();

  void _resetFields() {
    setState(() {
      g1.text = "";
      p1.text = "";
      g2.text = "";
      p2.text = "";
      _infomedia = "Informe suas notas!";
    });
  }

  void _calculate() {
    setState(() {
      double n1 = double.parse(g1.text);
      double pe1 = double.parse(p1.text);
      double n2 = double.parse(g2.text);
      double pe2 = double.parse(p2.text);

      double media = ((n1 * pe1 + n2 * pe2)) / (pe1 + pe2);

      if (media >= 6) {
        _infomedia = "Sua média é ${media.toStringAsPrecision(3)}, parabéns!";
      } else {
        _infomedia =
        "Sua média é ${media.toStringAsPrecision(3)}, vamos para o exame!";
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de Média"),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Divider(),
                  Image.asset(
                      "images/logo.jpeg",
                      height: 120.0,
                      width: 120.0,
                    ),
                  Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Insira a nota do G1",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder()),
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: g1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira a nota da G1";
                      }
                    },
                  ),
                  Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso do G1",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder(),
                        ),
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: p1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira o peso da G1";
                      }
                    },
                  ),
                  Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Insira a nota do G2",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder()),
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: g2,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira a nota da G2";
                      }
                    },
                  ),
                  Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso do G2",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: p2,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira o peso da G2";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            _calculate();
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Text(
                    _infomedia,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  )
                ],
              ),
            )));
  }
}