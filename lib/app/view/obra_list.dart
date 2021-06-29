import 'package:flutter/material.dart';
import 'package:flutter_adler/app/database/databaseConnect.dart';

class ObraList  extends StatefulWidget {
  @override
  _ObraListState createState() => _ObraListState();
}

class _ObraListState extends State<ObraList> {
  var _list = [];

  Future trazerLista() async{
    var retorno  = await DatabaseConnect.instance.buscarTodasObras();
    setState(() {
      _list = retorno;
    });
  }
  @override
  void initState() {
    trazerLista();
    super.initState();
  }

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
          itemBuilder: (context, i) {
            final avatar = _list[i].foto.isEmpty  ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(  backgroundImage: NetworkImage(_list[i].foto));
            return ListTile(
              leading: avatar,
              title: Text(_list[i].nome),
              subtitle: Text(_list[i].quantidade.toString()),
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
