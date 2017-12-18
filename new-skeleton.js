#!/usr/bin/env node

var moveFeature = require("./scripts/newFeature.js");
var moveProject = require("./scripts/newProject.js");

var destination = process.argv[2];

console.log("Creating a new elm skeleton.");
console.log("Destination", destination);

YorN("Is the path correct? (Y/N)", checkIsNewProject, abort);

function checkIsNewProject() {
  YorN("Is this a new project? (Y/N)",
    function() { moveProject(destination); },
    function() { moveFeature(destination); }
  );
};

function abort () {
  console.log("Aborting.");
  process.exit();
}

function YorN (prompt, yes, no) {
  process.stdin.resume();
  process.stdin.setEncoding('utf8');
  console.log(prompt);
  var listener = function (text) {
    const choice = text.toLowerCase();
    process.stdin.removeAllListeners('data');
    process.stdin.pause();
    if (choice == 'y\n') { yes(); }
    else { no(); }
  }
  process.stdin.on('data', listener);
}
