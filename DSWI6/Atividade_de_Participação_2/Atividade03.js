const arrayToList = (arr) => {
    if (arr.length === 0) {
        return null;
    }

    return {
        valor: arr[0],
        restante: arrayToList(arr.slice(1))
    }
}

let lista = arrayToList([1, 2, 3]);
console.log(JSON.stringify(lista, null, 2));