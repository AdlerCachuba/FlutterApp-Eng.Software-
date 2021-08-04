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
    _launchApp('tel:${obra.sessao}', showModalError);
  }
  lauchMessage(Function (BuildContext context) showModalError){
    _launchApp('sms:${obra.sessao}', showModalError);
  }

  launchWhatsapp() async {
    const url = "https://wa.me/+554498556024?text=Tenho%20interesse%20em%20visitar%20a%20Obra";
    await canLaunch(url) ? launch(url) : print("Não foi possível abrir o WhatsApp");
  }
}