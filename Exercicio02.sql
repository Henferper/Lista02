--GERENCIAMENTO DE TABELAS - DDL
CREATE TABLE Aluno(
	CPF CHAR (15) PRIMARY KEY,
	Nome CHAR (50) NOT null,
	Idade INT 
)
CREATE TABLE Departamento(
	ID_Departamento SERIAL PRIMARY KEY,
	Nome CHAR (20),
	Area CHAR (40)
)
CREATE TABLE Curso(
	ID_Curso SERIAL PRIMARY KEY,
	Nome CHAR (35),
	ID_Departamento SERIAL,
	CONSTRAINT FK_Dptmt FOREIGN KEY (ID_Departamento) REFERENCES Departamento (ID_Departamento)
)
ALTER TABLE Curso ALTER COLUMN ID_Departamento TYPE SERIAL

CREATE TABLE Disciplina(
	ID_Disciplina SERIAL PRIMARY KEY,
	Nome CHAR(40),
	Tipo CHAR (20),
	ID_Curso INT,
	CONSTRAINT KK_Crs FOREIGN KEY (ID_Curso) REFERENCES Curso (ID_Curso)
)
CREATE TABLE Contato(
	EmailTelefone CHAR (30),
	CPF CHAR(15),
	CONSTRAINT FK_CPF FOREIGN KEY (CPF) REFERENCES Aluno (CPF)
)
CREATE TABLE Endereço(
	Rua CHAR (30),
	Bairro CHAR (30),
	Numero CHAR (10),
	Cidade CHAR (20),
	CPF CHAR(15),
	CONSTRAINT FK_RA FOREIGN KEY (CPF) REFERENCES Aluno (CPF)
)
CREATE TABLE Matricula(
	RA CHAR (10) PRIMARY KEY,
	Status CHAR (15),
	CPF CHAR(15),
	CONSTRAINT FK_CPF FOREIGN KEY (CPF) REFERENCES Aluno (CPF),
	ID_Curso INT,
	CONSTRAINT FK_Crs FOREIGN KEY (ID_Curso) REFERENCES Curso (ID_Curso)
)
CREATE TABLE curso_disciplina(
	ID_Curso INT,
	CONSTRAINT FK_Crs FOREIGN KEY (ID_Curso) REFERENCES Curso (ID_Curso),
	ID_Disciplina INT,
	CONSTRAINT FK_Dis FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina (ID_Disciplina)
)
CREATE TABLE matricula_disciplina(
	RA INT,
	CONSTRAINT FK_RA FOREIGN KEY (RA) REFERENCES Matricula (RA),
	ID_Disciplina INT,
	CONSTRAINT FK_Dis FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina (ID_Disciplina)
)
--DELETAR TABELAS - DDL
DROP TABLE Aluno CASCADE
DROP TABLE Departamento CASCADE
DROP TABLE Curso CASCADE
DROP TABLE Disciplina CASCADE
DROP TABLE Contato CASCADE
DROP TABLE Endereço CASCADE
DROP TABLE Matricula CASCADE

--ALTER TABLE
ALTER TABLE Aluno DROP COLUMN ra
ALTER TABLE Aluno DROP COLUMN status
ALTER TABLE Aluno DROP COLUMN cpf
ALTER TABLE Departamento
ALTER TABLE Curso
ALTER TABLE Disciplina
ALTER TABLE Contato
ALTER TABLE Endereço
ALTER TABLE Matricula DROP COLUMN RA CASCADE
ALTER TABLE Matricula INSERT COLUMN RA CASCADE

