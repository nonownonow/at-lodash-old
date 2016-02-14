var fs, should, sinon;

should = require('should');

sinon = require('sinon');

require('should-sinon');

fs = require('fs');

process.chdir(__dirname);

beforeEach(function() {
  var k, results;
  results = [];
  for (k in require.cache) {
    results.push(delete require.cache[k]);
  }
  return results;
});

describe("at", function() {
  var core_dir, core_files, supp_dir, supp_files;
  core_files = ["at_require", "at_load"];
  supp_files = ["load"];
  core_dir = "../src";
  supp_dir = ".";
  return describe("load", function() {
    context("when supp_files isn't exist", function() {
      before(function() {
        var k, results;
        core_files.forEach(function(v) {
          return (function() {
            return require(core_dir + "/" + v);
          }).should.not["throw"]();
        });
        supp_files.forEach(function(v) {
          return (function() {
            return require(supp_dir + "/" + v);
          }).should["throw"]();
        });
        results = [];
        for (k in require.cache) {
          results.push(delete require.cache[k]);
        }
        return results;
      });
      return it("should is pushed in require.cache", function() {
        require('./at_caller');
        return core_files.forEach(function(v) {
          return Object.keys(require.cache).should.have.matchAny(new RegExp(core_dir + "/" + v + ".+$"));
        });
      });
    });
    return context("when supp_files exist", function() {
      before(function() {
        var k, results;
        core_files.forEach(function(v) {
          return (function() {
            return require(core_dir + "/" + v);
          }).should.not["throw"]();
        });
        supp_files.forEach(function(v) {
          return fs.openSync(supp_dir + "/" + v + ".js", 'w');
        });
        results = [];
        for (k in require.cache) {
          results.push(delete require.cache[k]);
        }
        return results;
      });
      after(function() {
        return supp_files.forEach(function(v) {
          return fs.unlinkSync(supp_dir + "/" + v + ".js");
        });
      });
      return it("should is pushed in require.cache", function() {
        require('./at_caller');
        return supp_files.forEach(function(v) {
          return Object.keys(require.cache).should.have.matchAny(new RegExp(supp_dir + "/" + v + ".+$"));
        });

        /*
        describe "at_function", ->
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
           describe "FDD", ->
         */
      });
    });
  });
});

//# sourceMappingURL=at_test.js.map
