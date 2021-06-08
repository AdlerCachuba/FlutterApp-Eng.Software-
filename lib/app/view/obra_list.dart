
import 'package:flutter/material.dart';
import 'package:flutter_adler/app/data/data.dart';
import 'package:flutter_adler/app/model/obra.dart';

class ObraList  extends StatelessWidget {
  var _list = lista;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Obra'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed('form');
                })
          ],
        ),
        body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (_context, indice) {
            Obra obra = _list[indice];
            final avatar = obra.foto.isEmpty  ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(  backgroundImage: NetworkImage(obra.foto));
            return ListTile(
              leading: avatar,
              title: Text(obra.nome),
              subtitle: Text(obra.quantidade.toString()),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.edit), onPressed: null),
                    IconButton(icon: Icon(Icons.delete), onPressed: null),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
