function dataPorExtenso(data) {
    const meses = [
        "janeiro", "fevereiro", "março", "abril", "maio", "junho",
        "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"
    ];
  
    const partes = data.split("/");
  
    const dia = partes[0];
    const mes = parseInt(partes[1], 10) - 1;
    const ano = partes[2];
  
    return `${dia} de ${meses[mes]} de ${ano}`;
}
  
const data = "22/04/1983";
console.log(dataPorExtenso(data));
  