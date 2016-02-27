fs=require 'fs'

bufferSize=8
read=fs.createReadStream 'pull.js',
   bufferSize:bufferSize
write=fs.createWriteStream 'output.txt'

read.on 'data',(data)->
   console.log 'read: data'
.on 'end', -> console.log 'read: end'
.on 'e'
read.pipe write