--INSERIR DADOS NAS TABELAS - DDL
--TABELA ALUNO
INSERT INTO Aluno(Nome,CPF,Idade) VALUES
('João Silva', '123.456.789-00', 20),
('Maria Santos', '234.567.890-11', 22),
('Pedro Oliveira', '345.678.901-22', 24),
('Ana Souza', '456.789.012-33', 23),
('Amanda Oliveira', '111.112.131-99', 26),
('Carlos Pereira', '567.890.123-44', 25),
('Juliana Costa', '678.901.234-55', 22),
('Lucas Ferreira', '945.642.334-66', 30),
('Mariana Almeida', '890.123.456-77', 21),
('Felipe Santos', '901.234.567-88', 23),
('Amanda Oliveira', '101.112.131-99', 26),
('Bruno Silva', '111.213.141-00', 22),
('Camila Mendes', '121.314.151-11', 24),
('Daniel Sousa', '131.415.161-22', 24),
('Erika Costa', '141.516.171-33', 23),
('Fernanda Lima', '151.617.181-44', 27),
('Igor Santos', '181.920.212-77', 23),
('Gabriel Rocha', '161.718.191-55', 25),
('Helena Alves', '171.819.202-66', 26),
('Igor Santos', '181.928.212-77', 23),
('Jéssica Oliveira', '192.021.222-88', 24),
('Karen Souza', '202.122.232-99', 20),
('Leandro Lima', '212.223.243-00', 22),
('Marcela Costa', '222.324.253-11', 21),
('Natalia Ferreira', '232.425.264-22', 23),
('Oscar Almeida', '242.526.275-33', 20),
('Lucas Ferreira', '789.012.345-66', 30),
('Patricia Mendes', '252.627.286-44', 22),
('Rafaela Sousa', '262.728.297-55', 21),
('Samuel Lima', '272.829.308-66', 23),
('Tatiane Rocha', '282.930.319-77', 24),
('Ulisses Alves', '293.031.320-88', 29),
('Vivian Santos', '303.132.331-99', 22)

--TABELA DEPARTAMENTO
INSERT INTO Departamento(Nome,Area) VALUES
('TEC','Tecnologia'),
('SAD','Saúde'),
('ADM','Administração'),
('ENG','Engenharia'),
('HUM','Humanas'),
('ETC','Outros')

--TABELA CURSO
INSERT INTO Curso(Nome,ID_Departamento) VALUES
('Engenharia Civil',4),
('Administração de Empresas',3),
('Medicina',2),
('Direito',5),
('Ciência da Computação',1),
('Psicologia',2),
('Arquitetura e Urbanismo',4),
('Economia',3),
('Engenharia Elétrica',4),
('Administração Pública',3),
('Biologia',5),
('Letras',5),
('Ciências Contábeis',3),
('Engenharia Mecânica',4),
('Farmácia',2),
('História',5),
('Química',4),
('Educação Física',5),
('Nutrição',2),
('Física',4)

