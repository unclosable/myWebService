
var port = process.env.PORT || 5566;
var logger = require('tracer').console();
var server = require('http').createServer();
var io = require('socket.io')(server);
var overCount  = 0;
io.on('connection', function(socket){
  
  socket.on('overtimes',function(data){
    logger.info('overtimes: '+ data);
    overCount = data;
    socket.broadcast.emit('overtimes',data); 
  })
  socket.on('overtimes_new',function(data){
    logger.info('overtimes_new: '+ data);
    socket.broadcast.emit('overtimes_new',data); 
  })
  socket.on('event', function(data){
    logger.info('event data: '+ data);
  });
  socket.on('disconnect', function(){
    logger.warn('disconnect socket io server');
  });
  socket.emit('overtimes',overCount); 
});
server.listen(port);
logger.info('server started at: '+ port);
