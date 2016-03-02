require "./_config"
#extract global file the global beforeEach
# at itself be tested by _functional_tests and function in at be tested by at$
# FDD perspective
describe "user_normal", ->
   it "should require module 'at'", ->
      @user_normal.should.be.a.Object().which.has.a.property('at_version')
      @keys(require.cache).should.not.have.matchAny(new RegExp "/at#{@js}$")
   it "should have __proto__ which is a native Object type", ->
      @user_normal.should.has.a.property('__proto__').which.has.a.property('__proto__', null)

describe "user_normal | load |", ->
   before -> @loaded_by_at.forEach (v)=> (=> require "#{@at_dir}/#{v}").should.not.throw()
   it "should require core modules", ->
      @each ["at_load#{@js}", "at_require#{@js}"], (v)=> @keys(require.cache).should.have.matchAny(new RegExp v)
   before -> @loaded_by_user.forEach (v)=> @fs.openSync("#{@user_dir}/#{v}#{@js}", 'w')
   after -> @loaded_by_user.forEach (v)=> @fs.unlinkSync("#{@user_dir}/#{v}#{@js}")
   it "should require user module", ->
      @each ["load#{@js}"], (v)=> @keys(require.cache).should.have.matchAny(new RegExp "./#{v}$")

describe "#[main]", ->
   it "should has setter", ->
   it "should create a property ##{@user_at} which eql the property - #[main]", ->
   describe "static functions which bounded context to #[main]", ->

# ODD perspective
describe "#[User]", ->
   describe "::new()", ->
      it "should initiate member", ->
      it "should be a object", ->
      describe "::[method]", ->
   describe "::new()::$()", ->
      it "should initiate member", ->
      it "should be a object", ->
      describe "::[method_chainable]", ->
# delegation
describe "user_extended", ->
   context "two module loaded, 'at' called by user_extended exclud each module __proto__ until 1depth, and merge one __proto__", ->
