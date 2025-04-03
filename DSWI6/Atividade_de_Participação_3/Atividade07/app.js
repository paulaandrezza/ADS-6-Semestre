const Logger = require("./logger.js");
const logger = new Logger();

logger.error("Acesso não autorizado!");
logger.warning("Atenção: Dados podem não estar atualizados!");
logger.info("Operação realizada com sucesso!");
logger.info("Mensagem informativa com mais detalhes.");
