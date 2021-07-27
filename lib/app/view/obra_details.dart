import 'package:flutter/material.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';
import 'package:flutter_adler/app/view/obra_details.back.dart';

class ObraDetails extends StatelessWidget {
  const ObraDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _back = ObraDetailsBack(context);
    NewObra obra = _back.obra;
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      var width = constraints.biggest.width;
      var radius = width/3;
/*      var heigth = constraints.biggest.height;*/
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              (Uri.tryParse(obra.foto).isAbsolute) ?
              CircleAvatar(backgroundImage: NetworkImage(obra.foto),radius: radius,) : CircleAvatar(child: Icon(Icons.person, size: width/2,),radius: radius,),
              Center(child: Text('${obra.nome}',style: TextStyle(fontSize: 25),),),
              Card(child: ListTile(
                title: Text('Quantidade:'),
                subtitle: Text('${obra.quantidade}'),
              ),),
              Card(child: ListTile(
                title: Text('Ativo:'),
                subtitle: Text('${obra.ativo}'),
              ),),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: (){
            _back.goToBack();
          },
        ),
      );
    });
  }
}
