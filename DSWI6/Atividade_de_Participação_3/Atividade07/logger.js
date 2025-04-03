const util = require("util");

class Logger {
  // Definindo as cores para cada tipo de log
  static colors = {
    error: "\x1b[31m", // Vermelho para erro
    warning: "\x1b[33m", // Amarelo para aviso
    info: "\x1b[32m", // Verde para informação
    reset: "\x1b[0m", // Resetar cor
  };

  // Método privado para formatar uma mensagem
  #formatMessage(type, message) {
    // Adiciona um prefixo com o tipo de log (ERROR, WARNING, INFO)
    return `${Logger.colors[type]}${type.toUpperCase()}: ${message}${
      Logger.colors.reset
    }`;
  }

  // Método para exibir logs de info
  info(message) {
    const debugInfo = util.debuglog("INFO");
    debugInfo(this.#formatMessage("info", message));
  }

  // Método para exibir logs de erro
  error(message) {
    const debugError = util.debuglog("ERROR");
    debugError(this.#formatMessage("error", message));
  }

  // Método para exibir logs de aviso
  warning(message) {
    const debugWarning = util.debuglog("WARNING");
    debugWarning(this.#formatMessage("warning", message));
  }
}

module.exports = Logger;
