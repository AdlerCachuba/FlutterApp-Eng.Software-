import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_adler/app/domain/interfaces/obra_dao.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';

class ObraDaoFirestore implements ObraDao{
  CollectionReference obraCollection;

  ObraDaoFirestore() {
    obraCollection = FirebaseFirestore.instance.collection('obraSecao');
  }

  @override
  Future<List<NewObra>> find() async{
    var result = await obraCollection.get();
    return result.docs
        .map((e) => NewObra(
      id: e.reference.id.toString(),
      nome: e['nome'],
      ativo: e['ativo'],
      quantidade: e['quantidade'],
      foto: e['foto'],
      sessao: e['contato'],
    )).toList();
  }

  @override
  remove(id) {
    obraCollection.doc(id).delete();
  }

  @override
  save(NewObra obra) {
    obraCollection.doc(obra.id).set({
      'nome': obra.nome,
      'ativo': obra.ativo,
      'quantidade': obra.quantidade,
      'foto': obra.foto,
      'contato': obra.sessao,
    });
  }

}