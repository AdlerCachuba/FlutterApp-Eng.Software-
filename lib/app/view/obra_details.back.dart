import 'package:flutter/cupertino.dart';
import 'package:flutter_adler/app/domain/model/newObra.dart';
import 'package:url_launcher/url_launcher.dart';

class ObraDetailsBack{
  BuildContext context;
  NewObra obra;

  ObraDetailsBack(this.context){
    obra = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function (BuildContext context) showModalError) async {
    await canLaunch(url) ? launch(url) : showModalError(context);
  }

  lauchPhone(Function (BuildContext context) showModalError){
    _launchApp('tel:${obra.contato}', showModalError);
  }
  lauchMessage(Function (BuildContext context) showModalError){
    _launchApp('sms:${obra.contato}', showModalError);
  }
}