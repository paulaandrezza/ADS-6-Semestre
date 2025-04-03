// conversor.js

function quilogramaParaLibra(quilogramas) {
  return quilogramas * 2.20462;
}

function metroParaPe(metros) {
  return metros * 3.28084;
}

function celsiusParaFahrenheit(celsius) {
  return (celsius * 9) / 5 + 32;
}

module.exports = {
  quilogramaParaLibra,
  metroParaPe,
  celsiusParaFahrenheit,
};