--TABELA DISCIPLINA
INSERT INTO Disciplina(Nome,Tipo,ID_Curso) VALUES
--Curso ENGENHARIA CIVIL
('Cálculo I', 'Obrigatório',4),
('Mecânica dos Sólidos', 'Obrigatório',4),
('Desenho Técnico', 'Obrigatório',4),
('Topografia', 'Obrigatório',4),
('Materiais de Construção', 'Obrigatório',4),
-- Curso ADMINISTRAÇÃO DE EMPRESAS
('Introdução à Administração', 'Obrigatório',3),
('Contabilidade Básica', 'Obrigatório',3),
('Gestão de Pessoas', 'Obrigatório',3),
('Marketing', 'Obrigatório',3),
('Economia Empresarial', 'Obrigatório',3),
-- Curso MEDICINA
('Anatomia Humana', 'Obrigatório',2),
('Fisiologia', 'Obrigatório',2),
('Bioquímica', 'Obrigatório',2),
('Patologia', 'Obrigatório',2),
('Farmacologia', 'Obrigatório',2),
--Curso DIREITO
('Introdução ao Direito', 'Obrigatório',5),
('Direito Civil', 'Obrigatório',5),
('Direito Penal', 'Obrigatório',5),
('Direito Constitucional', 'Obrigatório',5),
('Direito do Trabalho', 'Obrigatório',5),
--Curso CIENCIAS DA COMPUTAÇÃO
('Algoritmos e Estruturas de Dados', 'Obrigatório',1),
('Programação Orientada a Objetos', 'Obrigatório',1),
('Redes de Computadores', 'Obrigatório',1),
('Banco de Dados', 'Obrigatório',1),
('Engenharia de Software', 'Obrigatório',1),
--Curso PSICOLOGIA
('Introdução à Psicologia', 'Obrigatório',2),
('Psicologia do Desenvolvimento', 'Obrigatório',2),
('Psicopatologia', 'Obrigatório',2),
('Teorias da Personalidade', 'Obrigatório',2),
('Psicologia Social', 'Obrigatório',2),
--Curso ARQUITETURA
('História da Arquitetura', 'Obrigatório',4),
('Desenho Arquitetônico', 'Obrigatório',4),
('Teoria da Arquitetura', 'Obrigatório',4),
('Construção Civil', 'Obrigatório',4),
('Planejamento Urbano', 'Obrigatório',4),
--Curso ECONOMIA
('Introdução à Economia', 'Obrigatório',3),
('Microeconomia', 'Obrigatório',3),
('Macroeconomia', 'Obrigatório',3),
('Econometria', 'Obrigatório',3),
('Economia Internacional', 'Obrigatório',3),
--Curso ENGENHARIA ELÉTRICA
('Circuitos Elétricos', 'Obrigatório',4),
('Eletrônica Analógica', 'Obrigatório',4),
('Sistemas Digitais', 'Obrigatório',4),
('Eletromagnetismo', 'Obrigatório',4),
('Automação Industrial', 'Obrigatório',4),
--Curso ADMINISTRAÇÃO PUBLICA
('Administração Pública Brasileira', 'Obrigatório',3),
('Gestão de Políticas Públicas', 'Obrigatório',3),
('Direito Administrativo', 'Obrigatório',3),
('Orçamento Público', 'Obrigatório',3),
('Gestão de Recursos Humanos', 'Obrigatório',3),
--Curso BIOLOGIA
('Biologia Celular', 'Obrigatório',5),
('Genética', 'Obrigatório',5),
('Ecologia', 'Obrigatório',5),
('Fisiologia Vegetal e Animal', 'Obrigatório',5),
('Microbiologia', 'Obrigatório',5),
--Curso LETRAS
('Literatura Brasileira', 'Obrigatório',5),
('Gramática da Língua Portuguesa', 'Obrigatório',5),
('Teoria Literária', 'Obrigatório',5),
('Linguística', 'Obrigatório',5),
('Literatura Estrangeira', 'Obrigatório',5),
--Curso CIENCIAS CONTÁBEIS
('Contabilidade Geral', 'Obrigatório',3),
('Contabilidade Avançada', 'Obrigatório',3),
('Auditoria Contábil', 'Obrigatório',3),
('Controladoria', 'Obrigatório',3),
('Análise das Demonstrações Financeiras', 'Obrigatório',3),
-- Curso ENGENHARIA MECANICA
('Termodinâmica', 'Obrigatório',4),
('Mecânica dos Fluidos', 'Obrigatório',4),
('Mecânica dos Materiais', 'Obrigatório',4),
('Transferência de Calor', 'Obrigatório',4),
('Dinâmica dos Sólidos', 'Obrigatório',4),
-- Curso FARMÁCIA
('Química Farmacêutica', 'Obrigatório',2),
('Farmacologia', 'Obrigatório',2),
('Toxicologia', 'Obrigatório',2),
('Farmácia Hospitalar', 'Obrigatório',2),
('Bioquímica Clínica', 'Obrigatório',2),
-- Curso HISTÓRIA
('História Antiga', 'Obrigatório',5),
('História Medieval', 'Obrigatório',5),
('História Moderna', 'Obrigatório',5),
('História Contemporânea', 'Obrigatório',5),
('Metodologia da Pesquisa Histórica', 'Obrigatório',5),
-- Curso QUÍMICA
('Química Geral', 'Obrigatório',4),
('Química Orgânica', 'Obrigatório',4),
('Química Inorgânica', 'Obrigatório',4),
('Química Analítica', 'Obrigatório',4),
('Físico-Química', 'Obrigatório',4),
-- Curso EDUCAÇÃO FÍSICA
('Anatomia Humana', 'Obrigatório',5),
('Fisiologia do Exercício', 'Obrigatório',5),
('Didática do Ensino da Educação Física', 'Obrigatório',5),
('História da Educação Física', 'Obrigatório',5),
('Biomecânica', 'Obrigatório',5),
-- Curso NUTRIÇÃO
('Nutrição Básica', 'Obrigatório',2),
('Dietoterapia', 'Obrigatório',2),
('Nutrição Clínica', 'Obrigatório',2),
('Nutrição Materno-Infantil', 'Obrigatório',2),
('Alimentação Coletiva', 'Obrigatório',2),
-- Curso FÍSICA
('Física Geral', 'Obrigatório',4),
('Física Matemática', 'Obrigatório',4),
('Física Experimental', 'Obrigatório',4),
('Mecânica Quântica', 'Obrigatório',4),
('Eletromagnetismo', 'Obrigatório',4),
--DISCIPLINAS OPCIONAIS PARA QUALQUER CURSO
('Empreendedorismo', 'Opcional',6),
('Gestão de Projetos', 'Opcional',6),
('Inglês Avançado', 'Opcional',6),
('Arte e Cultura', 'Opcional',6),
('Comunicação e Expressão', 'Opcional',6)

