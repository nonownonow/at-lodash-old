_=require 'lodash'

main=module.parent.exports.main.bind @
_.assign main, module.parent.exports
_.each require.cache, (v,k,cache)->
    delete cache[k] if /at[.](?:js|coffee)/.test k

# when parent is 'mocha', exclude context
isTDD=main.startModule isnt module.parent.filename
main.at=@ if isTDD

module.parent.exports=main


