require '../config'
that=@

describe 'at-lodash',->
   beforeEach -> delete require.cache[k] for k of require.cache
   describe "user_normal", ->
      beforeEach -> @user_normal=require './user/normal'
      it "should require module 'at'", ->
         @user_normal.should.be.a.Object().which.has.a.property('at_version')
#         that.should.be.a.property 'main'
      it 'should not cached in require.cache', ->
         Object.keys(require.cache).should.not.have.matchAny(new RegExp "/src/at-lodash.js")
      context 'when has main property',->
         it 'should be a function',=>
            @user_normal.main.should.be.a.Function()
#      @at_with_main.should.be.property('name')