--TABELA CONTATO
INSERT INTO Contato(CPF,EmailTelefone) VALUES
('123.456.789-00','(11) 1234-5678'),--1
('234.567.890-11','(22) 2345-6789'),--2
('234.567.890-11','maria.santos@email.com'),--2
('345.678.901-22','(33) 3456-7890'),--3
('345.678.901-22','pedro.oliveira@email.com'),--3
('456.789.012-33','(44) 4567-8901'),--4
('456.789.012-33','ana.souza@email.com'),--4
('111.112.131-99','(55) 5678-9012'),--5
('567.890.123-44','carlos.pereira@email.com'),--6
('678.901.234-55','juliana.costa@email.com'),--7
('678.901.234-55','(77) 7890-1234'),--7
('945.642.334-66','lucas.ferreira@email.com'),--8
('945.642.334-66','(88) 8901-2345'),--8
('890.123.456-77','mariana.almeida@email.com'),--9
('890.123.456-77','mari.almeida324@gmail.com'),--9
('890.123.456-77','(99) 9012-3456'),--9
('901.234.567-88','(11) 0123-4567'),--10
('101.112.131-99','amanda.oliveira@email.com'),--11
('101.112.131-99','(22) 1234-5678'),--11
('111.213.141-00','bruno.silva@email.com'),--12
('111.213.141-00','(33) 2345-6789'),--12
('121.314.151-11','camila.mendes@email.com'),--13
('121.314.151-11','(44) 3456-7890'),--13
('121.314.151-11','daniel.sousa@email.com'),--14
('131.415.161-22','daniel.sousa123123@email.com'),--13
('131.415.161-22','(55) 4567-8901'),--14
('141.516.171-33','erika.costa@email.com'),--15
('141.516.171-33','(66) 5678-9012'),--15
('151.617.181-44','fernanda.lima@email.com'),--16
('181.920.212-77','(77) 6789-0123'),--17
('161.718.191-55','gabriel.rocha@email.com'),--18
('161.718.191-55','(88) 7890-1234'),--18
('171.819.202-66','helena.alves@email.com'),--19
('171.819.202-66','(99) 8901-2345'),--19
('181.928.212-77','(99) 8921-2387'),--20
('181.928.212-77','(11) 9012-3456'),--20
('192.021.222-88','jessica.oliveira@email.com'),--21
('192.021.222-88','jessica.oliveira9090@email.com'),--21
('202.122.232-99','(22) 0123-4567'),--22
('202.122.232-99','karen.souza@email.com'),--22
('212.223.243-00','(33) 1234-5678'),--23
('212.223.243-00','leandro.lima@email.com'),--23
('202.122.232-99','(44) 2345-6789'),--24
('222.324.253-11','marcela.costa@email.com'),--25
('232.425.264-22','natalia.ferreira@email.com'),--26
('242.526.275-33','oscar.almeida@email.com'),--27
('252.627.286-44','(77) 5678-9012'),--28
('252.627.286-44','patricia.mendes@email.com'),--28
('262.728.297-55','(88) 6789-0123'),--29
('262.728.297-55','rafaela.sousa@email.com'),--29
('262.728.297-55','(99) 7890-1234'),--29
('272.829.308-66','samuel.lima@email.com'),--30
('272.829.308-66','(11) 8901-2345'),--30
('282.930.319-77','tatiane.rocha@email.com'),--31
('282.930.319-77','(22) 9012-3456'),--31
('293.031.320-88','(33) 0123-4567'),--32
('303.132.331-99','vivian.santos@email.com')--33

