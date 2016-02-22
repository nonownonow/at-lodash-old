_=require 'lodash'
@main = ->
   @isContext=true
   @G.check=null
@tag = 'caller'
#@caller_noTDD()

@startModule = require.main.filename
require '../src/at'

