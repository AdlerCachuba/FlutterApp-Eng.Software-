import 'package:flutter_adler/app/domain/exceptions/domains_layer_exception.dart';
import 'package:flutter_adler/app/domain/interfaces/obra_dao.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';
import 'package:get_it/get_it.dart';


class ObraService{
  var _dao = GetIt.I.get<ObraDao>();

  save(NewObra obra){
    validarNome(obra.nome);
    validarQuantidade(obra.quantidade.toString());
    _dao.save(obra);
  }

  remove(dynamic id){
    _dao.remove(id);
  }

  Future<List<NewObra>> find(){
    return _dao.find();
  }

  validarNome(String nome){
    var min = 3;
    var max = 50;
    if(nome == null){
      throw new DomainLayerException("Nome da Obra é Obrigatório");
    }else if(nome.length < min){
      throw new DomainLayerException("Nome da Obra deve possuir pelo menos $min caracteres.");
    }else if(nome.length > max){
      throw new DomainLayerException("Nome da Obra não deve exceder $max caracteres.");
    }
  }

  validarQuantidade(String quantidade){
    var min = 1;
    var max = 1000;
    if(quantidade == null){
      throw new DomainLayerException("Quantidade é Obrigatório");
    }else if(int.parse(quantidade) < min){
      throw new DomainLayerException("Quantidade deve ser no mínimo $min.");
    }else if(quantidade.length > max){
      throw new DomainLayerException("Quantidade não deve ser maior que $max.");
    }
  }

}