--TABELA ENDEREÇO
INSERT INTO Endereço(CPF,Rua,Bairro,Numero,Cidade) VALUES
('123.456.789-00','Rua das Acácias', 'Jardim Primavera', '123', 'São Paulo'),
('234.567.890-11','Avenida dos Ipês', 'Centro', '456', 'Rio de Janeiro'),
('345.678.901-22','Travessa das Palmeiras', 'Vila Nova', '789', 'Belo Horizonte'),
('456.789.012-33','Rua das Flores', 'Liberdade', '321', 'Salvador'),
('111.112.131-99','Alameda das Orquídeas', 'Santo Antônio', '654', 'Porto Alegre'),
('567.890.123-44','Rua dos Girassóis', 'Jardim Botânico', '987', 'Curitiba'),
('678.901.234-55','Avenida das Hortênsias', 'Boa Vista', '234', 'Fortaleza'),
('945.642.334-66','Travessa dos Lírios', 'São José', '567', 'Recife'),
('901.234.567-88','Rua das Violetas', 'Vila Isabel', '890', 'Manaus'),
('111.213.141-00','Alameda das Tulipas', 'Morumbi', '432', 'São Paulo'),
('121.314.151-11','Rua dos Cravos', 'Centro', '765', 'Rio de Janeiro'),
('131.415.161-22','Avenida das Margaridas', 'Jardim Europa', '1098', 'Belo Horizonte'),
('141.516.171-33','Travessa das Rosas', 'Barra', '543', 'Salvador'),
('151.617.181-44','Rua das Camélias', 'Copacabana', '876', 'Rio de Janeiro'),
('181.920.212-77','Alameda dos Lírios', 'Centro', '210', 'São Paulo'),
('161.718.191-55','Rua das Margaridas', 'Barreiro', '543', 'Belo Horizonte'),
('171.819.202-66','Avenida dos Crisântemos', 'São José', '879', 'São Paulo'),
('181.928.212-77','Travessa das Azaleias', 'Centro', '654', 'Porto Alegre'),
('192.021.222-88','Rua das Bromélias', 'Vila Nova', '321', 'Curitiba'),
('202.122.232-99','Alameda dos Girassóis', 'Liberdade', '987', 'Fortaleza'),
('212.223.243-00','Rua das Begônias', 'Centro', '432', 'Manaus'),
('222.324.253-11','Avenida das Orquídeas', 'Boa Viagem', '765', 'Recife'),
('232.425.264-22','Travessa das Hortênsias', 'Vila Isabel', '210', 'São Paulo'),
('242.526.275-33','Rua dos Jasmim', 'Morumbi', '543', 'Rio de Janeiro'),
('789.012.345-66','Alameda dos Cravos', 'Centro', '876', 'Belo Horizonte'),
('252.627.286-44','Rua dos Narcisos', 'Jardim Botânico', '1098', 'São Paulo'),
('262.728.297-55','Avenida dos Antúrios', 'Barra', '321', 'Salvador'),
('272.829.308-66','Travessa das Tulipas', 'Copacabana', '654', 'Porto Alegre'),
('282.930.319-77','Rua das Azaleias', 'Centro', '987', 'Curitiba'),
('293.031.320-88','Alameda das Camelias', 'Santo Andre', '322', 'Fortaleza'),
('303.132.331-99','Alameda das Begônias', 'Barreiro', '210', 'Florianopólis')

