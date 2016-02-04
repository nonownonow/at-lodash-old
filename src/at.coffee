_ = require 'lodash'

main = module.parent.exports.main.bind @
_.assign main, module.parent.exports
_.each require.cache, (v, k, cache)->
   delete cache[k] if /at[.](?:js|coffee)/.test k

@__proto__ = new ->
_.assign @__proto__, _
@path=require 'path'

unless process.config.isLoadedAT
   process.config.isLoadedAT=true
   process.config.at={}
@G=process.config.at
@moduleName=(@path.basename module.parent.id).replace(/[.](?:js|coffee)/,'')
#@set process.config,'at',{}
# when parent is 'mocha', exclude context
isTDD = main.startModule isnt module.parent.filename
main.at = @ if isTDD

module.parent.exports = main


