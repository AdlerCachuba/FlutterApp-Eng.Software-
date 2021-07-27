import 'package:flutter/material.dart';
import 'package:flutter_adler/app/view/my_home_page.dart';
import 'package:flutter_adler/app/view/obra_details.dart';
import 'package:flutter_adler/app/view/obra_form.dart';
import 'package:flutter_adler/app/view/obra_list.dart';

class Definition extends StatelessWidget {
  static const OBRA_DETAILS = 'obra-details';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => ObraList(),
        'lista': (_) => ObraList(),
        'form': (_) => ObraForm(),
        OBRA_DETAILS: (context)=> ObraDetails()
      },
    );
  }
}