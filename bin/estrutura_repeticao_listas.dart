import 'dart:io';

void main(List<String> arguments) {
  var opcao = 0;
  var lista = [];

  while (opcao != 5) {
    print('1- cadastrar na lista');
    print('2- mostrar nomes da lista');
    print('3- remover o primeiro da lista');
    print('5- sair ');
    print('\nDigite sua opcao');

    var opcao = stdin.readLineSync();

    if (opcao == '1') {
      print('Digite o nome a acrescentar na lista');
      var nome = stdin.readLineSync();
      lista.add(nome);
    }
    if (opcao == '2') {
      print('exibindo nomes..');
      lista.forEach((element) {
        print('$element');
      });
    }
    if (opcao == '3') {
      print('deletando o primeiro nome da lista');
      lista.removeAt(0);
    }

    if (opcao == '5') {
      print('saindo do programa..');
      break;
    }
  }
}
