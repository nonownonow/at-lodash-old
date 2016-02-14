var U, _, isTDD, main, path, ref, u, u_FDD;

_ = require('lodash');

this.s = require('underscore.string');

_.mixin(this.s.exports());

u = require('underscore');

U = require('underscore-contrib');

this.S = require('string');

this.S.extendPrototype();

main = module.parent.exports.main.bind(this);

_.assign(main, module.parent.exports);

_.each(require.cache, function(v, k, cache) {
  if (/at[.](?:js|coffee)/.test(k)) {
    return delete cache[k];
  }
});

this.__proto__ = new (function() {});

u_FDD = _.intersection(_.keys(_), _.keys(U));

_.each(u_FDD, function(v) {
  return U["u_" + v] = U[v];
});

_.assign(this.__proto__, U);

_.assign(this.__proto__, u);

_.assign(this.__proto__, _);

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
  return this.each(source, function(v, k) {
    if (v in target) {
      throw "target should not have key:" + v;
    }
    return target[v] = target[k];
  });
};

if ((ref = main.supp) != null) {
  ref.call(this);
}

isTDD = main.startModule !== module.parent.filename;

if (isTDD) {
  main.context = this;
}

module.parent.exports = main;

module.exports = function() {};

//# sourceMappingURL=at.js.map
