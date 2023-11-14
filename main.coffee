{app, BrowserWindow} = require "electron"

createWindow = ->
    window = new BrowserWindow
        width: 800
        height: 600
    window.loadFile "window/window.html"

app.whenReady()
    .then createWindow