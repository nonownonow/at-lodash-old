should = require 'should'
sinon = require 'sinon'
require 'should-sinon'
caller = require './at_caller'

beforeEach ->
afterEach ->
describe "at[module]", ->
   at_module=require '../src/at_module'
   it "is about FDD", ->
      at_module.should.have.properties('flowRight','iterators','extendOwn')
      caller.context
      .should.have.properties('flowRight','iterators','extendOwn')
      .and.have.property('flowRight').which.is.Function
      caller.context.u_repeat(5, 'a').should.be.eql(['a', 'a', 'a', 'a', 'a'])

   it 'is about core util', ->
      caller.context.should.have.property('s').which.have.a.property('levenshtein')
      caller.context.should.have.property('r').which.have.a.property('XRegExp')
      caller.context.should.have.property('log').which.have.a.property('debug')
      caller.context.should.have.property('levenshtein')
      String::should.have.property('between')
describe "at[function]", ->
#   describe "@extend",->
#   describe "@at",->
   describe "@setAliases(obj)", ->
      target=testFn:(->) , fn_err:(->)
      caller.context.setAliases target,testFn:'fn'
      caller.context.setAliases target,testFn:'fn2'
      context "when the obj.key value not present in module.exports's key", ->
         it "should set aliasName about obj.value which is function in module.exports",->
            target.should.not.be.empty
            target.should.have.enumerables('fn','fn2')
      context "when the obj.key name present in module.exports", ->
         it "should throw error",->
            (-> caller.context.setAliases target, testFn:'fn_err').should.throw()
describe "at[variable]",->
   it "is about caller's information", ->
      caller.context.should.be.not.empty()
      caller.context.moduleName.should.be.eql('at_caller')

describe "caller",->
   caller_noTDD = require './at_caller_noTDD'
   context "when is called by TDD api mocha #caller",->
      it "should make module.parent.export.main function to module.parent.export and at is not cashed by nodejs", ->
         caller.should.be.a.Function
      it "should make parent module's var module.parent.export.main function's var", ->
         caller.should.a.Function().which.has.a.property('tag', 'caller')
      it "should have property 'context' which is context", ->
         caller()
         caller.should.have.a.property('context')
         caller.context.should.have.a.enumerable('isContext').which.is.a.true
   context "when is called by node #caller",->
      it "should have not property 'context' which is context" , ->
         caller_noTDD.should.have.not.a.property('context')

describe "caller.context[variable]",->
   describe "@[variable]",->
      it "should have reference of process.config.at which is accepted globally",->
         caller.context.G.should.have.a.property('check')
      describe "regex",->
describe "caller.context[function]",->
   describe "main function",->
      describe "@fork",->
      describe "@go",->
   describe "supp function",->
      context "when module.parent.exports has supp function",->
         it "should have function of context which of supp",->
            caller.context.should.have.enumerable('supp_fn1').which.is.a.Function
            caller.context.should.have.enumerable('supp_fn2').which.is.a.Function
      caller_opp= require './at_caller_opp'
      context "when module.parent.exports has not 'supp' function",->
         it "should not have function of context wich of supp",->
            caller_opp.context.should.have.not.enumerable('supp_fn1')
   describe "FDD",->
      #      it "baseCheck",->
      #      it "exec",->

      #      it "should make module.export's var to module.parent.export's var",->

