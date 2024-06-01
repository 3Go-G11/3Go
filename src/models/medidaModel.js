var database = require("../database/config");

function buscarDadosAtuais(idCamara, fkEmpresa) {

    var instrucaoSql = `SELECT dados.dht11Temperatura AS temperatura, dados.dht11Umidade AS umidade,
                        FROM dados 
                        JOIN sensor ON sensor.idSensor = dados.fkSensor
                        JOIN camaras ON camaras.fkSensor = sensor.idSensor;
                        WHERE idCamara = ${idCamara} AND fkEmpresa = ${fkEmpresa};`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarDadosAtuais
}
