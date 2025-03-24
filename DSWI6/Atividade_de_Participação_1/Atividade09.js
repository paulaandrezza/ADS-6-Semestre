function add(value1, value2) {
    return value1 + value2;
}

const multiply = (value1, value2) => {
    return value1 * value2;
}

const executeFunction = (func, value1, value2) => {
    return func(value1, value2);
}

console.log(executeFunction(add, 2, 3)); // 5
console.log(executeFunction(multiply, 2, 3)); // 6