var assert = require('assert');
var mock = require('mock-fs');
var newProject = require('./../scripts/newProject.js')
var newFeature = require('./../scripts/newFeature.js');

describe("Project", function(argument) {
  beforeEach(function() {
    mock({
      'module': {
        'Flags.elm': 'module Flags exposing (Flags)',
        'elm-package.json': 'elm-test: version num <= version < version num',
        'Main.elm': 'module Main exposing (Model, Flags, init)',
      },
      'skeleton': {
        'Flags.elm': 'module Flags exposing (Flags)',
        'elm-package.json': 'elm-test: version num <= version < version num',
        'Main.elm': 'module Main exposing (main)',
      },
    });
  });

  describe('New Feature', function() {
    it('should not error', function() {
      assert.doesNotThrow(function() {
        newFeature('Some/Sweet/Destination');
      });
    });
  });

  describe('New Project', function() {
    it('should not error', function() {
      assert.doesNotThrow(function() {
        newProject('Some/Sweet/Destination');
      });
    });
  });
});
