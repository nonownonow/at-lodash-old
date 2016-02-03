@main = ->
    @one = 'oen'
@init = ->
@supp = ->

@tag = 'caller'
@caller_noTDD = require './index.test.normalCaller'
@startModule = require.main.filename
require '../src/at'


