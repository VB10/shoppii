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
    // socket.on('chat message', function (msg) {
    //     io.emit('chat message', msg);
    //     console.log("HEEE");
    // });
    socket.on(socketConstants.SOCKET_PRODUCT, async function (msg) {
        console.log(msg);
        var isOkey = await productController.updateProduct(msg);
        if (isOkey) {
            socket.emit(socketConstants.SOCKET_PRODUCT_DELIVERY)
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

app.use(cors());
app.use(bodyParser.json());
// app.use(router);

app.use(productController.router);