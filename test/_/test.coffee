_=require 'lodash'
sinon=require 'sinon'
should=require 'should'
require 'should-sinon'
PubSub=require 'pubsub-js'

message='an example message'
error ='an error message'

cb=sinon.spy()
unary_cb=_.ary cb,1
unary_cb(2,2,3)
cb.should.be.alwaysCalledWithExactly(2)
#cb(1)
#cb=sinon.spy()
#cb(1,2,3)
#console.log cb.should.be.alwaysCalledWith(1,2,3)
