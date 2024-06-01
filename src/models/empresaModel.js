var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM empresa WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT * FROM empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(cnpj, razaoSocial, nomeFantasia, telefone, email, senha) {
  var instrucaoSql = `INSERT INTO empresa (razaosocial, nomeFantasia, cnpj, telefone, email, senha) VALUES ('${razaoSocial}','${nomeFantasia}','${cnpj}','${telefone}', '${email}', '${senha}')`;

  return database.executar(instrucaoSql);
}

module.exports = { 
  buscarPorCnpj, 
  buscarPorId, 
  cadastrar, 
  listar 
};
