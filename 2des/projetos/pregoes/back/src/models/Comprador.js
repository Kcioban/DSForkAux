const Usuario = require("./Usuario");

//Pattern Builder (Classe utilizando Consrutor)
class Comprador extends Usuario {
    constructor(id, email, senha, doc, nome, tel) {
        super(id, email, senha, doc, nome, tel);
        this.tipo = 0;
    }
}

module.exports = Comprador;