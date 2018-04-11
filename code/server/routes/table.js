var express = require('express');
var mysql = require('mysql');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {

    var connection = mysql.createConnection({
        host: 'localhost',
        port: '3306',
        user: 'pet_user',
        password: 'password',
        database: 'testdatabase'
    });
    connection.connect();

    connection.query('SELECT * from testData', function (error, results, fields) {
        //connection.disconnect();
        if (error) {
            res.send(JSON.stringify({"status": 500, "error": error, "response": null}));
        } else {
            res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
        }
    });
});

router.post('/', function(req, res, next) {
    var ip = req.connection.remoteAddress;

    var connection = mysql.createConnection({
        host: 'localhost',
        port: '3306',
        user: 'pet_user',
        password: 'password',
        database: 'testdatabase'
    });
    connection.connect();

    let query = "INSERT INTO testData(address) " +
        "VALUES('" + ip + "');"

    connection.query(query, function (error, results, fields) {
        //connection.disconnect();
        if (error) {
            res.send(JSON.stringify({"status": 500, "error": error, "response": null}));
        } else {
            res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
        }
    });
});

module.exports = router;
