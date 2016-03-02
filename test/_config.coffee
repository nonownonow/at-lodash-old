beforeEach ->
   delete require.cache[k] for k of require.cache
   @user_normal = require './user/normal'

@should = require 'should'
@fs = require 'fs'
@path = require 'path'
@console = require('tracer').console
   format: "{{message}} {{file}}:{{line}} {{title}}"
   dateformat: "HH:MM:ss.L"
   inspectOpt:
      depth: 12
@log=@console.log
_ = @__proto__ = require 'lodash'
process.chdir(__dirname)
HELPER_DIRS = ['./user']
PARENT = module.parent
@sep = '$'
@js = @path.extname PARENT.filename
@at_dir = @path.resolve "../src"
@at_name = @path.basename(PARENT.filename, @js).replace("#{@sep}", "")
@at_src = "#{@at_dir}/#{@at_name}"
@user_dir = @path.resolve "./user"
@loaded_by_at = ["at_require", "at_load"]
@loaded_by_user = ["load"]

main = $ = ->
#   $.helper_objs HELPER_DIRS
   $.at()


$.install_helper_obj = (obj_names) => _.each obj_names, (names, dir)=> _.each names, (v)=>
   src = "#{dir}/#{v}"
   filename = @path.basename src, @js
   dirname = @path.dirname(src).replace('./', '')
   key = "#{dirname}_#{filename}"
   @[key] = require src
   @[key].__proto__ =
      toString: -> key

$.dir2objs = (HELPER_DIRS)=>_.transform HELPER_DIRS, (r, v)=>
   obj_names = @fs.readdirSync(v)
   findjs = (filename)-> /[.](js|coffee)$/.test filename
   obj_names = _.remove(obj_names, findjs)
   r[v] = obj_names
, {}

$.helper_objs = @flow(
   $.dir2objs
   $.install_helper_obj
)
$.at = =>
   mocha = module.parent.parent.exports
   Suite_tail_proto = mocha.Suite.prototype.__proto__
   Suite_tail_proto.__proto__ = {}
   Suite_tail_proto.__proto__ = @
   Object.setPrototypeOf mocha.Context.prototype, mocha.Suite.prototype
   _.assign global,
      _: require 'lodash'
      at: @path.resolve "../src/at"
      Suite_tail_proto:Suite_tail_proto.__proto__
main.call @, $
