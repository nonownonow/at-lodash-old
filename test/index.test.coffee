should = require 'should'
sinon = require 'sinon'
require 'should-sinon'

caller = require './index.test.caller'
#normal_caller

describe "caller", ->
    context "when after calling at", ->
        it "should have module.export which is becamed with a '@main' function,and at is not cashed by nodejs", ->
            caller.should.a.Function().which.has.a.property('tag', 'caller')
        it "should have property 'at' , context of caller when noTDD",->
            caller.should.have.a.property('at')
            caller.caller_noTDD.should.have.not.a.property('at')
#        it "should have properties that is information of caller",->

#describe 'at',->
#
#describe 'object',->
#
#describe 'function',->
#
#describe 'regex',->

