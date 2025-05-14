# Banco de Dados Escolar - Projeto SQL

Este é meu projeto de sistema de gestão escolar em SQL, criado para demonstrar habilidades em modelagem de dados e consultas complexas. Um banco de dados completo que gerencia desde cadastros básicos até o histórico acadêmico dos alunos.

## Diagrama do Banco

![er_diagram](https://github.com/user-attachments/assets/86e08208-2017-4610-8f6e-c66597d6a9f7)
 
*(Diagrama ER disponível na pasta docs/er_diagram.png)*

## Principais Recursos

### Modelagem de Dados
- **Estrutura normalizada** em 3ª Forma Normal
- **Relacionamentos complexos** entre entidades escolares
- **Restrições de integridade** bem definidas

### Funcionalidades Implementadas
- Cadastro completo de alunos e professores
- Controle de matrículas por turma
- Lançamento de notas e faltas
- Grade horária das disciplinas

## Tecnologias Utilizadas
- **SQL puro** (compatível com MySQL, MariaDB e PostgreSQL)
- **Modelagem visual** (diagrama ER incluído)
- **Dataset realista** para testes

## Estrutura do Projeto
```
bd_escolar/
├── schema.sql # Criação das tabelas
├── data.sql # Dados de exemplo
├── queries.sql # Consultas úteis
└── docs/ # Documentação
    └── diagrama_escolar.png # Diagrama completo
```

## Destaques do Código

**Exemplo de tabela principal:**
```sql
CREATE TABLE ALUNO (
    RM INT AUTO_INCREMENT PRIMARY KEY,
    EMAIL_INSTITUCIONAL VARCHAR(100) NOT NULL UNIQUE,
    IDPESSOA INT NOT NULL UNIQUE,
    DATA_INGRESSO DATE NOT NULL,
    STATUS VARCHAR(20) CHECK (STATUS IN ('ATIVO', 'INATIVO', 'TRANCADO')),
    FOREIGN KEY (IDPESSOA) REFERENCES PESSOAS(idpessoa)
);
```

**Consulta útil:**
```sql
-- Boletim do aluno
SELECT d.nome AS disciplina, 
       n.nota,
       n.faltas,
       CASE WHEN n.nota >= 7 THEN 'Aprovado' ELSE 'Reprovado' END AS status
FROM NOTA n
JOIN DISCIPLINA d ON n.iddisciplina = d.id
WHERE n.RM = 1001;
```

## Como Executar

1. Importe o schema.sql para criar a estrutura
2. Popule com data.sql para ter dados de teste
3. Explore com as consultas do queries.sql

*Observação: Mantive versões comentadas de códigos que não rodaram de primeira no XAMPP - ficaram como registro do processo de aprendizado.*

## Aprendizados

- Modelagem de bancos relacionais
- Otimização de consultas SQL
- Gerenciamento de constraints
- Resolução de problemas de compatibilidade

## Contato

Para dúvidas ou sugestões:
- Email: joaovictorfernandesgolim@gmail.com
- LinkedIn: [https://linkedin.com/in/jo%C3%A3o-victor-fernandes-golim-436029285]

---

Desenvolvido por [João Victor Fernandes Golim].  
Última atualização: [14/05/2025].  
