var a = 1;
let b = 2;
const c = 3;

console.log(`a: ${a}`);
console.log(`b: ${b}`);
console.log(`c: ${c}\n`);

a = 10;
console.log(`a: ${a}`); // 'a' é reatribuída para 10

b = 20;
console.log(`b: ${b}`); // 'b' é reatribuída para 20

c = 30;
console.log(`c: ${c}`); // ERRO! 'const' não permite reatribuição