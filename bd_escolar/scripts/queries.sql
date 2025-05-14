
-- CONSULTAS DE ALUNOS


-- Consulta de Alunos com Endereço Completo
/* MySQL/MSSQL: */
-- SELECT 
--     a.RM,
--     p.nome + ' ' + p.sobrenome AS nome_completo,
--     p.data_nascimento,
--     DATEDIFF(YEAR, p.data_nascimento, GETDATE()) AS idade,
--     p.email,
--     a.EMAIL_INSTITUCIONAL,
--     e.logradouro + ', ' + e.numero + 
--     CASE WHEN e.complemento IS NOT NULL THEN ' - ' + e.complemento ELSE '' END AS endereco,
--     b.nome AS bairro,
--     c.nome AS cidade,
--     es.uf AS estado,
--     e.cep
-- FROM 
--     ALUNO a
--     JOIN PESSOAS p ON a.IDPESSOA = p.idpessoa
--     LEFT JOIN ENDERECO e ON p.idendereco = e.idendereco
--     LEFT JOIN BAIRRO b ON e.idbairro = b.idbairro
--     LEFT JOIN CIDADE c ON b.idcidade = c.idcidade
--     LEFT JOIN ESTADO es ON c.idestado = es.idestado
-- WHERE 
--     a.STATUS = 'ATIVO'
-- ORDER BY 
--     nome_completo;

/* XAMPP/MariaDB: */
SELECT 
    a.RM,
    CONCAT(p.nome, ' ', p.sobrenome) AS nome_completo,
    p.data_nascimento,
    TIMESTAMPDIFF(YEAR, p.data_nascimento, CURDATE()) AS idade,
    p.email,
    a.EMAIL_INSTITUCIONAL,
    CONCAT(e.logradouro, ', ', e.numero, 
           CASE WHEN e.complemento IS NOT NULL THEN CONCAT(' - ', e.complemento) ELSE '' END) AS endereco,
    b.nome AS bairro,
    c.nome AS cidade,
    es.uf AS estado,
    e.cep
FROM 
    ALUNO a
    JOIN PESSOAS p ON a.IDPESSOA = p.idpessoa
    LEFT JOIN ENDERECO e ON p.idendereco = e.idendereco
    LEFT JOIN BAIRRO b ON e.idbairro = b.idbairro
    LEFT JOIN CIDADE c ON b.idcidade = c.idcidade
    LEFT JOIN ESTADO es ON c.idestado = es.idestado
WHERE 
    a.STATUS = 'ATIVO'
ORDER BY 
    nome_completo;


-- CONSULTAS ACADÊMICAS


-- Grade Horária por Turma
/* MySQL/MSSQL: */
-- SELECT 
--     t.nome AS turma,
--     t.turno,
--     d.nome AS disciplina,
--     p.nome + ' ' + p.sobrenome AS professor,
--     td.DIAS_AULA AS dias,
--     CONVERT(VARCHAR(5), td.HORARIO, 108) AS horario
-- FROM 
--     TURMADISCIPLINA td
--     JOIN TURMA t ON td.IDTURMA = t.idturma
--     JOIN DISCIPLINA d ON td.IDDISCIPLINA = d.iddisciplina
--     JOIN PROFESSOR pr ON td.IDPROFESSOR = pr.IDPROFESSOR
--     JOIN PESSOAS p ON pr.IDPESSOA = p.idpessoa
-- WHERE 
--     t.ANO_LETIVO_idAnoLetivo = (SELECT idanoLetivo FROM ANO_LETIVO WHERE ano = YEAR(GETDATE()))
-- ORDER BY 
--     t.nome, td.HORARIO;

/* XAMPP/MariaDB: */
SELECT 
    t.nome AS turma,
    t.turno,
    d.nome AS disciplina,
    CONCAT(p.nome, ' ', p.sobrenome) AS professor,
    td.DIAS_AULA AS dias,
    DATE_FORMAT(td.HORARIO, '%H:%i') AS horario
FROM 
    TURMADISCIPLINA td
    JOIN TURMA t ON td.IDTURMA = t.idturma
    JOIN DISCIPLINA d ON td.IDDISCIPLINA = d.iddisciplina
    JOIN PROFESSOR pr ON td.IDPROFESSOR = pr.IDPROFESSOR
    JOIN PESSOAS p ON pr.IDPESSOA = p.idpessoa
WHERE 
    t.ANO_LETIVO_idAnoLetivo = (SELECT idanoLetivo FROM ANO_LETIVO WHERE ano = '2023')
ORDER BY 
    t.nome, td.HORARIO;

