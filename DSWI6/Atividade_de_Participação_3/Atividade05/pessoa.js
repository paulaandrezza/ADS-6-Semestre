class Pessoa {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }

  toString() {
    return `Nome: ${this.nome} - Idade: ${this.idade} `;
  }
}
module.exports = {
  Pessoa,
  imprimePessoas: function (pessoas) {
    for (let p of pessoas) {
      console.log(p.toString());
    }
  },
};
