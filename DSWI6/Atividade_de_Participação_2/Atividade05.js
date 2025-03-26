const prepend = (element, lista) => {
    return {
        valor: element,
        restante: lista
    };
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

let novaLista = prepend(0, lista);
console.log(JSON.stringify(novaLista, null, 2));