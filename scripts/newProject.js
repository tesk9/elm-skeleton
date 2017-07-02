var path = require("path");
var fs = require("fs-extra");
var moveProject = require("elm-move/scripts/project");
var helpers = require("./helpers");

function createNewProject(destination) {
  console.log("Creating a new project skeleton at", destination);

  var srcDestination = path.join(destination, "src");
  var tempDirectory = path.join(__dirname, "../SkeletonTemp");
  var tempSrcDirectory = path.join(tempDirectory, "src");

  helpers.addFolder(tempDirectory);
  helpers.addFolder(tempSrcDirectory);
  helpers.addFolder(destination);
  helpers.addFolder(srcDestination);

  helpers.duplicateSkeleton(tempSrcDirectory, function() {
    var stylesPath = path.join(tempSrcDirectory, "Styles.elm")
    helpers.fsReplace(stylesPath, helpers.replaceStyleNamespace(destination), function() {
      moveProject(tempSrcDirectory, srcDestination);
    });
  });
}

module.exports = createNewProject;
