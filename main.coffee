{app, BrowserWindow} = require "electron"

createWindow = ->
    window = new BrowserWindow
        width: 500
        height: 809
    window.loadFile "window/window.html"

app.whenReady()
    .then createWindow