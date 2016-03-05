_ = @__proto__ = require 'lodash'
u = require 'underscore'
U = require 'underscore-contrib'
s = require 'underscore.string'

_.mixin s.exports()
u_FDD = _.intersection (_.keys _), (_.keys U)
_.each u_FDD, (v)-> U["u_#{v}"] = U[v]
_.assign @, U
_.assign @, u
_.assign @, _

@set_aliases = (obj)-> _.each obj, (v, k)=> @[k] = @[v]
@set_function_name = ->
   _.each _.functions(@), (v)=>
      Object.defineProperty @[v],'name',{writable:true}
      @[v].name=v
@set_function_name()
@set_aliases
   c:'constant'
   u:'splat'
   n:'modArgs'
   no:'negate'
   i:'identity'
   it:'iterator'
   $:'curryRight'
   S:'partialRight'
   v:'flow'
@set_unary_function=(obj)->
   _.each obj, (v,k)=> @[k]=_.ary @[v],1
@set_unary_function
   SS:'partialRight'
   $$:'curryRight'
   vv:'flowRight'

#   Object.defineProperty @main,'name',{writable:true}

@fs = require 'fs'
@path = require 'path'
@console = require('tracer').console
   format: "{{message}} {{file}}:{{line}} {{title}}",
   dateformat: "HH:MM:ss.L"
   inspectOpt:
      depth: 12
@log = @console.log

