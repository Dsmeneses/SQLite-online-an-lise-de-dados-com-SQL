/*Consulta 1: Retorne todas as disciplinas*/
SELECT nome_disciplina from Disciplinas; 

/*Consulta 2: Retorne os alunos que estão aprovados na disciplina de matemática*/
SELECT a.nome_aluno, n.nota from Alunos a
join Notas n on a.ID_Aluno = n.ID_Aluno
join Disciplinas d on n.ID_Disciplina = d.ID_Disciplina
where nome_disciplina in ('Matemática') AND n.Nota >= 6.0;

/*Consulta 3: Identificar o total de disciplinas por turma*/
/*Join a Mais, não é necessário juntar as tabelas Disciplinas com as outras, apenas as tabelas 'Turmas' e 'Turma_Disciplinas' já resolveriam o problema*/
SELECT count(d.ID_Disciplina) as Total_disciplinas_turma, t.nome_turma as Nome_turma from Disciplinas d
join Turma_Disciplinas td on d.ID_Disciplina = td.ID_Disciplina
join Turmas t on td.ID_Turma = t.ID_Turma
GROUP by t.Nome_Turma
ORDER by Total_disciplinas_turma DESC;

/*Consulta 4: Porcentagem dos alunos que estão aprovados*/
SELECT
    (SELECT COUNT(*) FROM Alunos) AS Total_Alunos,
    (SELECT COUNT(*) FROM Alunos a JOIN Notas n ON n.ID_Aluno = a.ID_Aluno WHERE n.Nota >= 7.0) AS Alunos_Aprovados,
    (SELECT COUNT(*) FROM Notas) AS Total_Notas,
    (ROUND(100.0 * (SELECT COUNT(*) FROM Alunos a JOIN Notas n ON n.ID_Aluno = a.ID_Aluno WHERE n.Nota >= 7.0) / (SELECT COUNT(*) 
    FROM Notas), 2) || '%') AS Porcentagem

/*Consulta 5: Porcentagem dos alunos que estão aprovados por disciplina*/
SELECt d.Nome_Disciplina AS Disciplina, COUNT(*) AS Total_Alunos,
    SUM(CASE WHEN n.Nota >= 7.0 THEN 1 ELSE 0 END) AS Alunos_Aprovados,
    ROUND (SUM(CASE WHEN n.Nota >= 7.0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS Porcentagem_Aprovados FROM Alunos a 
JOIN Notas n ON n.ID_Aluno = a.ID_Aluno
JOIN Disciplinas d ON d.ID_Disciplina = n.ID_Disciplina
GROUP BY Disciplina;

