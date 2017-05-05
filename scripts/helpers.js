var path = require("path");
var fs = require("fs");
var fs = require("fs-extra");

function addFolder(path) {
  if(fs.existsSync(path)) {
    return;
  }

  fs.mkdir(path, function(err) {
    if (err) { throw err; }

    console.log("Adding folder", path);
  });
}

function duplicateSkeleton(tempDirectory, cb) {
  var skeleton = path.join(__dirname, "../skeleton");

  fs.copy(skeleton, tempDirectory, function(err) {
    if (err) { throw err; }
    console.log("Skeleton copied to temporary directory for processing.");

    cb()
  });
}

function fsReplace(path, mapContents, callback) {
  fs.readFile(path, 'utf8', function(err, file) {
    if(err) { throw err; }
    var newFileContents = mapContents(file);

    fs.writeFile(path, newFileContents, function(err) {
      if(err) { throw err; }
      callback();
    });
  });
}

function replaceStyleNamespace(destination) {
  var newNamespace = destination.replace("/", "-");
  return function(file) { return file.replace("{{NAMESPACE}}", newNamespace); };
}

module.exports = {
  addFolder: addFolder,
  duplicateSkeleton: duplicateSkeleton,
  fsReplace: fsReplace,
  replaceStyleNamespace: replaceStyleNamespace,
}
