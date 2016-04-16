fs=require 'fs'
path=require 'path'
ctx=GLOBAL
vm=require 'vm'
root= path.resolve '../../'

fileStr=fs.readFileSync("#{root}/_config.js",'utf8')
sandbox=vm.createContext(global)
vm.runInDebugContext fileStr,sandbox
console.log sandbox.at



