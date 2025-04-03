const fs = require("fs");

let init = Date.now();

const stream = fs.createReadStream("example.csv", "utf8");

let data = "";

stream.on("data", (chunk) => {
  data += chunk;
});

stream.on("end", () => {
  const linhas = data.split("\n");

  console.log("Conteúdo do arquivo (Leitura em fluxo):");
  console.log(linhas);

  let end = Date.now();
  console.log("Tempo de leitura:", end - init, "ms");
});

stream.on("error", (err) => {
  console.error("Erro ao ler o arquivo:", err);
});
