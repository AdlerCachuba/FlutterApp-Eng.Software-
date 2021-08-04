import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_adler/app/database/databaseConnect.dart';
import 'package:flutter_adler/app/domain/services/obra_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'app/MyApp.dart';
import 'app/domain/model/newObra.dart';

part 'obra_list_back.g.dart';

class ObraListBack = _ObraListBack with _$ObraListBack;

abstract class _ObraListBack with Store{
  var _service = GetIt.I.get<ObraService>();

  @observable
  Future<List<NewObra>> list;

  @action
  updateList([dynamic value]){
    list = _service.find();
  }

  _ObraListBack(){
    updateList();
  }

  goToDetails(BuildContext context, NewObra obra){
    Navigator.of(context).pushNamed(MyApp.OBRA_DETAILS,arguments: obra);
  }

  goToForm(BuildContext context, [NewObra obra]){
    Navigator.of(context).pushNamed(MyApp.OBRA_FORM,arguments: obra).then(updateList);
  }

  remove(dynamic id){
    _service.remove(id);
    updateList();
  }

}