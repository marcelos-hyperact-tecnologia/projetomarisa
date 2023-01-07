let express = require('express');
let app = express();
let bodyParser = require('body-parser')
let bancodados = require('./Conexao');

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.get('/', function(req, res){
    res.send('API projeto Marisa');
});


app.get('/medicos', function(req,res){
    let connection = bancodados.connect();    
    let sql = "select * from medico";
    let query = connection.query(sql, function(error, results, fields){
        if(error){
            throw error;
        }else{
            res.send(results);
        }
    });

});



let  server = app.listen(5000, function(){
    let host = server.address().address;
    let port = server.address().port;
    console.log("Servidor ativo em: http://%s:%s", host,port);
});

