{app, BrowserWindow} = require "electron"

createWindow = ->
    window = new BrowserWindow
        width: 500
        height: 809
        webPreferences:
            preload: __dirname + "/window/window.js"
            sandbox: false
    window.loadFile "window/window.html"

app.whenReady()
    .then createWindow