import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerBase = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();

  String _textoResultado = "";
  double _valorArea = 0;

  void _calcularArea() {
    var valorBase = double.tryParse(_controllerBase.text);
    var valorAltura = double.tryParse(_controllerAltura.text);

    if ((valorBase == null || valorAltura == null) ||
        (valorBase <= 0 || valorAltura <= 0)) {
      print(valorBase);
      setState(() {
        _textoResultado =
            "Números inválidos. Digite números inteiros ou reais maiores que 0 (zero).";
      });
    } else {
      _valorArea = ((valorBase * valorAltura) / 2);
      setState(() {
        _textoResultado = ("Área do Triângulo: " + _valorArea.toString());
      });
    }
    _limparCampos();
  }

  void _limparCampos() {
    _controllerBase.text = "";
    _controllerAltura.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Área do Triângulo"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("image/logo.jpg"),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Área do Triângulo Retângulo (Base*Altura)/2",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Qual é o valor da base?",
                  ),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _controllerBase,
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Qual é o valor da altura?"),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _controllerAltura,
                )),
            RaisedButton(
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                padding:
                    EdgeInsets.only(left: 80, right: 80, top: 25, bottom: 25),
                color: Colors.black,
                onPressed: _calcularArea),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                _textoResultado,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(35),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "-> Valor Área:"),
              style: TextStyle(fontSize: 50, color: Colors.black),
            ),
          )
        ],
      ),

*/