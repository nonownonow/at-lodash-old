_=require 'lodash'
_.assign module.exports, module.parent.exports
main=@main.bind @
main.tag=@main.tag if @main.tag?
@path=require 'path'
@src=require.main.filename
parentID=module.parent.id
main.id=@path.basename @src
main.parentID=@path.basename parentID
main.caller_noTDD=@caller_noTDD
delete require.cache['/home/il-hwanryu/Documents/at/.comp/src/at.js']

# when parent is 'mocha', exclude context
isTDD=@startModule isnt module.parent.filename
main.at=@ if isTDD
module.parent.exports=main


