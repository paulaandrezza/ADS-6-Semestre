function callbackSuccess(result) {
  console.log(`Resposta gerada com sucesso: ${result} é um número par`)
  console.log("-------------------------------------------------------\n")
}

function callbackError(result) {
  console.log(`Erro: ${result} é um número ímpar`)
  console.log("-------------------------------------------------------\n")
}

function sum(a, b) {
  return new Promise((resolve, reject) => {
    const result = a + b

    if (result % 2 === 0) {
      resolve(result)
    } else {
      reject(result)
    }
  })
}

function executeSum(a, b) {
  sum(a, b).then(callbackSuccess).catch(callbackError)
}

executeSum(2, 4)
executeSum(3, 4)
