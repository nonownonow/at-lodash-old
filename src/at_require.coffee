@fs = require 'fs'
@path = require 'path'
#@r = require 'xregexp'
@console = require('tracer').console
   format: "{{message}} {{file}}:{{line}} {{title}}",
   dateformat: "HH:MM:ss.L"
   inspectOpt:
      depth: 12
@log=@console.log
_ = require 'lodash'
s = require 'underscore.string'
_.mixin s.exports()

u = require 'underscore'
U = require 'underscore-contrib'
u_FDD = _.intersection (_.keys _), (_.keys U)
_.each u_FDD, (v)-> U["u_#{v}"] = U[v]
_.assign @, U
_.assign @, u
_.assign @, _

