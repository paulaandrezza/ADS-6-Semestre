const firstPromise = (x) => {
  return new Promise((resolve, reject) => {
    if (x > 2) resolve(x)
    else reject("Erro firstPromise!")
  })
}

const secondPromise = (x) => {
  return new Promise((resolve, reject) => {
    if ((x + 1) % 2 === 0) resolve(x)
    else reject("Erro secondPromise!")
  })
}

const execute = (numInt) => {
  firstPromise(numInt)
    .then((data) => secondPromise(data))
    .then((data) => {
      console.log(`Value: ${numInt} | Result: ${data}`)
    })
    .catch((e) => {
      console.log(`Value: ${numInt} | Error: ${e}`)
    })
}

execute(2)
execute(4)
execute(5)
