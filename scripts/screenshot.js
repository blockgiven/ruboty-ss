var system = require('system');
var url = system.args[1];
var image_path = system.args[2];

var page = require('webpage').create();
page.open(url, function(status) {
  page.render(image_path);
  if (status !== 'success') {
    return console.log('FAIL');
  }
  page.render(image_path);
  phantom.exit();
});

setTimeout(function () {
  console.log('FAIL');
  phantom.exit();
}, 10 * 1000);
