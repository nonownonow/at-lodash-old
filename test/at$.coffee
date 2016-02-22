require('./config')('a','b')
console.log 'at'

#beforeEach -> delete require.cache[k] for k of require.cache
#describe.only "load", ->
#   before -> core_files.forEach (v)-> (-> require "#{core_dir}/#{v}").should.not.throw()
#   beforeEach -> require "#{module_src}"
#   context "when supp_files isn't exist", ->
#      before -> supp_files.forEach (v)-> (-> require "#{supp_dir}/#{v}").should.throw()
#      it "should is pushed in require.cache", ->
#         core_files.forEach (v)-> Object.keys(require.cache).should.have.matchAny(new RegExp "#{core_dir}/#{v}.+$")
#   context "when supp_files exist", ->
#      before -> supp_files.forEach (v)-> fs.openSync("#{supp_dir}/#{v}.js", 'w')
#      after -> supp_files.forEach (v)-> fs.unlinkSync("#{supp_dir}/#{v}.js")
#      it "should is pushed in require.cache", ->
#         supp_files.forEach (v)-> Object.keys(require.cache).should.have.matchAny(new RegExp "#{supp_dir}/#{v}.+$")
#describe "at", (test)->
#   mocks=( v.replace('.js','') for v in fs.readdirSync('.') when not _.endsWith(v,'map') and _.includes(v,'at') )
#   .forEach (v)=>@[v]=require "./#{v}"
#   at_str=fs.readFileSync("../index#{extension}",'utf8')
#   at_without_main_str = at_str.replace(/^@main[\w\W]+?(?=^[^\s])/m, '')
#   at_without_supp_init_str=at_str.replace(/^(@supp|@init)[\w\W]+?(?=^[^\s])/mg,'')
#   beforeEach -> at = require './at_with_main'
#   it 'should not cached in require.cache', ->
#      Object.keys(require.cache).should.not.have.matchAny(new RegExp "/src/at.+$")
#   it 'should be a function',=>
#      @at_with_main.should.be.a.Function()
#      @at_with_main.should.be.property('name')
#   describe "::main",->
#      context "when don't have main function", ->
#         beforeEach -> fs.writeFileSync("../index#{extension}",at_without_main_str)
#         afterEach -> fs.writeFileSync("../index#{extension}",at_str)
#         it "should throw error", ->
#            (->require '../').should.throw('should must have main')
#      context "when have main function",->
#         it 'should be a module.exports', ->
#            at.should.have.property('main').which.is.a.Function()
#   describe "::context",->
#      context "when parent is mocha",->
#         it "should have a property, 'context'",->
#            at.should.have.a.property('context')
#      context "when parent is not mocha",->
#         it "should have not a property, 'context'",->
#            at.should.not.have.a.property('context')


#      before ->
#         fs.writeFileSync("../index#{extension}",at_without_supp_init_str)
#      it "should not thorw error",->


#      at.should.be.a.Function() #      caller.should.have.a.property('at_caller') #   describe "at_load",-> #      at_load=require '../src/at_load' #      before -> #         process.config.at._test #      it "is about value",-> #         at_load.should.have.property('G') #      it "is about function",-> #describe "at_function", -> #   describe "@extend", -> #   describe "@at",->
### describe "at_function", ->
   beforeEach -> caller = require './at_caller'
   describe "@setAliases(obj)", ->
      target_ctx = testFn: (->), fn_err: (->)
      context "when the obj.key value not present in module.exports's key", ->
         it "should set aliasName about obj.value which is function in module.exports", ->
            caller.context.setAliases target_ctx, testFn: 'fn'
            caller.context.setAliases target_ctx, testFn: 'fn2'
            target_ctx.should.not.be.empty
            target_ctx.should.have.enumerables('fn', 'fn2')
      context "when the obj.key name present in module.exports", ->
         it "should throw error", ->
            (-> caller.context.setAliases target_ctx, testFn: 'fn_err').should.throw()
   describe "at[variable]", ->
      it "is about caller's information", ->
         caller.context.should.be.not.empty()
         caller.context.moduleName.should.be.eql('at_caller')
describe "caller", ->
   caller = require './at_caller'
   caller_noTDD = require './at_caller_noTDD'
   context "when is called by TDD api mocha #caller", ->
      it "should make module.parent.export.main function to module.parent.export and at is not cashed by nodejs", ->
         caller.should.be.a.Function
      it "should make parent module's var module.parent.export.main function's var", ->
         caller.should.a.Function().which.has.a.property('tag', 'caller')
      it "should have property 'context' which is context", ->
         caller()
         caller.should.have.a.property('context')
         caller.context.should.have.a.enumerable('isContext').which.is.a.true
   context "when is called by node #caller", ->
      it "should have not property 'context' which is context", ->
         caller_noTDD.should.have.not.a.property('context')

describe "caller.context[variable]", ->
   caller = require './at_caller'
   describe "@[variable]", ->
      it "should have reference of process.config.at which is accepted globally", ->
         caller.context.G.should.have.a.property('check')
      describe "regex", ->
describe "caller.context[function]", ->
   caller = require './at_caller'
   describe "main function", ->
      describe "@fork", ->
      describe "@go", ->
   describe "supp function", ->
      context "when module.parent.exports has supp function", ->
         it "should have function of context which of supp", ->
            caller.context.should.have.enumerable('supp_fn1').which.is.a.Function
            caller.context.should.have.enumerable('supp_fn2').which.is.a.Function
      caller_opp = require './at_caller_opp'
      context "when module.parent.exports has not 'supp' function", ->
         it "should not have function of context wich of supp", ->
            caller_opp.context.should.have.not.enumerable('supp_fn1')
   describe "FDD", ->### #      it "baseCheck",-> #      it "exec",->

#      it "should make module.export's var to module.parent.export's var",->

