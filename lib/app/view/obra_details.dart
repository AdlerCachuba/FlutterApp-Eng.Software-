import 'package:flutter/material.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';
import 'package:flutter_adler/app/view/obra_details.back.dart';

class ObraDetails extends StatelessWidget {
  const ObraDetails({Key key}) : super(key: key);

  showModalError(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Alerta!"),
            content: Text("Não foi possível encontrar um APP compatível"),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ObraDetailsBack(context);
    NewObra obra = _back.obra;
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      var width = constraints.biggest.width;
      var radius = width/3;
      var heigth = constraints.biggest.height;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: ListView(
            children: [
              (Uri.tryParse(obra.foto).isAbsolute) ?
              CircleAvatar(backgroundImage: NetworkImage(obra.foto),radius: radius,) : CircleAvatar(child: Icon(Icons.person, size: width/2,),radius: radius,),
              SizedBox(height: 10,),
              Center(child: Text('${obra.nome}',style: TextStyle(fontSize: 25),),),
              Card(child: ListTile(
                title: Text('Agendar visita:'),
                subtitle: Text('(11) 3423 - 1100',style: TextStyle(fontSize: 12),),
                trailing: Container(
                  width: width / 4,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            _back.launchWhatsapp();
                          },
                          icon: Icon(
                            Icons.whatshot_sharp,
                            color: Colors.blue,
                          )),
                      IconButton(
                          onPressed: () {
                            _back.lauchPhone(showModalError);
                          },
                          icon: Icon(
                            Icons.phone,
                            color: Colors.blue,
                          ))
                    ],
                  ),
                ),
              ),),
              Card(child: ListTile(
                title: Text('Sessão da Obra:'),
                subtitle: Text('${obra.sessao}'),
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
