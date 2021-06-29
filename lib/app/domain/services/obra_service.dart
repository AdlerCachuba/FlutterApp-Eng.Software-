import 'package:flutter_adler/app/database/databaseConnect.dart';
import 'package:flutter_adler/app/domain/exceptions/domains_layer_exception.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';


class ObraService{
  var _dao = DatabaseConnect.instance;

  salvar(NewObra obra){
    validarNome(obra.nome);
    validarQuantidade(obra.quantidade);
    _dao.inserirDadosTabelaObra(obra);
  }

  deleteObra(int id){
    _dao.deletarObraPorId(id);
  }

  Future<List<NewObra>> buscarTodasPessoas(){
    return _dao.buscarTodasObras();
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

  validarQuantidade(int quantidade){
    var min = 3;
    var max = 1000;
    if(quantidade == null){
      throw new DomainLayerException("Quantidade é Obrigatório");
    }else if(quantidade < min){
      throw new DomainLayerException("Quantidade deve ser no mínimo $min.");
    }else if(quantidade > max){
      throw new DomainLayerException("Quantidade não deve ser maior que $max.");
    }
  }

}