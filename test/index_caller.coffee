@main = ->
   @one = 'oen'
@init = ->
@supp = ->

@tag = 'caller'
@caller_noTDD = require './index_caller_noTDD'
@caller_noTDD()

@startModule = require.main.filename
require '../src/at'


