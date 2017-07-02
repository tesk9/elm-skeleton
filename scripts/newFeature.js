var path = require("path");
var fs = require("fs-extra");
var moveProject = require("elm-move/scripts/project");
var helpers = require("./helpers");

var skeletonPath = path.join(__dirname, "../skeleton");
var tempDirectory = path.join(__dirname, "../SkeletonTemp");

function createNewFeature(destination) {
  console.log("Creating a new project feature at", destination);

  // Set up temporary processing directory
  var tempDirectory = path.join(__dirname, "../skeleton_temp");
  helpers.addFolder(tempDirectory);

  // Ensure destination exists
  helpers.addFolder(destination);

  // Copy the module to the temporary processing directory
  fs.copy(skeletonPath, tempDirectory, function(err) {
    if (err) { throw err; }
    console.log("Empty feature module copied to temporary directory for processing.");

    // Process the module
    var stylesPath = path.join(tempDirectory, "Styles.elm")
    helpers.fsReplace(stylesPath, helpers.replaceStyleNamespace(destination), function() {

      // Move the module to final destination
      console.log("Moving processed module to destination.");
      moveProject(tempDirectory, destination);
    });
  });
}

module.exports = createNewFeature;
