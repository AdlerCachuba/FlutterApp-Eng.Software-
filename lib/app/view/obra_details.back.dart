import 'package:flutter/cupertino.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';

class ObraDetailsBack{
  BuildContext context;
  NewObra obra;

  ObraDetailsBack(this.context){
    obra = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }
}