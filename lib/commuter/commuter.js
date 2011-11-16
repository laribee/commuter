#!/usr/bin/env node


var request = require('request')
  , argv = require('optimist')
      .usage('Usage: $0 --start <address> --end <address>')
      .demand('s')
      .alias('s', 'start')
      .describe('s', 'Where to start - home or work address')
      .demand('e')
      .alias('e', 'end')
      .alias('e', 'dest')
      .describe('e', 'Where to end - home or work address')
      .boolean('v')
      .alias('v', 'verbose')
      .describe('v', 'Verbose flag turns on the noise')
      .argv;

var origin = encodeURIComponent(argv.start)
  , destination = encodeURIComponent(argv.end)
  , url = 'http://maps.googleapis.com/maps/api/distancematrix/json?origins='+origin+'&destinations='+destination+'&units=imperial&sensor=false';

if (argv.verbose) console.log(url);

request(url, function (error, response, body) {
  if (argv.verbose) console.log(body)

  if (!error && response.statusCode == 200) {
    var matrix = JSON.parse(body);

    if (argv.verbose) {
      console.log(matrix.origin_addresses);
      console.log(matrix.destination_addresses);
    };

    matrix.rows.forEach(function(originRow) {
      originRow.elements.forEach(function(destinationElement) {
        console.log("It will take " + destinationElement.duration.text + " to travel " + destinationElement.distance.text + " on you commute right now.")
      });
    });

  }
});