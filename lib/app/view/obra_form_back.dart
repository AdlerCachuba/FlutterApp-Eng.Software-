import 'package:flutter/cupertino.dart';
import 'package:flutter_adler/app/database/databaseConnect.dart';
import 'package:flutter_adler/app/domain/interfaces/obra_dao.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';
import 'package:flutter_adler/app/domain/services/obra_service.dart';
import 'package:get_it/get_it.dart';


class ObraFormBack{

  var _servico = GetIt.I.get<ObraService>();
  var _validacao = ObraService();
  bool _nomeIsValid;
  bool _qtddIsValid;

  NewObra obra;

  bool get isValid => _nomeIsValid && _qtddIsValid;

  ObraFormBack(BuildContext context){
    var parametro = ModalRoute.of(context).settings.arguments;
    obra = (parametro == null) ? NewObra() : parametro;
  }

  save() async{
    await _servico.save(obra);
  }

  String validaNomeObra(String nomeObra){
    try{
      _validacao.validarNome(nomeObra);
      _nomeIsValid = true;
    }catch(e){
      _nomeIsValid = false;
      return e.toString();
    }
  }

  String validaQtdd(String qtdd){
    try{
      _validacao.validarQuantidade(qtdd);
      _qtddIsValid = true;
    }catch(e){
      _qtddIsValid = false;
      return e.toString();
    }
  }

}