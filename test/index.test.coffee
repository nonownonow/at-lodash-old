should = require 'should'
sinon = require 'sinon'
require 'should-sinon'

caller = require './index_caller'
#normal_caller

describe "at", ->
   context "when 'at' be called by module.parent.export, it initialize module.parent.export", ->
      it "should make module.parent.export.main function to module.parent.export and at is not cashed by nodejs", ->
      it "should make parent module's var module.parent.export.main function's var", ->
         caller.should.a.Function().which.has.a.property('tag', 'caller')
      it "should have property 'at' , context of caller when noTDD", ->
         caller.should.have.a.property('at')
         caller.caller_noTDD.should.have.not.a.property('at')
      it "should have external module in it's context", ->
         caller.at.should.have.property('flowRight').which.is.Function
      it "should have area as global area and called only onece area", ->
         caller.at.G.should.have.a.property('check')
      #      it "baseCheck",->
      #      it "exec",->

      #      it "should make module.export's var to module.parent.export's var",->

      it "should have properties that is information of caller", ->
         caller.at.moduleName.should.be.eql('index_caller')
describe "at : function.core", ->
   describe "@setAliases(obj)", ->
      context "when the obj.key name not present in module.exports", ->
         it "should set aliasName about obj.value which is function in module.exports"
      context "when the obj.key name present in module.exports", ->
         it "should throw error", ->

describe "at : function.util", ->
   it "is about util", ->

describe 'load module', ->
   it "is about FDD", ->
      caller.at.should.have.property('iterators')
      caller.at.should.have.property('extendOwn')
      caller.at.u_repeat(5, 'a').should.be.eql(['a', 'a', 'a', 'a', 'a'])
      caller.at.setAliases($setAliases_test: 'add')
      caller.at.should.have.property('$setAliases_test').name('add')
   it 'is about core util', ->
      caller.at.should.have.property('s').which.have.a.property('levenshtein')
      caller.at.should.have.property('r').which.have.a.property('XRegExp')
      caller.at.should.have.property('log').which.have.a.property('debug')
      caller.at.should.have.property('levenshtein')
      String::should.have.property('between')
#      $setAliases(all:'add').should.throw()
#
#describe 'function',->
#
#describe 'regex',->