-- Boletim de Notas por Aluno
/* MySQL/MSSQL: */
-- SELECT 
--     a.RM,
--     p.nome + ' ' + p.sobrenome AS aluno,
--     t.nome AS turma,
--     d.nome AS disciplina,
--     prof.nome + ' ' + prof.sobrenome AS professor,
--     n.BIMESTRE,
--     n.NOTA,
--     n.FALTAS,
--     CASE 
--         WHEN n.NOTA >= 7 THEN 'APROVADO'
--         WHEN n.NOTA >= 5 THEN 'RECUPERAÇÃO'
--         ELSE 'REPROVADO'
--     END AS situacao
-- FROM 
--     NOTA n
--     JOIN TURMADISCIPLINA td ON n.IDTURMADISC = td.IDTURMADISC
--     JOIN DISCIPLINA d ON td.IDDISCIPLINA = d.iddisciplina
--     JOIN PROFESSOR pr ON td.IDPROFESSOR = pr.IDPROFESSOR
--     JOIN PESSOAS prof ON pr.IDPESSOA = prof.idpessoa
--     JOIN ALUNO a ON n.RM = a.RM
--     JOIN PESSOAS p ON a.IDPESSOA = p.idpessoa
--     JOIN TURMA t ON td.IDTURMA = t.idturma
-- WHERE 
--     a.RM = 1001
-- ORDER BY 
--     d.nome, n.BIMESTRE;

/* XAMPP/MariaDB: */
SELECT 
    a.RM,
    CONCAT(p.nome, ' ', p.sobrenome) AS aluno,
    t.nome AS turma,
    d.nome AS disciplina,
    CONCAT(prof.nome, ' ', prof.sobrenome) AS professor,
    n.BIMESTRE,
    n.NOTA,
    n.FALTAS,
    CASE 
        WHEN n.NOTA >= 7 THEN 'APROVADO'
        WHEN n.NOTA >= 5 THEN 'RECUPERAÇÃO'
        ELSE 'REPROVADO'
    END AS situacao
FROM 
    NOTA n
    JOIN TURMADISCIPLINA td ON n.IDTURMADISC = td.IDTURMADISC
    JOIN DISCIPLINA d ON td.IDDISCIPLINA = d.iddisciplina
    JOIN PROFESSOR pr ON td.IDPROFESSOR = pr.IDPROFESSOR
    JOIN PESSOAS prof ON pr.IDPESSOA = prof.idpessoa
    JOIN ALUNO a ON n.RM = a.RM
    JOIN PESSOAS p ON a.IDPESSOA = p.idpessoa
    JOIN TURMA t ON td.IDTURMA = t.idturma
WHERE 
    a.RM = 2 --Utilizando Maria de exemplo.
ORDER BY 
    d.nome, n.BIMESTRE;


-- ESTATÍSTICAS E RELATÓRIOS


-- Estatísticas Escolares
/* MySQL/MSSQL: */
-- SELECT 
--     t.nome AS turma,
--     COUNT(DISTINCT m.RM) AS total_alunos,
--     AVG(n.NOTA) AS media_geral,
--     SUM(n.FALTAS) AS total_faltas,
--     COUNT(CASE WHEN n.NOTA < 5 THEN 1 END) AS reprovados,
--     COUNT(CASE WHEN n.NOTA BETWEEN 5 AND 6.9 THEN 1 END) AS recuperacao,
--     COUNT(CASE WHEN n.NOTA >= 7 THEN 1 END) AS aprovados
-- FROM 
--     TURMA t
--     JOIN MATRICULA m ON t.idturma = m.IDTURMA
--     JOIN NOTA n ON m.RM = n.RM
-- WHERE 
--     t.ANO_LETIVO_idAnoLetivo = (SELECT idanoLetivo FROM ANO_LETIVO WHERE ano = YEAR(GETDATE()))
-- GROUP BY 
--     t.nome
-- ORDER BY 
--     t.nome;

/* XAMPP/MariaDB: */
SELECT 
    t.nome AS turma,
    COUNT(DISTINCT m.RM) AS total_alunos,
    IFNULL(AVG(n.NOTA), 0) AS media_geral,
    IFNULL(SUM(n.FALTAS), 0) AS total_faltas,
    SUM(CASE WHEN n.NOTA < 5 THEN 1 ELSE 0 END) AS reprovados,
    SUM(CASE WHEN n.NOTA BETWEEN 5 AND 6.9 THEN 1 ELSE 0 END) AS recuperacao,
    SUM(CASE WHEN n.NOTA >= 7 THEN 1 ELSE 0 END) AS aprovados
FROM 
    TURMA t
    LEFT JOIN MATRICULA m ON t.idturma = m.IDTURMA
    LEFT JOIN NOTA n ON m.RM = n.RM
WHERE 
    t.ANO_LETIVO_idAnoLetivo = (SELECT idanoLetivo FROM ANO_LETIVO WHERE ano = '2023') -- Ano específico
GROUP BY 
    t.nome
ORDER BY 
    t.nome;

