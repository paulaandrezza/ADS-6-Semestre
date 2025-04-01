const listToArray = (lista) => {
    let array = [];
  
    while (lista !== null) {
      array.push(lista.valor);
      lista = lista.restante;
    }
  
    return array;
}

let lista = {
    valor: 1,
    restante: {
        valor: 2,
        restante: {
            valor: 3,
            restante: null
        }
    }
};

let array = listToArray(lista);
console.log(array);