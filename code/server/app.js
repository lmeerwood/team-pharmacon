var express = require('express');
var path = require('path');
var mysql =require('mysql');

var app = express();


app.use('/node_modules', express.static(path.join(__dirname, 'node_modules')));

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));



// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

app.use(function (req, res, next) {
    console.warn('Time: %d', Date.now());
    next();
});

module.exports = app;
