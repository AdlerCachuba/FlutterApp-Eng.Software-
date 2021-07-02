import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_adler/app/database/databaseConnect.dart';
import 'package:mobx/mobx.dart';
import 'app/domain/model/newObra.dart';

part 'obra_list_back.g.dart';

class ObraListBack = _ObraListBack with _$ObraListBack;

abstract class _ObraListBack with Store{
  var _service = DatabaseConnect.instance;

  @observable
  Future<List<NewObra>> list;

  @action
  updateList([dynamic value]){
    list = _service.buscarTodasObras();
  }

  _ObraListBack(){
    updateList();
  }

  goToForm(BuildContext context, [NewObra obra]){
    Navigator.of(context).pushNamed('lista',arguments: obra).then(updateList);
  }

  remove(int id){
    _service.deletarObraPorId(id);
    updateList();
  }

}