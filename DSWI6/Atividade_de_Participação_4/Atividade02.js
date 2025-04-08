function doAction() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("olá mundo")
    }, 2000)
  })
}

doAction().then((resultado) => {
  console.log(resultado)
})
