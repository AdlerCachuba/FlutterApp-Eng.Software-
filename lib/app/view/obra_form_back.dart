import 'package:flutter/cupertino.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';
import 'package:mobx/mobx.dart';

part 'obra_form_back.g.dart';

class ObraFormBack = _ObraFormBack with _$ObraFormBack;

abstract class _ObraFormBack with Store{

  NewObra obra;

  _ObraFormBack(BuildContext context){
    var parametro = ModalRoute.of(context).settings.arguments;
    obra = (parametro == null) ? NewObra() : parametro;
  }


}