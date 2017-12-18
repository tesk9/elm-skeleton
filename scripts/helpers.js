var path = require("path");
var fs = require("fs");
var fs = require("fs-extra");

function addFolder(path) {
  if(fs.existsSync(path)) {
    return;
  }

  fs.mkdirp(path, function(err) {
    if (err) { throw err; }

    console.log("Adding folder", path);
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

module.exports = {
  addFolder: addFolder,
  fsReplace: fsReplace,
}
