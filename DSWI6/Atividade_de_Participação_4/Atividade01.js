function dobrarEm5Segundos(x) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const resultado = x * 2
      resolve(resultado)
    }, 5000)
  })
}

dobrarEm5Segundos(10).then((resultado) => {
  console.log("Resultado:", resultado)
})
