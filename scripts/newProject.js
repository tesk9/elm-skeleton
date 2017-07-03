var path = require("path");
var fs = require("fs-extra");
var moveProject = require("elm-move/scripts/project");
var helpers = require("./helpers");

var skeletonPath = path.join(__dirname, "../skeleton");
var tempDirectory = path.join(__dirname, "../SkeletonTemp");

function createNewProject(destination) {
  console.log("Creating a new project skeleton at", destination);

  // Set up temporary processing directories
  var tempSrcDirectory = path.join(tempDirectory, "src");
  helpers.addFolder(tempDirectory);
  helpers.addFolder(tempSrcDirectory);

  // Ensure destination exists
  var srcDestination = path.join(destination, "src");
  helpers.addFolder(destination);
  helpers.addFolder(srcDestination);

  // Copy the skeleton to the temporary processing directory
  fs.copy(skeletonPath, tempSrcDirectory, function(err) {
    if (err) { throw err; }
    console.log("Skeleton copied to temporary directory for processing.");

    // Process the skeleton
    var stylesPath = path.join(tempSrcDirectory, "Styles.elm");
    helpers.fsReplace(stylesPath, helpers.replaceStyleNamespace(destination), function() {

      // Move the skeleton to final destination
      console.log("Moving processed skeleton to destination.");
      moveProject(tempSrcDirectory, srcDestination);
    });
  });
}

module.exports = createNewProject;
