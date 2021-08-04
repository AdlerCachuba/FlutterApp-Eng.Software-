
final String tableObra = 'TB_OBRA';

class NewObra {

  static final List<String> values = [
    ID, NOME, ATIVO, QUANTIDADE, FOTO,SESSAO
  ];

  static final String ID = '_id';
  static final String NOME = 'nome';
  static final String ATIVO = 'ativo';
  static final String QUANTIDADE = 'quantidade';
  static final String FOTO = 'foto';
  static final String SESSAO = 'sessao';

  final dynamic id;
  String nome;
  String ativo;
  int quantidade;
  String foto;
  String sessao;

  NewObra({
    this.id,
    this.nome,
    this.ativo,
    this.quantidade,
    this.foto,
    this.sessao
  });

  NewObra copy({
    int id,
        String nome,
    String ativo,
    int quantidade,
    String foto,
    String sessao
  })=>NewObra(
    id: id ?? this.id,
    nome : nome ?? this.nome,
    ativo : ativo ?? this.ativo,
    quantidade : quantidade ?? this.quantidade,
      foto : foto ?? this.foto,
    sessao: sessao ?? this.sessao

  );

  static NewObra fromJson(Map<String,Object> json ) => NewObra(
    id : json[ID] as int,
    nome : json[NOME] as String,
    ativo : json [ATIVO] as String,
    quantidade : json[QUANTIDADE] as int,
    foto : json[FOTO] as String,
      sessao : json[SESSAO] as String
      // quando precisar enviar datas para o banco, precisa enviar como String, ex:
    // data: DateTime.parse(json[DATA] as String)
  );

  Map<String, Object> toJson()=> {
    ID : id,
    NOME : nome,
    ATIVO : ativo,
    QUANTIDADE : quantidade,
    FOTO : foto,
    SESSAO : sessao
    //e se tivesse DATA aqui, seria
    // DATA : data.toIso8601String()
  };


}