-- Professores e Suas Disciplinas
/* MySQL/MSSQL: */
-- SELECT 
--     p.nome + ' ' + p.sobrenome AS professor,
--     pr.FORMACAO,
--     pr.TITULACAO,
--     STRING_AGG(d.nome, ', ') AS disciplinas_lecionadas,
--     COUNT(td.IDTURMADISC) AS total_turmas
-- FROM 
--     PROFESSOR pr
--     JOIN PESSOAS p ON pr.IDPESSOA = p.idpessoa
--     JOIN TURMADISCIPLINA td ON pr.IDPROFESSOR = td.IDPROFESSOR
--     JOIN DISCIPLINA d ON td.IDDISCIPLINA = d.iddisciplina
-- WHERE 
--     pr.STATUS = 'ATIVO'
-- GROUP BY 
--     p.nome, p.sobrenome, pr.FORMACAO, pr.TITULACAO
-- ORDER BY 
--     p.nome;

/* XAMPP/MariaDB: */
SELECT 
    CONCAT(p.nome, ' ', p.sobrenome) AS professor,
    pr.FORMACAO,
    pr.TITULACAO,
    GROUP_CONCAT(DISTINCT d.nome ORDER BY d.nome SEPARATOR ', ') AS disciplinas_lecionadas,
    COUNT(td.IDTURMADISC) AS total_turmas
FROM 
    PROFESSOR pr
    JOIN PESSOAS p ON pr.IDPESSOA = p.idpessoa
    JOIN TURMADISCIPLINA td ON pr.IDPROFESSOR = td.IDPROFESSOR
    JOIN DISCIPLINA d ON td.IDDISCIPLINA = d.iddisciplina
WHERE 
    pr.STATUS = 'ATIVO'
GROUP BY 
    p.nome, p.sobrenome, pr.FORMACAO, pr.TITULACAO
ORDER BY 
    p.nome;


-- NOVAS CONSULTAS ADICIONAIS 


-- Alunos por Turma com Média Geral
/* XAMPP/MariaDB: */
SELECT 
    t.nome AS turma,
    CONCAT(p.nome, ' ', p.sobrenome) AS aluno,
    a.RM,IFNULL(AVG(n.NOTA), 0) AS media_geral,
    IFNULL(SUM(n.FALTAS), 0) AS total_faltas,
    COUNT(n.idnota) AS total_notas
FROM 
    ALUNO a
    JOIN PESSOAS p ON a.IDPESSOA = p.idpessoa 
    JOIN MATRICULA m ON a.RM = m.RM 
    JOIN TURMA t ON m.IDTURMA = t.idturma 
    LEFT JOIN NOTA n ON a.RM = n.RM AND t.idturma = (SELECT IDTURMA FROM TURMADISCIPLINA WHERE IDTURMADISC = n.IDTURMADISC)
WHERE 
    t.ANO_LETIVO_idAnoLetivo = (SELECT idanoLetivo FROM ANO_LETIVO WHERE ano = '2023') -- Ano específico
GROUP BY
    t.nome, p.nome, p.sobrenome, a.RM
HAVING
    COUNT(n.idnota) > 0 -- Mostra apenas alunos com notas
ORDER BY t.nome, media_geral DESC;

-- Disciplinas com Maior Número de Faltas
/* XAMPP/MariaDB: */
SELECT 
    d.nome AS disciplina,
    SUM(n.FALTAS) AS total_faltas,
    COUNT(DISTINCT n.RM) AS alunos_com_faltas,
    ROUND(AVG(n.FALTAS), 1) AS media_faltas_por_aluno
FROM 
    DISCIPLINA d
    JOIN TURMADISCIPLINA td ON d.iddisciplina = td.IDDISCIPLINA
    JOIN NOTA n ON td.IDTURMADISC = n.IDTURMADISC
GROUP BY 
    d.nome
ORDER BY 
    total_faltas DESC
LIMIT 5;

-- Professores e Suas Cargas Horárias
/* XAMPP/MariaDB: */
SELECT 
    CONCAT(p.nome, ' ', p.sobrenome) AS professor,
    SUM(d.carga_horaria) AS carga_horaria_total,
    COUNT(DISTINCT td.IDTURMA) AS turmas,
    COUNT(DISTINCT td.IDDISCIPLINA) AS disciplinas
FROM 
    PROFESSOR pr
    JOIN PESSOAS p ON pr.IDPESSOA = p.idpessoa
    JOIN TURMADISCIPLINA td ON pr.IDPROFESSOR = td.IDPROFESSOR
    JOIN DISCIPLINA d ON td.IDDISCIPLINA = d.iddisciplina
WHERE 
    pr.STATUS = 'ATIVO'
GROUP BY 
    p.nome, p.sobrenome
ORDER BY 
    carga_horaria_total DESC;


-- CONFIGURAÇÕES ADICIONAIS PARA XAMPP


/* configurações adicionais pro XAMPP */
SET sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';