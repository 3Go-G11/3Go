var express = require("express");
var router = express.Router();

var camaraController = require("../controllers/camaraController");

router.post("/cadastrarDadosCamara/:idCamara", function (req, res) {
  camaraController.cadastrarDadosCamara(req, res);
})

router.post("/puxarUltimoID", function (req, res) {
  camaraController.puxarUltimoID(req, res);
})

module.exports = router;