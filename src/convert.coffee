fs = require 'fs'
CSON = require 'cson-safe'

module.exports = (codec = CSON) ->

  data = fs.readFileSync process.argv.pop(), 'utf8'
  data = try
    CSON.parse data
  catch
    JSON.parse data

  console.log codec.stringify data, null, 2
