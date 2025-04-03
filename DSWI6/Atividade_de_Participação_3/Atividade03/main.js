const {
  quilogramaParaLibra,
  metroParaPe,
  celsiusParaFahrenheit,
} = require("./conversor");

const quilogramas = 5;
const metros = 10;
const celsius = 25;

const libras = quilogramaParaLibra(quilogramas);

const pes = metroParaPe(metros);

const fahrenheit = celsiusParaFahrenheit(celsius);

console.log(`Quilogramas para Libras: ${quilogramas} kg = ${libras} lb`);
console.log(`Metros para Pés: ${metros} m = ${pes} ft`);
console.log(`Celsius para Fahrenheit: ${celsius}°C = ${fahrenheit}°F`);
