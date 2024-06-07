var medidaModel = require("../models/medidaModel");

function buscarDadosAtuais(req, res) {
    var fkEmpresa = req.body.fkEmpresaServer;
    console.log(fkEmpresa + "fkempresa do medidascontrolles")

    medidaModel.buscarDadosAtuais(fkEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);    
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarDadosAtuais
}