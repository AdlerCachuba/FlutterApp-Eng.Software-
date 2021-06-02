import 'package:flutter/material.dart';
import 'package:flutter_adler/app/data/data.dart';
import 'package:flutter_adler/app/model/obra.dart';

class ObraForm extends StatelessWidget{
  final _form = GlobalKey<FormState>();
  bool variavel;
  int _groupValue = -1;

  @override
  Widget build(BuildContext context) {
    Obra _obra = new Obra();
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Obra'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  _form.currentState.save();
                  if (_obra.nome.isNotEmpty) {
                    lista.add(_obra);
                    _obra = Obra();
                  }
                  Navigator.of(context).pushNamed('lista');
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
              key: _form,
              child: Column(
                children:<Widget> [
                  TextFormField(
                      onSaved: (value) => _obra.nome = value,
                      decoration: InputDecoration(labelText: 'nome:')),

                  ListTile(
                    title: const Text('Ativo'),
                    leading: Radio<bool>(
                        value: variavel,
                        groupValue: variavel,

                        onChanged: (value) => _obra.ativo = true),
                  ),
                  ListTile(
                    title: const Text('Inativo'),
                    leading: Radio<bool>(
                        value: variavel,
                        groupValue: variavel ,

                        onChanged: (value) => _obra.ativo = false),
                  ),


                  TextFormField(
                    onSaved: (value) => _obra.quantidade = int.parse(value),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Quantidade:'),
                  ),
                  TextFormField(
                      onSaved: (value) => _obra.foto = value,
                      decoration: InputDecoration(labelText: 'Endereço Foto:')),
                ],
              )),
        ));
  }

  

}
