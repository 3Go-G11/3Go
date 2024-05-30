var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/buscarDadosAtuais/:idCamara", function (req, res) {
    medidaController.buscarDadosAtuais(req, res);
});

module.exports = router;