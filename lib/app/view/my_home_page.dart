import 'package:flutter/material.dart';
import 'package:flutter_adler/app/MyApp.dart';
import 'package:flutter_adler/controle_main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Widget botaoTela(String label,BuildContext context, String rota) {
  return Container(
    height: 50,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.deepOrange,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: SizedBox.expand(
      child: FlatButton(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(rota);
        },
      ),
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Museu Gengar'),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/img/gengar.png'),
            ),
            SizedBox(height: 30),
            Container(
              child: Center(
                child: Text(
                  'Lista de Obras',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontSize: 26),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  botaoTela('Criar Obra',context, 'obra-form'),
                  SizedBox(height: 15,),
                  botaoTela('Ver Obras',context, 'lista'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
