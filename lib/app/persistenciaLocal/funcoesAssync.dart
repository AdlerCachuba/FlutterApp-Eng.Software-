void main () {
  realizarLogin();
}
String jsonDadosUsuario = "";

//1. Busca um usuário usando como parametro o login e a senha.
Future<String> getUsuario(String login, String senha) async {
  print("Buscando usuário...");
  // Requisição ao servidor para saber se o usuário existe
  await Future.delayed(Duration(milliseconds: 2000));
  String usuario = "Adler Mateus";
  return usuario;
}

//2. Busca mais informações do usuário para exibir.
Future<void> getDados(String usuario) async {
  print("Buscando mais informações do $usuario...");
  //Executa algumas consultas no banco para retornar os dados
  await Future.delayed(Duration(milliseconds: 3000));
  jsonDadosUsuario = '{"id":1, "email":"adler@gmail.com.br"}';
}

//3. Realização de login.
Future<void> realizarLogin() async {
  //Aguarda a função que fará contato para retornar o nome do usuário
  String nomeUsuario = await getUsuario("Adler Mateus", "123");
  if (nomeUsuario == "") {
    print("Usuário não encontrado!");
  } else {
    getDados(nomeUsuario).then((value) {
      print("Abrindo tela inicial...");
    });
  }
}