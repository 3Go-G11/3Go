var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.post("/buscarDadosAtuais", function (req, res) {
    medidaController.buscarDadosAtuais(req, res);
});
 
router.post("/buscarDadosDia", function (req, res) {
    medidaController.buscarDadosDia(req, res);
});

module.exports = router;