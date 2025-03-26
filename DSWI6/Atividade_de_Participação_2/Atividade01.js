class Vec {
    constructor(x,y) {
        this.x = x;
        this.y = y;
    }

    plus(anotherVec) {
        return new Vec(this.x + anotherVec.x, this.y + anotherVec.y);
    }

    minus(anotherVec) {
        return new Vec(this.x - anotherVec.x, this.y - anotherVec.y);
    }

    get length() {
        return Math.sqrt(this.x * this.x + this.y * this.y);
    }
}

const vetor1 = new Vec(3, 4);
const vetor2 = new Vec(1, 2);

console.log('Vetor 1:', vetor1);
console.log('Vetor 2:', vetor2);
console.log('-------------------------');

const soma = vetor1.plus(vetor2);
console.log('Soma dos vetores:', soma);
console.log('-------------------------');

const subtracao = vetor1.minus(vetor2);
console.log('Subtração dos vetores:', subtracao);
console.log('-------------------------');

console.log('Comprimento do vetor 1:', vetor1.length);
console.log('Comprimento do vetor 2:', vetor2.length);