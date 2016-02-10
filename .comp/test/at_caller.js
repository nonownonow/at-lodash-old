var _;

_ = require('lodash');

this.main = function() {
  this.isContext = true;
  return this.G.check = null;
};

this.init = function() {};

this.supp = function() {
  this.supp_fn1 = function() {};
  return this.supp_fn2 = function() {};
};

this.tag = 'caller';

this.startModule = require.main.filename;

require('../src/at');

//# sourceMappingURL=at_caller.js.map
