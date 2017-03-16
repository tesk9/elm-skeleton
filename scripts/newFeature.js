var path = require("path");
var fs = require("fs-extra");
var moveProject = require("elm-move/scripts/project");
var helpers = require("./helpers");

function createNewFeature(destination) {
  console.log("Creating a new project feature at", destination);

  var tempDirectory = path.join(__dirname, "../skeleton_temp");

  helpers.addFolder(tempDirectory);
  helpers.addFolder(destination);

  helpers.duplicateSkeleton(tempDirectory, function() {
    var stylesPath = path.join(tempDirectory, "Styles.elm")
    helpers.fsReplace(stylesPath, helpers.replaceStyleNamespace(destination), function() {
      moveProject(tempDirectory, destination);
      // TODO: unlink the temp directory
    });
  });
}

createNewFeature(process.argv[2]);