--TABELA MATRICULA
INSERT INTO Matricula (RA,CPF,Status,ID_Curso) VALUES
('124456','234.567.890-11','Ativo',1),
('234167','345.678.901-22','Ativo',18),
('345698','456.789.012-33','Ativo',2),
('426789','111.112.131-99','Inativo',19),
('101102','567.890.123-44','Inativo',3),
('561890','678.901.234-55','Inativo',20),
('678701','945.642.334-66','Trancada',4),
('781012','890.123.456-77','Ativo',1),
('890423','901.234.567-88','Ativo',5),
('901534','101.112.131-99','Ativo',2),
('101142','111.213.141-00','Ativo',6),
('112213','121.314.151-11','Ativo',3),
('127314','131.415.161-22','Ativo',7),
('131915','141.516.171-33','Ativo',4),
('146516','151.617.181-44','Ativo',8),
('157617','181.920.212-77','Inativo',5),
('181720','161.718.191-55','Trancada',9),
('167718','171.819.202-66','Inativo',6),
('177819','181.928.212-77','Inativo',10),
('185920','192.021.222-88','Inativo',7),
('192521','202.122.232-99','Ativo',11),
('202222','212.223.243-00','Trancada',8),
('212243','222.324.253-11','Ativo',9),
('226324','232.425.264-22','Ativo',12),
('232825','242.526.275-33','Ativo',10),
('242826','789.012.345-66','Ativo',13),
('789132','252.627.286-44','Trancada',11),
('254627','262.728.297-55','Trancada',14),
('262828','272.829.308-66','Inativo',12),
('267528','282.930.319-77','Inativo',15),
('272899','293.031.320-88','Inativo',13),
('282230','303.132.331-99','Inativo',16),
('296031','303.132.331-99','Inativo',18),
('307132','293.031.320-88','Ativo',17)

INSERT INTO Matricula_Disciplina(RA,Id_disciplina) VALUES
('124456',1),
('124456',2),
('124456',3),
('124456',4),
('124456',5),
('234167',86),
('234167',87),
('234167',88),
('234167',89),
('234167',90),
('345698',6),
('345698',7),
('345698',8),
('345698',9),
('345698',10),
('426789',91),
('426789',92),
('426789',93),
('426789',94),
('426789',95),
('101102',11),
('101102',12),
('101102',13),
('101102',14),
('101102',15),
('561890',96),
('561890',97),
('561890',98),
('561890',99),
('561890',100),
('678701',16),
('678701',17),
('678701',18),
('678701',19),
('678701',20),
('781012',1),
('781012',2),
('781012',3),
('781012',4),
('781012',5),
('890423',21),
('890423',22),
('890423',23),
('890423',24),
('890423',25),
('901534',11),
('901534',12),
('901534',13),
('901534',14),
('901534',15),
('101142',26),
('101142',27),
('101142',28),
('101142',29),
('101142',30),
('112213',11),
('112213',12),
('112213',13),
('112213',14),
('112213',15),
('127314',31),
('127314',32),
('127314',33),
('127314',34),
('127314',35),
('131915',16),
('131915',17),
('131915',18),
('131915',19),
('131915',20),
('146516',36),
('146516',37),
('146516',38),
('146516',39),
('146516',40),
('157617',21),
('157617',22),
('157617',23),
('157617',24),
('157617',25),
('181720',41),
('181720',42),
('181720',43),
('181720',44),
('181720',45),
('167718',25),
('167718',26),
('167718',27),
('167718',28),
('167718',29),
('177819',46),
('177819',47),
('177819',48),
('177819',49),
('177819',50),
('185920',31),
('185920',32),
('185920',33),
('185920',34),
('185920',35),
('192521',51),
('192521',52),
('192521',53),
('192521',54),
('192521',55),
('202222',36),
('202222',37),
('202222',38),
('202222',39),
('202222',40),
('212243',41),
('212243',42),
('212243',43),
('212243',44),
('212243',45),
('226324',56),
('212243',57),
('212243',58),
('212243',59),
('212243',60),
('232825',46),
('232825',47),
('232825',48),
('232825',49),
('232825',50),
('242826',61),
('242826',62),
('242826',63),
('242826',64),
('242826',65),
('789132',51),
('789132',52),
('789132',53),
('789132',54),
('789132',55),
('254627',66),
('254627',67),
('254627',68),
('254627',69),
('254627',70),
('262828',56),
('262828',57),
('262828',58),
('262828',59),
('262828',60),
('267528',71),
('267528',72),
('267528',73),
('267528',74),
('267528',75),
('272899',61),
('272899',62),
('272899',63),
('272899',64),
('272899',65),
('282230',76),
('282230',77),
('282230',78),
('282230',79),
('282230',80),
('296031',86),
('296031',87),
('296031',88),
('296031',89),
('296031',90),
('307132',81),
('307132',82),
('307132',83),
('307132',84),
('307132',85)

