import 'package:flutter/material.dart';
import 'package:flutter_adler/app/MyApp.dart';
import 'package:flutter_adler/app/view/obra_form_back.dart';

class ObraForm extends StatefulWidget {
  ObraForm({Key key}) : super(key: key);

  @override
  _ObraFormState createState() => _ObraFormState();
}

String valorAtivo;
String valorSessao;
List<String> listaAtivo = ['Ativo', 'Inativo'];
List<String> listaSecao = ['Quadros', 'Moedas raras','Estátuas'];
ObraFormBack back;
int variavel = int.parse(back.obra.ativo);

class _ObraFormState extends State<ObraForm> {
  final _form = GlobalKey<FormState>();

  Widget fieldName(ObraFormBack back) {
    return TextFormField(
        validator: back.validaNomeObra,
        style: const TextStyle(color: Colors.deepOrange),
        onSaved: (nv) => back.obra.nome = nv,
        initialValue: back.obra.nome,
        decoration: InputDecoration(
            labelText: 'Nome',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldAtivo(ObraFormBack back) {
    return DropdownButtonFormField<String>(
      value: valorAtivo,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepOrange),
      onChanged: (String newValue) {
        setState(() {
          valorAtivo = newValue;
        });
      },onSaved: (nv) => back.obra.ativo = nv,
      decoration: InputDecoration(
        labelText: 'Ativo / Inativo',
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      items: listaAtivo
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget fieldSecao(ObraFormBack back) {
    return DropdownButtonFormField<String>(
      value: valorSessao,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepOrange),
      onChanged: (String newValue) {
        setState(() {
          valorSessao = newValue;
        });
      },onSaved: (nv) => back.obra.sessao = nv,
      decoration: InputDecoration(
        labelText: 'Sessão',
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      items: listaSecao
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget fieldFoto(ObraFormBack back) {
    return TextFormField(
        initialValue: back.obra.foto,
        style: const TextStyle(color: Colors.deepOrange),
        onSaved: (nv) => back.obra.foto = nv,
        decoration: InputDecoration(
            labelText: 'URL Foto',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldQtd(ObraFormBack back) {
    return TextFormField(
        validator: back.validaQtdd,
        style: const TextStyle(color: Colors.deepOrange),
        onSaved: (nv) => back.obra.quantidade = int.parse(nv),
        initialValue:
            back.obra.quantidade == null ? "" : back.obra.quantidade.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Quantidade',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget botaoSalvar(ObraFormBack _back){
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          _form.currentState.validate();
          _form.currentState.save();
          if (_back.isValid) {
            _back.save();
            Navigator.of(context).pushNamed(MyApp.OBRA_LISTA);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.save),
            Padding(padding: EdgeInsets.all(16),
              child: Text("Salvar", style: TextStyle(fontSize: 20),),
            )],
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    var _back = ObraFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Obra'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                fieldName(_back),
                SizedBox(height: 15),
                fieldAtivo(_back),
                SizedBox(height: 15),
                fieldSecao(_back),
                SizedBox(height: 15),
                fieldQtd(_back),
                SizedBox(height: 15),
                fieldFoto(_back),
                botaoSalvar(_back),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
