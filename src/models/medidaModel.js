var database = require("../database/config");

function buscarDadosAtuais(fkEmpresa) {
    console.log("fkEmpresa", fkEmpresa);

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

module.exports = {
    buscarDadosAtuais
}
