@main=->
@main.tag='normalCaller'
@init=->

#hacking the @startModule
@startModule=__filename
require '../src/at'
module.exports=->
