_ = require 'lodash'
@s = require 'underscore.string'
_.mixin @s.exports()
u = require 'underscore'
U = require 'underscore-contrib'
@S = require 'string'
@S.extendPrototype()
main = module.parent.exports.main.bind @
_.assign main, module.parent.exports
_.each require.cache, (v, k, cache)->
   delete cache[k] if /at[.](?:js|coffee)/.test k
@__proto__ = new (->)
u_FDD = _.intersection (_.keys _), (_.keys U)
_.each u_FDD, (v)-> U["u_#{v}"] = U[v]
_.assign @__proto__, U
_.assign @__proto__, u
_.assign @__proto__, _
path = require 'path'
@r = require 'xregexp'

@log = require('tracer').console
   format: "{{message}} {{file}}:{{line}} {{title}}",
   dateformat: "HH:MM:ss.L"
   inspectOpt:
      depth: 12

unless process.config.isLoadedAT
   process.config.isLoadedAT = !process.config.isLoadedAT
   process.config.at = {}
@G = process.config.at

@moduleName = (path.basename module.parent.id).replace(/[.](?:js|coffee)/, '')
#@set process.config,'at',{}
# when parent is 'mocha', exclude context

@setAliases = (target,source)->
   @each source, (v,k)->
      if v of target
         throw "target should not have key:#{v}"
      target[v]=target[k]
#         throw new Error 'err'

main.supp?.call @
isTDD = main.startModule isnt module.parent.filename
main.context = @ if isTDD

module.parent.exports = main
module.exports=->


