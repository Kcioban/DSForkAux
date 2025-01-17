const con = require('./connection');
const Documento = require('../models/Documento');
const Telefone = require('../models/Telefone');
const Comprador = require('../models/Comprador');
const Fornecedor = require('../models/Fornecedor');

//Pattern Composite (Documento e Telefone compõe a estrutura do Objeto)
const compradores = (lista) => {
    let compradores = [];
    let lastId = 0;
    lista.forEach(e => {
        if (lastId != e.usuario_id) {
            lastId = e.usuario_id;
            compradores.push(new Comprador(e.usuario_id, e.email, e.senha, new Documento(e.tipo_documento, e.numero_documento), e.nome, new Telefone(e.telefone, e.numero)));
        } else {
            compradores[compradores.length - 1].addTelefone(new Telefone(e.telefone, e.numero));
        }
    })
    return compradores;
}

//Pattern Composite (Documento e Telefone compõe a estrutura do Objeto)
const fornecedores = (lista) => {
    let fornecedores = [];
    let lastId = 0;
    lista.forEach(e => {
        if (lastId != e.usuario_id) {
            lastId = e.usuario_id;
            fornecedores.push(new Fornecedor(e.usuario_id, e.email, e.senha, new Documento(e.tipo_documento, e.numero_documento), e.nome, new Telefone(e.telefone, e.numero)));
        } else {
            fornecedores[fornecedores.length - 1].addTelefone(new Telefone(e.telefone, e.numero));
        }
    })
    return fornecedores;
}

const login = (u) => {
    return new Promise((resolve, reject) => {
        let string = `SELECT * FROM usuarios WHERE email = '${u.email}' AND senha = '${u.senha}';`
        con.query(string, (err, result) => {
            err ? reject(err) : resolve(result);
        })
    });
}

const update = (data) => {
    return new Promise((resolve, reject) => {
        let string = `UPDATE usuarios SET email = '${data.email}', senha = '${data.senha}', tipo_documento = '${data.documento.tipo}',` +
            `numero_documento = '${data.documento.numero}', nome = '${data.nome}'` +
            `WHERE usuario_id = ${data.id}`;
        con.query(string, (err, result) => {
            err ? reject(err) : resolve(result);
        })
    });
}

const del = (id) => {
    return new Promise((resolve, reject) => {
        let string = `DELETE FROM usuarios WHERE usuario_id = ${id};`
        con.query(string, (err, result) => {
            err ? reject(err) : resolve(result);
        })
    });
}

const createTel = (data) => {
    return new Promise((resolve, reject) => {
        let string = `INSERT INTO telefones (usuario, tipo, numero) VALUES (${data.id},'${data.tipo}','${data.numero}');`;
        con.query(string, (err, result) => {
            err ? reject(err) : resolve(result);
        })
    });
}

const updateTel = (data) => {
    return new Promise((resolve, reject) => {
        let string = `UPDATE telefones SET tipo = '${data.tipo}', numero = '${data.numero}' WHERE usuario = ${data.id} AND tipo = '${data.tipo}';`;
        con.query(string, (err, result) => {
            err ? reject(err) : resolve(result);
        })
    });
}

const delTel = (id, numero) => {
    return new Promise((resolve, reject) => {
        let string = `DELETE FROM telefones WHERE usuario = ${id} AND numero = '${numero}';`
        con.query(string, (err, result) => {
            err ? reject(err) : resolve(result);
        })
    });
}

module.exports = {
    compradores,
    fornecedores,
    login,
    update,
    del,
    createTel,
    updateTel,
    delTel
}