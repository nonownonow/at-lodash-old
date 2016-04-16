require './_config'

describe "@set_function_name", ->
   it "should set name in function", ->
      @at_require.set_function_name.call(@ctx)
      @each @functions(@ctx), (v,k)=>@ctx[v].should.have.property('name',v)
describe "@set_aliases", ->
   it "should set aliases about special function in @", ->
      `this.ctx.test_fn=function test_fn(){}`
      @at_require.set_aliases.call(@ctx, tf:'test_fn') and @ctx.tf.name.should.be.eql('test_fn')
describe "@set_unary",->
   it "should set unary_function with special_function",->
      @at_require.set_unary_function.call(@ctx,unary_mf:'cb') and @ctx.unary_mf(1,2,3)
      @ctx.cb.should.be.alwaysCalledWithExactly(1)
describe "@v(varname)(fn)",->
   it "should create function which fn's result with varname and ",->
      @at_require.v.call(@ctx,'my_var')(@identity)('arg').should.eql('arg')
      @ctx.my_var.should.eql('arg')
describe "@x(fn)",->
   it "should create function which fn's arg eql fn's result",->
      @at_require.x.call(@ctx)((e)->@test='test').call(@ctx,'x').should.eql('x')
      @ctx.test.should.eql('test')

describe "module_FDD", ->
   it "should have functions from FDD module named lodash,underscore,etc", ->
      @at_require.should.have.properties('flowRight', 'iterators', 'extendOwn', 'levenshtein')
   it "should renamed functions concluded between undercore and lodash, by rule that originalName is matched to u_originalName", ->
      @at_require.u_repeat(5, 'a').should.be.eql(['a', 'a', 'a', 'a', 'a'])


describe "module_etc", ->
   it "should have properties from required module_etc", ->
      @at_require.should.have.properties('fs', 'path', 'console', 'log')
