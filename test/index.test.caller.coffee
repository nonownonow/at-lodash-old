@main = ->
  @one = 'oen'
@main.tag = 'caller'
@init = ->
@supp = ->

@caller_noTDD=require './index.test.normalCaller'
@startModule=require.main.filename
require '../src/at'


