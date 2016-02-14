var _, isTDD, main, parentDir, path, ref, ref1, require_files;

_ = require('lodash');

this.__proto__ = (function() {});

parentDir = (ref = module.parent.filename.match(/(.+)\/.+/)) != null ? ref[1] : void 0;

require_files = ["./at_require", "./at_load", parentDir + "/load"].forEach((function(_this) {
  return function(v) {
    try {
      return Object.assign(_this.__proto__, require(v));
    } catch (undefined) {}
  };
})(this));

main = module.parent.exports.main.bind(this);

_.assign(main, module.parent.exports);

_.each(require.cache, function(v, k, cache) {
  if (/at[.](?:js|coffee)/.test(k)) {
    return delete cache[k];
  }
});

path = require('path');

this.r = require('xregexp');

this.log = require('tracer').console({
  format: "{{message}} {{file}}:{{line}} {{title}}",
  dateformat: "HH:MM:ss.L",
  inspectOpt: {
    depth: 12
  }
});

if (!process.config.isLoadedAT) {
  process.config.isLoadedAT = !process.config.isLoadedAT;
  process.config.at = {};
}

this.G = process.config.at;

this.moduleName = (path.basename(module.parent.id)).replace(/[.](?:js|coffee)/, '');

this.setAliases = function(target, source) {
  return _.each(source, function(v, k) {
    if (v in target) {
      throw "target should not have key:" + v;
    }
    return target[v] = target[k];
  });
};

if ((ref1 = main.supp) != null) {
  ref1.call(this);
}

isTDD = main.startModule !== module.parent.filename;

if (isTDD) {
  main.context = this;
}

module.parent.exports = main;

module.exports = function() {};

//# sourceMappingURL=at.js.map
