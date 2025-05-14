-- INSERÇÃO DE ESTADOS E CIDADES

/* MySQL/MSSQL: */
-- INSERT INTO ESTADO (nome, uf) VALUES
-- ('Acre', 'AC'),
-- ('Alagoas', 'AL'),
-- ... (outros estados)

/* XAMPP/MariaDB: */
INSERT INTO ESTADO (nome, uf) VALUES
('Acre', 'AC'),
('Alagoas', 'AL'),
('Amapá', 'AP'),
('Amazonas', 'AM'),
('Bahia', 'BA'),
('Ceará', 'CE'),
('Distrito Federal', 'DF'),
('Espírito Santo', 'ES'),
('Goiás', 'GO'),
('Maranhão', 'MA'),
('Mato Grosso', 'MT'),
('Mato Grosso do Sul', 'MS'),
('Minas Gerais', 'MG'),
('Pará', 'PA'),
('Paraíba', 'PB'),
('Paraná', 'PR'),
('Pernambuco', 'PE'),
('Piauí', 'PI'),
('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'),
('Rio Grande do Sul', 'RS'),
('Rondônia', 'RO'),
('Roraima', 'RR'),
('Santa Catarina', 'SC'),
('São Paulo', 'SP'),
('Sergipe', 'SE'),
('Tocantins', 'TO');

-- INSERÇÃO DE CIDADES

/* XAMPP/MariaDB: */
INSERT INTO CIDADE (nome, idestado) VALUES
-- SP
('São Paulo', 25), ('Campinas', 25), ('São Bernardo do Campo', 25), ('São José dos Campos', 25), ('Santos', 25),
-- RJ
('Rio de Janeiro', 19), ('Niterói', 19), ('Nova Iguaçu', 19), ('Duque de Caxias', 19), ('São Gonçalo', 19),
-- MG
('Belo Horizonte', 13), ('Uberlândia', 13), ('Contagem', 13), ('Juiz de Fora', 13), ('Betim', 13);

-- BAIRROS E ENDEREÇOS

/* XAMPP/MariaDB: */
INSERT INTO BAIRRO (nome, idcidade) VALUES
-- São Paulo
('Moema', 1), ('Vila Mariana', 1), ('Pinheiros', 1), ('Liberdade', 1), ('Higienópolis', 1),
-- Rio de Janeiro
('Copacabana', 6), ('Ipanema', 6), ('Leblon', 6), ('Botafogo', 6), ('Flamengo', 6);

INSERT INTO ENDERECO (logradouro, numero, complemento, cep, idbairro) VALUES
-- São Paulo
('Avenida Paulista', '1000', 'Conjunto 52', '01310-000', 1),
('Rua Oscar Freire', '200', 'Apto 101', '01426-000', 2),
('Alameda Santos', '500', 'Sala 30', '01418-000', 3),
-- Rio de Janeiro
('Avenida Atlântica', '200', NULL, '22021-000', 6),
('Rua Visconde de Pirajá', '300', NULL, '22410-000', 7);

-- PESSOAS (ALUNOS E PROFESSORES)

/* XAMPP/MariaDB: */
INSERT INTO PESSOAS (cpf, nome, sobrenome, data_nascimento, genero, idendereco, telefone, email) VALUES
-- Alunos
('111.222.333-44', 'João', 'Silva', '2008-05-15', 'M', 1, '(11) 9999-8888', 'joao.silva@email.com'),
('222.333.444-55', 'Maria', 'Santos', '2007-08-20', 'F', 2, '(11) 8888-7777', 'maria.santos@email.com'),
('333.444.555-66', 'Pedro', 'Oliveira', '2009-02-10', 'M', 3, '(11) 7777-6666', 'pedro.oliveira@email.com'),
-- Professores
('444.555.666-77', 'Carlos', 'Almeida', '1980-11-25', 'M', 4, '(21) 6666-5555', 'carlos.almeida@escola.edu.br'),
('555.666.777-88', 'Ana', 'Costa', '1975-04-30', 'F', 5, '(21) 5555-4444', 'ana.costa@escola.edu.br');

-- ANO LETIVO E TURMAS

/* XAMPP/MariaDB: */
INSERT INTO ANO_LETIVO (ano, data_inicio, data_fim, semestre) VALUES
('2023', '2023-02-06', '2023-12-15', 2),
('2024', '2024-02-06', '2024-12-15', 2),
('2025', '2025-02-05', '2025-12-13', 1);

