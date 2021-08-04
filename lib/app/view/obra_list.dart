import 'package:flutter/material.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';
import 'package:flutter_adler/obra_list_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ObraList extends StatefulWidget {
  @override
  _ObraListState createState() => _ObraListState();
}

class _ObraListState extends State<ObraList> {
  final _back = ObraListBack();

  CircleAvatar avatar(String url) {
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget editarButton(Function edit) {
    return IconButton(
        onPressed: edit, icon: Icon(Icons.edit), color: Colors.deepOrange);
  }

  Widget remover(BuildContext context, Function remove) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Excluir"),
                  content: Text("Confirma Exclusão?"),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Não")),
                    FlatButton(onPressed: remove, child: Text("Sim")),
                  ],
                ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Obras'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () async{
                  _back.goToForm(context);
                })
          ],
        ),
        body: Observer(
          builder: (context) {
            return FutureBuilder(
                future: _back.list,
                builder: (context, index) {
                  if (!index.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    List<NewObra> _list = index.data;
                    return ListView.builder(
                      padding: const EdgeInsets.all(2.0),
                      itemCount: _list.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: avatar(_list[i].foto),
                          title: Text(
                            _list[i].nome,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            _back.goToDetails(context, _list[i]);
                          },
                          subtitle: Text("Quantidade "+_list[i].quantidade.toString()),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                editarButton(() {
                                  _back.goToForm(context, _list[i]);
                                }),
                                remover(context, () {
                                  _back.remove(_list[i].id);
                                  Navigator.of(context).pop();
                                }),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                });
          },
        ));
  }
}
