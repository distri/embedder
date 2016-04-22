Embedder = require "../main"

describe "embedder", ->
  it "should have the child window property", ->
    embedder = Embedder()

    win = embedder.remoteTarget()
    console.log win
    assert win
    win.close()
