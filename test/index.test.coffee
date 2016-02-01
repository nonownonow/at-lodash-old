should=require 'should'
sinon=require 'sinon'
require 'should-sinon'

caller=require './index.test.caller'
#normal_caller

describe "caller",->
  context "when after calling at",->
    it "should have module.export which is becamed with a '@main' function,and at is not cashed by nodejs",->
      caller.should.a.Function().which.has.a.property('tag','caller')
    it "should have properties including 'id' that's value includes 'mocha'",->
      caller.should.have.a.property('id').containEql('mocha')
      caller.should.have.a.property('at')
      caller.caller_noTDD.should.have.not.a.property('at')
#      normal_caller.should.not.have.a.property('ctx')
#      caller.should.have.a.property('id').includes('mocha').should.be.true
#    it 'should have context reormed by at', ->
#describe 'index',->
#
#describe 'object',->
#
#describe 'function',->
#
#describe 'regex',->

