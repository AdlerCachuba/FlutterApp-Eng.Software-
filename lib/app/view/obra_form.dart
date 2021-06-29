import 'package:flutter/material.dart';
import 'package:flutter_adler/app/database/databaseConnect.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';
import 'package:flutter_adler/app/domain/model/obra.dart';
import 'package:flutter_adler/app/domain/services/obra_service.dart';

// extends State<MyStatefulWidget>
class ObraForm extends StatefulWidget {
  @override
  _ObraFormState createState() => _ObraFormState();
}

class _ObraFormState extends State<ObraForm> {
  final _form = GlobalKey<FormState>();
  var fotoObra = "https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png";

  int variavel,quantidade;

  var nome , ativo,  foto;

  ObraService service = ObraService();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    variavel = 0;
  }

  setSelectRadio(int val){
    setState(() {
      variavel = val;
    });
  }


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
                  salvar();
                  Navigator.of(context).pushNamed('lista');
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      onChanged: (value){
                        nome = value;
                      },
                      decoration: InputDecoration(labelText: 'nome:')),
                  ListTile(
                    title: const Text('Ativo'),
                    leading: Radio(
                      value: 1,
                      groupValue: variavel,
                      onChanged: (value){
                        setSelectRadio(value);
                        _obra.ativo = true;
                        ativo = "ativo";
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Inativo'),
                    leading: Radio(
                      value: 2,
                      groupValue: variavel,
                      onChanged: (value){
                        setSelectRadio(value);
                        _obra.ativo = false;
                        ativo = "falso";
                      },
                    ),
                  ),
                  TextFormField(
                    onChanged: (value){
                      quantidade = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Quantidade:'),
                  ),
                  TextFormField(
                      onChanged: (value){
                        foto = value;
                      },
                      onSaved: (value) => _obra.foto = value,
                      decoration: InputDecoration(labelText: 'Endereço Foto:')),
                ],
              )),
        ));
  }

  Future salvar()async{
    final itens = NewObra(
      nome: nome,
      ativo: ativo,
      quantidade: quantidade,
      foto: foto == null ? foto = fotoObra : foto = null,
    );
    await service.salvar(itens);
  }
}
