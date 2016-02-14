var _;

_ = require('lodash');

this.main = function() {
  this.isContext = true;
  return this.G.check = null;
};

this.tag = 'caller';

this.startModule = require.main.filename;

require('../src/at');

//# sourceMappingURL=at_caller_opp.js.map
