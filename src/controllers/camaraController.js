var camaraModel = require("../models/camaraModel");

function cadastrarDadosCamara(req, res) {
  var idCamara = req.body.idCamara;
  var fkEmpresa = req.body.fkEmpresa;
  var fkSensor = req.body.fkSensor;

  if (idCamara == undefined) {
    res.status(400).send("idCamara está undefined!");
  } else if (fkEmpresa == undefined) {
    res.status(400).send("fkEmpresa está undefined!");
  } else if (fkSensor == undefined) {
    res.status(400).send("fkSensor está undefined!");
  } else {

    camaraModel.puxarUltimoID(idCamara, fkEmpresa, fkSensor)
      .then(
        function (resultado){
          var idCamara = resultado[0].idCamara;

          if(idCamara == undefined){
            idCamara = 1
          } else {
            idCamara = resultado[0].idCamara +1
          }
          return camaraModel.cadastrarCamara(idCamara, fkEmpresa, fkSensor)

        })
        .then ((resultado) => {
        res.status(201).json(resultado);
        })
      .catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  cadastrarDadosCamara
}