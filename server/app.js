var express = require('express'),
    app = express(),
    server = require('http').Server(app),
    cors = require('cors'),
    io = require('socket.io')(server),
    path = require('path');

app.use(cors());
app.use(express.static('/reactJs'));
app.use(express.static(path.join(__dirname, '../build/web')));

// React & CDN [Github Code](https://github.com/doyle-flutter/basicReact)
app.get('/react', (req,res) => res.sendFile(path.join(__dirname, '/reactJs/react.html')));

// RestAPI
app.get('/data/all', (req,res) => res.json({
    client: req.headers["user-agent"],
    title : 'MyNodeJsServer',
    data : 'MyNodeJsServerData'
}));

// Flutter
app.get('*', (req,res) => res.sendFile(path.join(__dirname, '../build/web/index.html')));

// Socket.io
io.on('connection',socket => console.log("connect"));

server.listen(3003, () => console.log(3003));
// app.listen(3003, () => console.log(3003));
