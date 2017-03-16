var path = require("path");
var fs = require("fs-extra");
var moveProject = require("elm-move/scripts/project");

function createNewProject(destination) {
  console.log("Creating a new project skeleton.");

  var srcDestination = path.join(destination, "src");
  var tempDirectory = path.join(__dirname, "../SkeletonTemp");
  var tempSrcDirectory = path.join(tempDirectory, "src");
  addFolder(tempDirectory);
  addFolder(tempSrcDirectory);
  addFolder(destination);
  addFolder(srcDestination);

  duplicateSkeleton(tempSrcDirectory, function() {
    var stylesPath = path.join(tempSrcDirectory, "Styles.elm")
    fs.readFile(stylesPath, 'utf8', function(err, file) {
      if(err) {
        console.log(err);
        console.log("Something went wrong in replacing the styles namespace.");
        moveProject(tempSrcDirectory, srcDestination);
      } else {
        var newNamespace = destination.replace("/", "-");
        var newFileContents = file.replace("{{NAMESPACE}}", newNamespace);

        fs.writeFile(stylesPath, newFileContents, function(err) {
          if(err) { throw err; }
          moveProject(tempSrcDirectory, srcDestination);
        });
      }
    });
  });
}

function duplicateSkeleton(tempSrcDirectory, cb) {
  var skeleton = path.join(__dirname, "../skeleton");

  fs.copy(skeleton, tempSrcDirectory, function(err) {
    if (err) { throw err; }
    console.log("Skeleton copied to temporary directory for processing.");

    cb()
  });
}

function addFolder(path) {
  if(fs.existsSync(path)) {
    return;
  }

  fs.mkdir(path, function(err) {
    if (err) { throw err; }

    console.log("Adding folder", path);
  });
}

createNewProject(process.argv[2]);
