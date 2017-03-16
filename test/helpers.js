var assert = require('assert');
var helpers = require('./../scripts/helpers');

describe('#replaceStyleNamespace', function() {
  var mockFile = "module NAMESPACE.Styles exposing ()\n\n  withNamespace \"{{NAMESPACE}}-\"\n\n";
  var desiredFile = "module NAMESPACE.Styles exposing ()\n\n  withNamespace \"NewFeature-Place-\"\n\n";

  it('should return a function that replaces the namespace', function() {
    assert.equal(desiredFile, helpers.replaceStyleNamespace("NewFeature/Place")(mockFile));
  });
});
