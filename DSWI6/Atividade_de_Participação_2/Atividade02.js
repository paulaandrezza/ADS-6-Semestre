const deepEqual = (a, b) => {
    if (a === b) return true;

    if (typeof a !== "object" || a === null || typeof b !== "object" || b === null) {
        return false;
    }

    let keysA = Object.keys(a);
    let keysB = Object.keys(b);

    if (keysA.length !== keysB.length) return false;

    for (let key of keysA) {
        if (!keysB.includes(key) || !deepEqual(a[key], b[key])) {
            return false;
        }
    }

    return true;
}

const obj1 = { name: "João", age: 30, details: { city: "São Paulo", job: "Engenheiro" } };
const obj2 = { name: "João", age: 30, details: { city: "São Paulo", job: "Engenheiro" } };
const obj3 = { name: "Maria", age: 28, details: { city: "Rio de Janeiro", job: "Médico" } };

console.log(deepEqual(obj1, obj2));
console.log(deepEqual(obj1, obj3));