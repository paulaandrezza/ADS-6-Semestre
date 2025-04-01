function toUpperCase(str) {
    let resultado = "";
    
    for (let i = 0; i < str.length; i++) {
      let char = str[i];
      
        if (char >= 'a' && char <= 'z') {
            resultado += String.fromCharCode(char.charCodeAt(0) - 32);
        } else {
            resultado += char;
        }
    }
  
    return resultado;
}
  

console.log(toUpperCase("hello world"));
console.log(toUpperCase("JavaScript"));
console.log(toUpperCase("123 abc!"));
  