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
      #      it "setModule",->
      #      it "baseCheck",->
      #      it "exec",->

      #      it "should make module.export's var to module.parent.export's var",->

      it "should have properties that is information of caller", ->
         caller.at.moduleName.should.be.eql('index_caller')
#describe 'object', ->
#
#describe 'function',->
#
#describe 'regex',->

