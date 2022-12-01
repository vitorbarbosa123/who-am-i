CREATE TABLE usuarios(nome TEXT PRIMARY KEY, pontos INT);

CREATE TABLE personas(
    id TEXT PRIMARY KEY NOT NULL, 
    nome TEXT NOT NULL, 
    sexo char CHECK( sexo == 'F' OR sexo == 'M' ) NOT NULL, 
    cor_cabelo TEXT NOT NULL, 
    etnia TEXT NOT NULL, 
    cor_olhos TEXT NOT NULL, 
    acessorio TEXT NOT NULL
);

INSERT INTO personas (id, nome, sexo, cor_cabelo, etnia, cor_olhos, acessorio) 
VALUES 
    ('1',  'Luiza',      'F', 'Preto',    'Branca',   'Pretos',    'Oculos'),
    ('2',  'Carolina',   'F', 'Castanho', 'Parda',    'Castanhos', 'Brinco'),
    ('3',  'Debora',     'F', 'Louro',    'Negra',    'Verdes',    'Chapeu'),
    ('4',  'Tatiana',    'F', 'Ruivo',    'Indigena', 'Azuis',     'Piercing'),
    ('5',  'Fatima',     'F', 'Preto',    'Parda',    'Castanhos', 'Piercing'),
    ('6',  'Cecilia',    'F', 'Castanho', 'Branca',   'Verdes',    'Oculos'),
    ('7',  'Alessandra', 'F', 'Louro',    'Branca',   'Azuis',     'Brinco'),
    ('8',  'Andreia',    'F', 'Ruivo',    'Negra',    'Pretos',    'Chapeu'),
    ('9',  'Renato',     'M', 'Preto',    'Negra',    'Verdes',    'Chapeu'),
    ('10', 'Antonio',    'M', 'Castanho', 'Indigena', 'Azuis',     'Piercing'),
    ('11', 'Paulo',      'M', 'Louro',    'Indigena', 'Pretos',    'Oculos'),
    ('12', 'Clovis',     'M', 'Ruivo',    'Branca',   'Castanhos', 'Brinco'),
    ('13', 'Diego',      'M', 'Preto',    'Indigena', 'Azuis',     'Brinco'),
    ('14', 'Felipe',     'M', 'Castanho', 'Negra',    'Pretos',    'Chapeu'),
    ('15', 'Joao',       'M', 'Louro',    'Parda',    'Castanhos', 'Piercing'),
    ('16', 'Adriano',    'M', 'Ruivo',    'Parda',    'Verdes',    'Oculos');
