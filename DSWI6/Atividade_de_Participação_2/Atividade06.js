const nth = (lista, index) => {
    let count = 0;
  
    while (lista !== null) {
        if (count === index) {
            return lista.valor;
        }
        lista = lista.restante;
        count++;
    }
  
    return undefined;
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
  
console.log(nth(lista, 0));
console.log(nth(lista, 1));
console.log(nth(lista, 2));
console.log(nth(lista, 3));
  