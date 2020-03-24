require 'mocha-sinon'
expect = require('chai').expect

{exec} = require 'child_process'
path = require 'path'

describe 'npm-carbon', ->
  it 'prints usage', (done) ->
    exec path.resolve(__dirname, '../bin/npm-carbon.js'), (err, stdout, stderr) ->
      expect(err).not.to.exist
      expect(stdout).to.contain 'usage:'
      done()
