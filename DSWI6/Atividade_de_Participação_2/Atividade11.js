function myEvery(array, func) {
    for (let i = 0; i < array.length; i++) {
        if (!func(array[i])) {
            return false;
        }
    }
    
    return true;
}

console.log(myEvery([1, 2, 3, 4], num => num > 0));
console.log(myEvery([1, 2, 3, 4], num => num < 4));
console.log(myEvery([1, 2, 3, 4], num => num % 2 === 0));
  