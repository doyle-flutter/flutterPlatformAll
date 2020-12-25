var express = require('express'),
    app = express(),
    path = require('path');

app.use(express.static(path.join(__dirname, '../build/web')));
app.get('*', (req,res) => res.sendFile(path.join(__dirname, '../build/web/index.html')));
app.listen(3003, () => console.log(3003));
