_=require 'lodash'
@main = ->
   @isContext=true
   @G.check=null
@init = ->
@supp = ->
   @supp_fn1=->
   @supp_fn2=->

@tag = 'caller'
#@caller_noTDD()

@startModule = require.main.filename
require '../src/at'


