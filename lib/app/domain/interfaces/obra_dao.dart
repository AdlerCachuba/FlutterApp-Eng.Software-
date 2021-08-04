import 'package:flutter_adler/app/domain/model/newObra.dart';

abstract class ObraDao{

  save(NewObra obra);

  remove(dynamic id);

  Future<List<NewObra>> find();

}