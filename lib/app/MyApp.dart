import 'package:flutter/material.dart';
import 'package:flutter_adler/app/view/my_home_page.dart';
import 'package:flutter_adler/app/view/obra_details.dart';
import 'package:flutter_adler/app/view/obra_form.dart';
import 'package:flutter_adler/app/view/obra_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const OBRA_LISTA = 'lista';
  static const OBRA_DETAILS = 'obra-details';
  static const OBRA_FORM = 'obra-form';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        backgroundColor: Colors.black12
      ),
      routes: {
        HOME: (context) => MyHomePage(),
        OBRA_LISTA: (context) => ObraList(),
        OBRA_FORM: (context) => ObraForm(),
        OBRA_DETAILS: (context)=> ObraDetails()
      },
    );
  }
}