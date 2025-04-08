function CustomPromisse(x) {
  return new Promise((resolve, reject) => {
    if (typeof x !== "number") reject("Erro!")
    else if (x % 2 !== 0)
      setTimeout(() => {
        resolve(x)
      }, 1000)
    else
      setTimeout(() => {
        reject(x)
      }, 2000)
  })
}

CustomPromisse("Paula").catch(console.log)
CustomPromisse(1).then(console.log)
CustomPromisse(2).catch(console.log)
