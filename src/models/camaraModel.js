var database = require("../database/config")

function puxarUltimoID(fkEmpresa) {
    var instrucaoSql = `
        SELECT idCamara, fkEmpresa, fkSensor FROM camara WHERE fkEmpresa = ${fkEmpresa}

    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrarCamara(idCamara, fkEmpresa, fkSensor) {
    var instrucaoSql = `
        INSERT INTO camara idCamara, fkEmpresa, fkSensor VALUES ('${idCamara}', '${fkEmpresa}', '${fkSensor}');`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    puxarUltimoID,
    cadastrarCamara 
};