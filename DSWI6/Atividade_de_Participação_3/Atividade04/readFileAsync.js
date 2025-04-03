const fs = require("fs");

let init = Date.now();

fs.readFile("example.csv", "utf8", (err, data) => {
  if (err) {
    console.error("Erro ao ler o arquivo:", err);
    return;
  }

  const linhas = data.split("\n");

  console.log("Conteúdo do arquivo (Leitura de uma só vez):");
  console.log(linhas);

  let end = Date.now();
  console.log("Tempo de leitura:", end - init, "ms");
});
