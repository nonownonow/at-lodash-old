_=require 'lodash'
should = require 'should'
fs = require 'fs'
path=require 'path'
process.chdir(__dirname)
test_name=path.basename(__filename,'.js').replace('_test','')
module_src="../src/#{test_name}"
extension=path.extname(__filename)
describe "at_require", ->
   at_require = require '../src/at_require'
   it "is about FDD", ->
      at_require.should.have.properties('flowRight', 'iterators', 'extendOwn', 'levenshtein')
      at_require.u_repeat(5, 'a').should.be.eql(['a', 'a', 'a', 'a', 'a'])
   it "is about util", ->
      at_require.should.have.properties('log')