INSERT INTO TURMA (nome, turno, sala, capacidade, ANO_LETIVO_idAnoLetivo) VALUES
('1º Ano A', 'MANHÃ', 'Sala 101', 30, 1),
('1º Ano B', 'TARDE', 'Sala 102', 30, 1),
('2º Ano A', 'MANHÃ', 'Sala 201', 30, 1);

-- DISCIPLINAS

/* XAMPP/MariaDB: */
INSERT INTO DISCIPLINA (nome, carga_horaria, ementa) VALUES
('Matemática', 120, 'Conceitos fundamentais de álgebra e geometria...'),
('Português', 120, 'Gramática, interpretação e produção textual...'),
('História', 80, 'História do Brasil e Geral...'),
('Geografia', 80, 'Geografia física e humana...'),
('Ciências', 80, 'Conceitos básicos de física, química e biologia...');

-- ALUNOS E PROFESSORES

/* XAMPP/MariaDB: */
INSERT INTO ALUNO (EMAIL_INSTITUCIONAL, IDPESSOA, DATA_INGRESSO, STATUS) VALUES
('joao.silva@escola.edu.br', 1, '2023-01-15', 'ATIVO'),
('maria.santos@escola.edu.br', 2, '2023-01-15', 'ATIVO'),
('pedro.oliveira@escola.edu.br', 3, '2023-01-15', 'ATIVO');

INSERT INTO PROFESSOR (DATA_ADMISSAO, FORMACAO, TITULACAO, IDPESSOA, STATUS) VALUES
('2015-03-10', 'Licenciatura em Matemática', 'Mestre', 4, 'ATIVO'),
('2017-02-15', 'Letras - Português', 'Doutor', 5, 'ATIVO');

-- TURMA_DISCIPLINA (Grade Curricular)

/* XAMPP/MariaDB: */
INSERT INTO TURMADISCIPLINA (IDTURMA, IDDISCIPLINA, IDPROFESSOR, DIAS_AULA, HORARIO) VALUES
(1, 1, 1, 'SEG-QUA', '08:00:00'), -- Matemática 1ºA
(1, 2, 2, 'TER-QUI', '08:00:00'), -- Português 1ºA
(2, 1, 1, 'SEG-QUA', '14:00:00'); -- Matemática 1ºB

-- MATRÍCULAS

/* MySQL/MSSQL: */
-- INSERT INTO MATRICULA (RM, IDTURMA, NUMERO_CHAMADA, DATA_MATRICULA, TIPO_MATRICULA, STATUS) VALUES
-- (1, 1, 1, '2023-01-10', 'MATRÍCULA INICIAL', 'ATIVO'),
-- (2, 1, 2, '2023-01-10', 'MATRÍCULA INICIAL', 'ATIVO'),
-- (3, 2, 1, '2023-01-10', 'MATRÍCULA INICIAL', 'ATIVO');

/* XAMPP/MariaDB: */
INSERT INTO MATRICULA (RM, IDTURMA, NUMERO_CHAMADA, DATA_MATRICULA, TIPO_MATRICULA, STATUS) VALUES
(1, 1, 1, '2023-01-10', 'MATRÍCULA INICIAL', 'ATIVO'),
(2, 1, 2, '2023-01-10', 'MATRÍCULA INICIAL', 'ATIVO'),
(3, 2, 1, '2023-01-10', 'MATRÍCULA INICIAL', 'ATIVO');

-- NOTAS

/* MySQL/MSSQL: */
-- INSERT INTO NOTA (IDTURMADISC, RM, BIMESTRE, NOTA, FALTAS) VALUES
-- (1, 1000, 1, 8.5, 2),
-- (1, 1000, 2, 7.0, 1),
-- ... (outras notas)

/* XAMPP/MariaDB: */
INSERT INTO NOTA (IDTURMADISC, RM, BIMESTRE, NOTA, FALTAS) VALUES
-- Notas do João (RM 1)
(1, 1, 1, 8.5, 2),
(1, 1, 2, 7.0, 1),
(2, 1, 1, 9.0, 0),
-- Notas da Maria (RM 2)
(1, 2, 1, 6.5, 3),
(2, 2, 1, 8.0, 1);


/* configurações adicionais pro XAMPP */
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_MODE = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';