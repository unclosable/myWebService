
var port = process.env.PORT || 5566;
var log4js = require('log4js');
log4js.configure('my_log4js_configuration.json', { cwd: './log' });
var logger = log4js.getLogger('relative-logger');
var server = require('http').createServer();
var io = require('socket.io')(server);
var overCount  = 0;
io.on('connection', function(socket){
  logger.info('<CONNECT>'+socket.id);
  socket.on('disconnect', function(){
    logger.info('<DISCONNECT>'+socket.id);
  });
  socket.on('message',function(data){
    logger.info('<MESSAGE>'+socket.id+'#'+data);
    socket.broadcast.emit('message',data);
  });
});
server.listen(port);
logger.info('<SERVET START AT>'+ port);
