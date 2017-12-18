var path = require("path");
var fs = require("fs-extra");
var moveProject = require("elm-move/scripts/project");
var helpers = require("./helpers");

var moduleSkeletonPath = path.join(__dirname, "../module");
var tempDirectory = path.join(__dirname, "../ModuleTemp");

function createNewFeature(destination) {
  console.log("Creating a new project feature at", destination);

  // Set up temporary processing directory
  var tempDirectory = path.join(__dirname, "../module_temp");
  helpers.addFolder(tempDirectory);

  // Ensure destination exists
  helpers.addFolder(destination);

  // Copy the module to the temporary processing directory
  fs.copy(moduleSkeletonPath, tempDirectory, function(err) {
    if (err) { throw err; }
    console.log("Empty feature module copied to temporary directory for processing.");

    // Process the module
    var elmPackagePath = path.join(tempDirectory, "elm-package.json");

    fs.remove(elmPackagePath, function(err) {
      if (err) { throw err; }

      // Move the module to final destination
      console.log("Moving processed module to destination.");
      moveProject(tempDirectory, destination);
    });
  });
}

module.exports = createNewFeature;
