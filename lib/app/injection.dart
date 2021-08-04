import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_adler/app/database/firestore/obra_dao_firestore.dart';
import 'package:flutter_adler/app/domain/interfaces/obra_dao.dart';
import 'package:flutter_adler/app/domain/services/obra_service.dart';
import 'package:get_it/get_it.dart';

setupInjection()async{
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<ObraDao>(ObraDaoFirestore());
  getIt.registerSingleton<ObraService>(ObraService());
}