--DQL
SELECT * FROM Aluno
SELECT * FROM Endereço
SELECT * FROM Contato
SELECT * FROM Matricula
SELECT * FROM Curso
SELECT * FROM Departamento
SELECT * FROM Disciplina
SELECT * FROM curso_disciplina
SELECT * FROM matricula_Disciplina

--QUERYS
--1. PUXAR DADOS DO ALUNO POR NOME OU RA
SELECT * FROM Aluno
LEFT JOIN Matricula ON Aluno.CPF = Matricula.CPF
WHERE Aluno.Nome = 'Maria Santos' OR Matricula.RA = '101102';

--2. PUXAR DADOS CURSOS ATRAVÉS DO DEPARTAMENTO

SELECT * FROM Departamento NATURAL INNER JOIN Curso
WHERE Nome='TEC'

--3. PUXAR DADOS CURSOS ATRAVÉS DA DISCIPLINA
SELECT Disciplina.Nome AS Nome_Disciplina, Curso.Nome AS Nome_Curso
FROM Disciplina
INNER JOIN Curso ON Disciplina.ID_Curso = Curso.ID_Departamento
WHERE Disciplina.Nome = 'Cálculo I';

--4. PUXAR DADOS DISCIPLINAS ATRAVÉS DO CPF
SELECT Aluno.Nome AS Nome_Aluno, Disciplina.Nome AS Nome_Disciplina
FROM Aluno
INNER JOIN Matricula ON Aluno.CPF = Matricula.CPF
INNER JOIN Disciplina ON Matricula.ID_Curso = Disciplina.ID_Curso
WHERE Aluno.CPF = '890.123.456-77';

--5. PUXAR DADOS ALUNOS ATRAVÉS DE CURSO
SELECT * FROM Curso NATURAL INNER JOIN Matricula
WHERE Nome = 'Direito'

--6. PUXAR DADOS ALUNOS ATRAVÉS DE DISCIPLINA
SELECT Disciplina.Nome AS Nome_Disciplina, Aluno.Nome AS Nome_Aluno
FROM Disciplina
INNER JOIN Matricula ON Disciplina.ID_Curso = Matricula.ID_Curso
INNER JOIN Aluno ON Matricula.CPF = Aluno.CPF
WHERE Disciplina.Nome = 'Nutrição Básica';


--7. PUXAR DADOS ALUNOS FORMADOS
SELECT * FROM Matricula
WHERE Status='Inativo'

--8. PUXAR DADOS ALUNOS ATIVOS
SELECT * FROM Matricula
WHERE Status='Ativo'

--9. PUXAR ALUNOS ATIVOS ATRAVÉS DE CURSO (QUANTIDADE)
SELECT Curso.Nome AS Nome_Curso, COUNT(Matricula.CPF) AS Numero_Alunos
FROM Curso
INNER JOIN Matricula ON Curso.ID_Curso = Matricula.ID_Curso
GROUP BY Curso.Nome;

--10. PUXAR ALUNOS ATIVOS ATRAVÉS DE DISCIPLINA (QUANTIDADE)
SELECT Disciplina.Nome AS Nome_Disciplina, COUNT(DISTINCT Matricula.RA) AS Numero_Alunos
FROM Disciplina
LEFT JOIN Matricula ON Disciplina.ID_Curso = Matricula.ID_Curso
GROUP BY Disciplina.Nome




