CREATE TABLE usuarios(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    pontos INT NOT NULL
);

CREATE TABLE personas(
    id TEXT PRIMARY KEY NOT NULL, 
    nome TEXT NOT NULL, 
    sexo char CHECK( sexo == 'f' OR sexo == 'm' ) NOT NULL, 
    cor_cabelo TEXT NOT NULL, 
    etnia TEXT NOT NULL, 
    cor_olhos TEXT NOT NULL, 
    acessorio TEXT NOT NULL
);

INSERT INTO personas (id, nome, sexo, cor_cabelo, etnia, cor_olhos, acessorio) 
VALUES 
    ('1',  'luiza',      'f', 'preto',    'branca',   'pretos',    'oculos'),
    ('2',  'carolina',   'f', 'castanho', 'parda',    'castanhos', 'brinco'),
    ('3',  'debora',     'f', 'louro',    'negra',    'verdes',    'chapeu'),
    ('4',  'tatiana',    'f', 'ruivo',    'indigena', 'azuis',     'piercing'),
    ('5',  'fatima',     'f', 'preto',    'parda',    'castanhos', 'piercing'),
    ('6',  'cecilia',    'f', 'castanho', 'branca',   'verdes',    'oculos'),
    ('7',  'alessandra', 'f', 'louro',    'branca',   'azuis',     'brinco'),
    ('8',  'andreia',    'f', 'ruivo',    'negra',    'pretos',    'chapeu'),
    ('9',  'renato',     'm', 'preto',    'negra',    'verdes',    'chapeu'),
    ('10', 'antonio',    'm', 'castanho', 'indigena', 'azuis',     'piercing'),
    ('11', 'paulo',      'm', 'louro',    'indigena', 'pretos',    'oculos'),
    ('12', 'clovis',     'm', 'ruivo',    'branca',   'castanhos', 'brinco'),
    ('13', 'diego',      'm', 'preto',    'indigena', 'azuis',     'brinco'),
    ('14', 'felipe',     'm', 'castanho', 'negra',    'pretos',    'chapeu'),
    ('15', 'joao',       'm', 'louro',    'parda',    'castanhos', 'piercing'),
    ('16', 'adriano',    'm', 'ruivo',    'parda',    'verdes',    'oculos');
