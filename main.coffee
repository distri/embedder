Postmaster = require "postmaster"

module.exports = (url, handlers, options={}) ->
  {name, width, height} = options
  width ?= 800
  height ?= 600

  childWindow = window.open url, name, "width=#{width},height=#{height}"

  postmaster = Postmaster(handlers)
  postmaster.remoteTarget = -> childWindow

  # Return a proxy for easy Postmastering
  proxy = new Proxy postmaster,
    get: (target, property, receiver) ->
      (args...) ->
        target.invokeRemote property, args...

  return proxy
