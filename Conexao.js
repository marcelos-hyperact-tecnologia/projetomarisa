var bancoMysql = require('mysql');

class Conexao {

    static connect(){
        var connection = bancoMysql.createConnection({
            host : 'localhost',
            user : 'root',
            port: '3307',
            password: '123456',
            database: 'projetomarisa'
        });

        connection.connect();
        return connection;
    }
}

module.exports = Conexao;