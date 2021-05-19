import 'package:adler_flutter/adler_flutter.dart' as adler_flutter;
import 'dart:io';

void main(List<String> arguments) {
  print('digite seu nome');

  String nome = stdin.readLineSync();

  print('Digite sua idade:');
  String entradaIdade = stdin.readLineSync();

  var idade = int.parse(entradaIdade);

  print('Informe o seu salário');
  String entradaSalario = stdin.readLineSync();

  double salario = double.parse(entradaSalario);

  print('Seu nome é $nome, sua idade é $idade e seu salário é $salario');

  if (salario < 1000) {
    print(
        'Seu salário é menos de 1000,você precisa achar mais jeitos de ganhar dinheiro');
  } else if (salario >= 1000 && salario <= 5000) {
    print('O seu salário é de 1000 até 5000, parabéns.');
  } else {
    print('Você ganha mais de 5000 ! parabéns !  ');
  }
}
