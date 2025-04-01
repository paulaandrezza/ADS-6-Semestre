const arrayDeArrays = [[1, 2, 3], [4, 5], [6]];

const arrayAchado = arrayDeArrays.reduce((acumulador, atual) => {
    return acumulador.concat(atual);
}, []);

console.log(arrayAchado);
