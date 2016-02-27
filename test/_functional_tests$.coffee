require "./_config"
require "./user/normal"
beforeEach -> delete require.cache[k] for k of require.cache
# FDD perspective
describe "user_normal",->
   beforeEach -> @user_normal = require './user/normal'
   it "should require module 'at'",->
      @user_normal.should.be.a.Object().which.has.a.property('at_version')
      Object.keys(require.cache).should.not.have.matchAny(new RegExp "at#{@ext}$")
   it "should have __proto__ which is a native Object type",->
      @user_normal.should.has.a.property('__proto__').which.has.a.property('__proto__',null)
describe "#[main]",->
   it "should has setter",->
   it "should create a property ##{@user_at} which eql the property - #[main]",->
   describe "static functions which bounded context to #[main]",->

# ODD perspective
describe "#[User]",->
   describe "::new()",->
      it "should initiate member",->
      it "should be a object",->
      describe "::[method]",->
   describe "::new()::$()",->
      it "should initiate member",->
      it "should be a object",->
      describe "::[method_chainable]",->
# delegation
describe "user_extended",->
   context "two module loaded, 'at' called by user_extended exclud each module __proto__ until 1depth, and merge one __proto__",->
