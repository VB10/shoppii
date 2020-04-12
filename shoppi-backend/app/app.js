// var express = require('express');
const mongoose = require("mongoose");
const bodyParser = require('body-parser');
const httpStatusCode = require('http-status-codes');
var cors = require('cors');


var app = require('express')();
const router = require('express').Router();
const port = process.env.PORT || 4000;
const socketConstants = require('./constants/socket_constants');

var http = require('http').Server(app);
var io = require('socket.io')(http);
const productController = require('./controllers/product_controller');

mongoose.connect("mongodb://localhost/product", {
    useNewUrlParser: true,
    useUnifiedTopology: true
});

// chat app 
app.get('/', function (req, res) {
    res.sendFile(__dirname + '/public/index.html');
});

io.on(socketConstants.SOCKET_CONNECTION, function (socket) {
    socket.on('chat message', function (msg) {
        io.emit('chat message', msg);
    });
    socket.on(socketConstants.SOCKET_PRODUCT, async function (msg) {
        var isOkey = await productController.updateProduct(msg);
        if (isOkey) {
            var jsonModel = JSON.parse(msg);
            io.emit(socketConstants.SOCKET_PRODUCT_DELIVERY, jsonModel.model)
        } else {
            console.log(isOkey);
        }
    });
});

http.listen(port, function () {
    console.log('listening on *:' + port);
});
app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});


app.use(bodyParser.json());
app.use(productController.router);