_ = require 'lodash'
colors = require 'colors'
fibrous = require 'fibrous'
fs = require 'fs'
path = require 'path'
RegClient = require 'npm-registry-client'

msgDocs = (msg) ->
  console.log ["==> [DOCS]", msg].join(' ').cyan

msgInfo = (msg) ->
  console.log ["==> [INFO]", msg].join(' ').blue

msgOk = (msg) ->
  console.log ["==> [OK]", msg].join(' ').green

msgWarn = (msg) ->
  console.warn ["==> [WARN]", msg].join(' ').yellow

module.exports = fibrous (argv) ->

  [to, from] = for dir in ['to', 'from']
    url: argv[dir]
    prefix: argv["#{dir}-prefix"]
    auth:
      token: argv["#{dir}-token"]
      username: argv["#{dir}-username"]
      password: argv["#{dir}-password"]
      email: argv["#{dir}-email"]
      alwaysAuth: true

  moduleNames = argv._

  unless from.url and (from.auth.token or (from.auth.username and from.auth.password)) and
         to.url and (to.auth.token or (to.auth.username and to.auth.password)) and
         moduleNames.length
    msgDocs '📝  See documentation here: https://github.com/dperuo/npm-carbon/blob/master/README.md#usage'
    return

  npm = new RegClient()

  for moduleName in argv._
    msgInfo "📡  Getting version info from #{from.url}/#{moduleName}"
    fromVersions = npm.sync.get("#{from.url}/#{moduleName}", auth: from.auth, timeout: 3000).versions
    try
      newModuleName = if to.prefix then "#{to.prefix}/#{moduleName}" else "#{moduleName}"
      msgInfo "📡  Getting version info from #{from.url}/#{newModuleName}"
      toVersions = npm.sync.get("#{to.url}/#{newModuleName}", auth: to.auth, timeout: 3000).versions
    catch e
      throw e

    versionsToSync = _.difference Object.keys(fromVersions), Object.keys(toVersions)

    for semver, oldMetadata of fromVersions

      unless semver in versionsToSync
        msgOk "✅  #{moduleName}@#{semver} already exists on destination"
        continue

      {dist} = oldMetadata

      # clone the metadata skipping private properties and 'dist'
      newMetadata = {}
      newMetadata[k] = v for k, v of oldMetadata when k[0] isnt '_' and k isnt 'dist'

      remoteTarball = npm.sync.fetch dist.tarball, auth: from.auth

      try
        msgInfo "📦  Publishing package to #{to.url}"
        res = npm.sync.publish "#{to.url}", auth: to.auth, metadata: newMetadata, access: 'public', body: remoteTarball
        msgOk "✅  #{moduleName}@#{semver} cloned"
      catch e
        remoteTarball.connection.end() # abort
        throw e unless e.code is 'EPUBLISHCONFLICT'
        msgWarn "⏩  #{moduleName}@#{semver} already exists on the destination, skipping."
