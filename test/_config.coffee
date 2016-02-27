@should = require 'should'
@fs = require 'fs'
@path = require 'path'

_ = @__proto__ = require 'lodash'
process.chdir(__dirname)
HELPER_DIRS = ['./user']
PARENT = module.parent
@sep = '$'
@ext = @path.extname PARENT.filename
@target_dir = @path.resolve "../src"
@target_name = @path.basename(PARENT.filename, @ext).replace("#{@sep}", "")
@target_src = "#{@target_dir}/#{@target_name}"
_.assign global,
   _: require 'lodash'
   at: @path.resolve "../src/at"

main = $ = ->
#   install_helper_objs=@flow(
#      $.dir2objs
#      $.install_helper_obj
#   ) HELPER_DIRS
   $.at()
$.install_helper_obj = (obj_names) => _.each obj_names, (names,dir)=> _.each names, (v)=>
   src = "#{dir}/#{v}"
   filename = @path.basename src, @ext
   dirname = @path.dirname(src).replace('./','')
   key="#{dirname}_#{filename}"
   @[key]=require src
   @[key].__proto__=toString:->key

$.dir2objs= (HELPER_DIRS)=>_.transform HELPER_DIRS, (r,v)=>
   obj_names = @fs.readdirSync(v)
   findjs = (filename)-> /[.](js|coffee)$/.test filename
   obj_names = _.remove(obj_names, findjs)
   r[v]=obj_names
,{}

$.at= =>
   mocha = module.parent.parent.exports
   Object.assign mocha.Suite.prototype, @
   Object.setPrototypeOf mocha.Context.prototype, mocha.Suite.prototype
main.call @,$
