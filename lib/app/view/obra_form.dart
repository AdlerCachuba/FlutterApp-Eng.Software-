import 'package:flutter/material.dart';
import 'package:flutter_adler/app/view/obra_form_back.dart';

class ObraForm extends StatelessWidget {
  const ObraForm({Key key}) : super(key: key);


  Widget fieldName(ObraFormBack back) {
    return TextFormField(
        initialValue: back.obra.nome,
        decoration: InputDecoration(labelText: 'nome:', hintText: 'João da Silva'));
  }

  Widget fieldAtivo(ObraFormBack back) {
    int variavel = 0;
    return ListTile(
      title: const Text('Ativo'),
      leading: Radio(
        value: 1,
        groupValue: variavel,
        onChanged: (value){
/*          back.obra.ativo = value;*/
        },
      ),
    );
  }

  Widget fieldInativo(ObraFormBack back) {
    int variavel = 0;
    return ListTile(
      title: const Text('Ativo'),
      leading: Radio(
        value: 2,
        groupValue: variavel,
        onChanged: (value){
/*          back.obra.ativo = value;*/
        },
      ),
    );
  }

  Widget fieldFoto(ObraFormBack back) {
    return TextFormField(
        initialValue: back.obra.foto,
        decoration: InputDecoration(
            labelText: 'URL',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldQtd(ObraFormBack back) {
    return TextFormField(
      initialValue: back.obra.quantidade as String,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Quantidade:'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ObraFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Obra'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pushNamed('lista');
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              fieldName(_back),
              SizedBox(height: 15),
              fieldAtivo(_back),
              SizedBox(height: 15),
              fieldInativo(_back),
              SizedBox(height: 15),
              fieldQtd(_back),
              SizedBox(height: 15),
              fieldFoto(_back),
            ],
          ),
        ),
      ),
    );
  }
}
