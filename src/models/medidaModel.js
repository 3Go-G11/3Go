var database = require("../database/config");

function buscarDadosAtuais(fkEmpresa) {
    var instrucaoSql = `SELECT camaras.idCamara, dados.dht11Temperatura AS temperatura, dados.dht11Umidade AS umidade
    FROM dados 
    JOIN sensor ON sensor.idSensor = dados.fkSensor
    JOIN camaras ON camaras.fkSensor = sensor.idSensor
    WHERE camaras.fkEmpresa = ${fkEmpresa} AND dados.datahora = 
    (
    SELECT MAX(dados.datahora) FROM dados 
    JOIN sensor ON sensor.idSensor = dados.fkSensor
    JOIN camaras as c on camaras.fkSensor = sensor.idSensor
    WHERE camaras.idCamara = camaras.idCamara
    );`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDadosDia(idCamara, fkEmpresa) {
    var instrucaoSql = ` SELECT 
    MAX(dht11Temperatura) AS maiorTemperatura,
    MIN(dht11Temperatura) AS menorTemperatura,
    MAX(dht11Umidade) AS maiorUmidade,
    MIN(dht11Umidade) AS menorUmidade
FROM 
    dados 
    JOIN sensor ON sensor.idSensor = dados.fkSensor
    JOIN camaras ON camaras.fkSensor = sensor.idSensor
    WHERE idCamara = ${idCamara} AND camaras.fkEmpresa = ${fkEmpresa}
GROUP BY
    datahora >= (SELECT DATE_SUB(NOW(), INTERVAL 1 DAY));`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarDadosAtuais,
    buscarDadosDia
}
