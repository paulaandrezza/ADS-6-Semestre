const fs = require("fs");
const readline = require("readline");

const arquivo = process.argv[2];

if (!arquivo) {
  console.log("Por favor, forneça o nome do arquivo como argumento.");
  process.exit(1);
}

const rl = readline.createInterface({
  input: fs.createReadStream(arquivo),
  output: process.stdout,
  terminal: false,
});

rl.on("line", (linha) => {
  console.log(linha);
});

rl.on("close", () => {
  console.log("Leitura do arquivo concluída.");
});
