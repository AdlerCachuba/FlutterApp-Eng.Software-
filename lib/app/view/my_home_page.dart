import 'package:flutter/material.dart';
import 'package:flutter_adler/controle_main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatelessWidget {
  final controle = ControleMain();

  @override
  Widget build(BuildContext context) {
    print('construiu o home');
    return Scaffold(
      appBar: AppBar(
        title: Text('Aula Flutter'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('form');
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times',
            ),
            Observer(builder: (context){
              return Text(
                '${controle.contador}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controle.adicionar(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
