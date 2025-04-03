const { Pessoa, imprimePessoas } = require("./pessoa");

let lista = [];
lista.push(new Pessoa("Carol Macedo", 24));
lista.push(new Pessoa("Marco Diaz", 25));
lista.push(new Pessoa("Alexandre Nunes", 45));
lista.push(new Pessoa("Agata Aguiar", 75));

imprimePessoas(lista);
