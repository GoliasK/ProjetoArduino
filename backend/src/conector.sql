const mysql = require('mysql2');

// Configurações da conexão com o banco de dados
const db = mysql.createConnection({
  host: 'localhost',       // substitua pelo host do seu banco de dados
  user: 'root',     // substitua pelo seu nome de usuário MySQL
  password: '',   // substitua pela sua senha MySQL
  database: 'Dispositivos' // substitua pelo nome do seu banco de dados
});

// Conectando ao banco de dados
db.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err.message);
    return;
  }
  console.log('Conexão ao banco de dados estabelecida com sucesso!');
});

// Exemplo de consulta: Total de Cirurgias por Especialidade
db.query(`SELECT e.Descricao AS Especialidade, COUNT(c.ID_Cirurgia) AS Total_Cirurgias
          FROM Cirurgia c
          JOIN Medico m ON c.CRM = m.CRM
          JOIN Especialidade e ON m.ID_Especialidade = e.ID_Especialidade
          GROUP BY e.Descricao`, 
  (err, results) => {
    if (err) {
      console.error('Erro ao executar a consulta:', err.message);
      return;
    }
    console.log('Resultado da consulta:', results);
  }
);

// Fechando a conexão
db.end((err) => {
  if (err) {
    console.error('Erro ao encerrar a conexão:', err.message);
    return;
  }
  console.log('Conexão ao banco de dados encerrada.');
});
