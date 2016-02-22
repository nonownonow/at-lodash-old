_=require 'lodash'
@should= require 'should'
@fs = require 'fs'
@path=require 'path'

process.chdir(__dirname)
@ext=@path.extname parent.filename
@module_name=@path.basename(parent.filename,".#{@extension}").replace('_','')
@module_src="../src/#{@module_name}"
@module_dir=''
@test_dir=''

mocha=module.parent.parent.exports

Object.assign mocha.Suite,@
Object.setPrototypeOf mocha.Context.prototype,mocha.Suite.prototype
