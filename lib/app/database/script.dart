// Persistência local, definição do script do banco de dados da obra.

final createTable = '''
CREATE TABLE obra(
id INT NOT NULL PRIMARY KEY
,nome VARCHAR(200) NOT NULL
,quantidade VARCHAR(200) NOT NULL
,url_avatar VARCHAR(300) NOT NULL
,ativo BOOLEAN NOT NULL
''';


final insert1 = '''
INSERT INTO obra(nome,quantidade,url_avatar,ativo)VALUES(
'Mona Lisa',1,https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png,true)
''';

final insert2 = '''
INSERT INTO obra(nome,quantidade,url_avatar,ativo)VALUES(
'Picasso',1,https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png,true)
''';
