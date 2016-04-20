require '../config'
describe 'prototype_require',->
#      it "should require core modules", ->
#         @each ["at_load#{@js}", "at_require#{@js}"], (v)=> @keys(require.cache).should.have.matchAny(new RegExp v)
#      before -> @loaded_by_user.forEach (v)=> @fs.openSync("#{@user_dir}/#{v}#{@js}", 'w')
#      after -> @loaded_by_user.forEach (v)=> @fs.unlinkSync("#{@user_dir}/#{v}#{@js}")
#      it "should require user module", ->
#         @each ["load#{@js}"], (v)=> @keys(require.cache).should.have.matchAny(new RegExp "./#{v}$")
#      it "should have __proto__ which is a native Object type", ->
#         @user_normal.should.has.a.property('__proto__').which.has.a.property('__proto__', null)
