fs = require 'fs'
CSON = require 'cson-safe'

module.exports = (codec = CSON) ->

  stringify = if codec is CSON
    CSON.stringify
  else
    require('format-json').diffy

  data = fs.readFileSync process.argv.pop(), 'utf8'
  data = try
    CSON.parse data
  catch
    JSON.parse data

  console.log stringify data, null, 2
