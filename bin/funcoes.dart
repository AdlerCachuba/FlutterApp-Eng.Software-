import 'package:adler_flutter/adler_flutter.dart' as adler_flutter;
import 'dart:io';

//(1) uma função com parâmetro e sem retorno;
// Função responsável por imprimir definições sobre o salário
// para verificar se o cliente está apto a receber o crédito promocional.
void imprimirCredito(double salario) {
  if (salario < 1000) {
    print(
        'Seu salário é menos de 1000,você precisa ter um salário maior para poder ter esse crédito.');
  } else if (salario >= 1000 && salario <= 5000) {
    print(
        'O seu salário é de 1000 até 5000, parabéns o crédito está disponível para você.');
  } else {
    print(
        'Você ganha mais de 5000 ! parabéns ! Você tem direito ao crédito promocional especial.');
  }
}

//(2) uma função com parâmetro e com retorno;
// Função de boas vindas ao usuário, apresentando a meensagem de boas vindas
// com seu nome na tela
String boasVindas(String nome) {
  String resultado =
      "Olá, bem vindo $nome ao sistema de cadastro de Crédito Dart 0.1";
  return resultado;
}

//(3) uma função sem parâmetro e sem retorno;
// Função de impressão de mensagem.
void aviso() {
  print("Iremos fazer algumas perguntas para você,");
  print("Para sabermos se seu salário é compátivel para receber nosso crédito");
}

//(4) uma função sem parâmetro e sem retorno
//Função de impressão de agradecimento ao final do programa.
void agradecimento() {
  print("Obrigado por usar nosso programa Dart 0.1, até a próxima.");
}

// (5) três funções com parâmetros nomeados

// Uma função que recebe o nome, idade, e se o usuário já é aposentado.
// O aposentado pode ser passado ou não como parametro
verificaIdadeAposentadoria({String nome, int idade, bool aposentado}) {
  if (idade < 18) {
    print('Mas na verdade você não idade para pedir crédito.');
  } else {
    print('Você tem idade para pedir crédito');
    if (aposentado = true) {
      print('Aposentadoria está correta');
    } else {
      print('Então você não é aposentado.. hmm..');
    }
  }
}

//Função que recebe como parametro o salario, idade, imovel, carro, e imprime na tela
// se o cliente está disponivel para ter um credito especial
calculaScore2({double salario, double idade, bool imovel, bool carro}) {
  if (imovel == true && carro == true && salario >= 5000 && idade >= 18) {
    print('Você tem direito a ter nosso crédito premium platinum');
  } else if (carro == false &&
      imovel == true &&
      salario >= 5000 &&
      idade >= 18) {
    print(
        'Você está quase com direito a nosso crédito, só falta ter um carro no nome');
  } else {
    print(
        'Sem imóvel, carro, sem ser maior ou igual a 18 anos, e sem um salário abaixo de 5000, você nãotem direito a nosso crédito premium platinum');
  }
}

// Realiza a arrow function para realizar o cálculo do Score, adicionado os valores da lista,
// e depois dividindo pelo salário atual
colocaSalarioDobrado({List salariosValores, double salario}) {
  double total;
  salariosValores.forEach((salarioDaLista) => total += salarioDaLista);
  total = total / salario;
  print(
      'A soma do seu menor salário com a do último salário, dividido pelo salário atual dará o seu SCORE');
  print('Seu score é de: $total ');
}

void main(List<String> arguments) {
  //(6) três exemplos de funções anônimas
  //  Recebe como parametro n1 e n2 e imprime a soma
  int n1 = 3;
  int n2 = 2;
  print((int n1, int n2) => n1 + n2);

  //  Outra maneira para imprimir a soma usando uma função anonima
  print((int n1, int n2) {
    return n1 + n2;
  });

  // Recebe como parametro 1 numero e imprime se ele é par ou impar
  print((n1) {
    if (n1 % 2 == 0) {
      print("O numero é par");
    } else {
      print("O numero é impar");
    }
  });

  // Recebe um número e imprime se ele é positivo ou negativo ou igual a 0
  print((n1) {
    if (n1 > 0) {
      print('n1 é maior que 0');
    } else if (n1 == 0) {
      print('n1 é igual a 0');
    } else {
      print('n1 é menor que 0');
    }
  });

// Daqui pra baixo são códigos que eu usei para testar
// e aprender mais como as funções funcionavam

  print('\nDigite seu nome');
  String nome = stdin.readLineSync();

  print(boasVindas(nome));
  aviso();

  print('\nDigite sua idade:');
  String entradaIdade = stdin.readLineSync();
  var idade = int.parse(entradaIdade);

  bool aposentado;
  print('\nVocê é aposentado? digite sim ou nao');
  String entradaAposentado = stdin.readLineSync();
  if (entradaAposentado == "sim") {
    aposentado = true;
  } else {
    aposentado = false;
  }

  verificaIdadeAposentadoria(aposentado: aposentado, nome: nome, idade: idade);

  print('\nInforme o seu salário atual');
  String entradaSalario = stdin.readLineSync();
  double salario = double.parse(entradaSalario);

  print(
      '\nInforme o valor do menor salario que já recebeu e do maior que já recebeu');
  print('Qual o menor valor salarial que já recebeu?');
  List salarioValores = new List();
  String entradaMenorValor = stdin.readLineSync();
  double salarioMenor = double.parse(entradaMenorValor);
  salarioValores.add(salarioMenor);

  print('\n E qual o maior valor salarial que já recebeu?');
  String entradaMaiorValor = stdin.readLineSync();
  double salarioMaior = double.parse(entradaMaiorValor);
  salarioValores.add(salarioMaior);

  imprimirCredito(salario);
}
