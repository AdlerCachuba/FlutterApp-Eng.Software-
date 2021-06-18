import 'package:flutter_adler/app/model/newObra.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnect{

  static final DatabaseConnect instance = DatabaseConnect._init();

  static Database _databaseConnect;
  DatabaseConnect._init();

  Future<Database> get criaBancoDados async {
    if(_databaseConnect != null) return _databaseConnect;

    _databaseConnect = await _initDB('bancoLocal.db');
    return _databaseConnect;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path, version : 1, onCreate: _createDB);
  }

  Future _createDB(Database db,int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final intType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final varType = 'VARCHAR(255) NOT NULL';
    final varFKType = 'INTEGER';

  //Tabela Obra
    await db.execute('''
    CREATE TABLE $tableObra(
    ${NewObra.ID} $idType, 
     ${NewObra.NOME} $textType, 
      ${NewObra.ATIVO} $textType, 
       ${NewObra.QUANTIDADE} $varFKType, 
        ${NewObra.FOTO} $textType
    )
    ''');
  }

  //Métodos Tabela Obra
  Future<NewObra> inserirDadosTabelaObra(NewObra obra) async {
    final db = await instance.criaBancoDados;
    final id = await db.insert(tableObra, obra.toJson());

    if (id > 0) {
      print("Cadastro na tabela Obra com Sucesso! Id $id");
    } else {
      print("Erro ao cadastrar na tabela Obra");
    }
    return obra.copy(id: id);
  }

  Future<NewObra> buscarPorIdObra(int id) async {
    final db = await instance.criaBancoDados;
    final maps = await db.query(
      tableObra,
      columns: NewObra.values,
      // Obs não é seguro passar o ID no final do where para evitar SqlInject
      where: '${NewObra.ID} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return NewObra.fromJson(maps.first);
    } else {
      throw Exception('ID $id não encontrado');
    }
  }

  Future<List<NewObra>> buscarTodasObras() async {
    final db = await instance.criaBancoDados;
    final orderBy = '${NewObra.ID} ASC';
    final result = await db.query(tableObra, orderBy: orderBy);
    return result.map((json) => NewObra.fromJson(json)).toList();
  }

  Future<int> atualizarObraPorId(NewObra ac) async {
    final db = await instance.criaBancoDados;

    return db.update(
      tableObra,
      ac.toJson(),
      where: '${NewObra.ID} = ?',
      whereArgs: [ac.id],
    );
  }

  Future<int> deletarObraPorId(int id) async {
    final db = await instance.criaBancoDados;
    return db.delete(
      tableObra,
      where: '${NewObra.ID} = ?',
      whereArgs: [id],
    );
  }

//Fim metodo Acess Acesso


}