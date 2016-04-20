@should=require 'should'
@path=require 'path'
@fs=require 'fs'

@cwd=process.cwd()

#beforeEach -> delete require.cache[k] for k of require.cache
before -> @[k]=v for v,k of exports
