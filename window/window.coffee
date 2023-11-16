apiChoiceText = document.querySelector "#api-choice-text"
apiChoiceImage = document.querySelector "#api-choice-image"
textForm = document.querySelector "#text-form"
imageForm = document.querySelector "#image-form"
addBubbleButton = document.querySelector "#add-bubble-button"
bubbleZone = document.querySelector "#bubble-zone"

activateTextForm = ->
    imageForm.classList.add "hide"
    textForm.classList.remove "hide"

activateImageForm = ->
    textForm.classList.add "hide"
    imageForm.classList.remove "hide"

addChatBubble = (sender, text) ->
    template = document.querySelector "#bubble-template"
    clone = template.content.cloneNode true
    radioButtons = clone.querySelectorAll "input[type=radio]"
    uuid = crypto.randomUUID()
    for radioButton in radioButtons
        radioButton.setAttribute "name", "sender-choice-#{uuid}"
    if sender == "user"
        radioButtons[0].setAttribute "checked", true
    else if sender == "assistant"
        radioButtons[1].setAttribute "checked", true
    bubbleZone.appendChild clone

main = ->
    apiChoiceText.addEventListener "click", activateTextForm
    apiChoiceImage.addEventListener "click", activateImageForm
    addBubbleButton.addEventListener "click", -> addChatBubble "user", "Hello, World!"


document.addEventListener "DOMContentLoaded", main