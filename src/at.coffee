_ = require 'lodash'
_.each require.cache, (v, k, cache)-> delete cache[k] if /src\/at[.].+/.test k
parentDir = module.parent.filename.match(/(.+)\/.+/)?[1]
#throw new Error('should must have main') unless 'main' in _.keys @
#@__proto__ = (->)
#require_files = [
#   "./at_require"
#   "./at_load"
#   "#{parentDir}/load"
#].forEach (v)=> try Object.assign @, require v

[
   "./at_require"
   "./at_load"
   "#{parentDir}/load"
].forEach (v,k)=>
   try
      req=require v
      preproto=@__proto__
      @__proto__=req
      @__proto__.__proto__=preproto


module.parent.exports.__proto__ = module.exports
#main = module.parent.exports.main.bind @
#_.assign main, module.parent.exports
#_.each require.cache, (v, k, cache)->
#   delete cache[k] if /at[.](?:js|coffee)/.test k
#path = require 'path'
#
#
#unless process.config.isLoadedAT
#   process.config.isLoadedAT = !process.config.isLoadedAT
#   process.config.at = {}
#@G = process.config.at
#
#@moduleName = (path.basename module.parent.id).replace(/[.](?:js|coffee)/, '')
##@set process.config,'at',{}
## when parent is 'mocha', exclude context
#
#@setAliases = (target, source)->
#   _.each source, (v, k)->
#      if v of target
#         throw "target should not have key:#{v}"
#      target[v] = target[k]
##         throw new Error 'err'
#
#main.supp?.call @
#isTDD = main.startModule isnt module.parent.filename
#main.context = @ if isTDD
#
#module.parent.exports = main
#module.exports = ->


