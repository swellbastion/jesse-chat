openAI = require "openai"

openai = new OpenAI

apiChoiceText = document.querySelector "#api-choice-text"
apiChoiceImage = document.querySelector "#api-choice-image"
textForm = document.querySelector "#text-form"
imageForm = document.querySelector "#image-form"
systemPromptTextarea = document.querySelector "#system-prompt-textarea"
bubbleZone = document.querySelector "#bubble-zone"
addBubbleButton = document.querySelector "#add-bubble-button"
sendButton = document.querySelector "#send-button"

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
    clone.querySelector "textarea"
        .value = text
    bubbleZone.appendChild clone

send = ->
    bubbles = Array.from bubbleZone.querySelectorAll ".bubble"
    bubbleProperties = bubbles.map (wrapperElement) -> 
        role: if wrapperElement.querySelector("input[type=radio]").checked then "user" else "assistant"
        content: wrapperElement.querySelector("textarea").value
    try
        completion = openai.chat.completions.create
            model: "gpt-4"
            messages: [{role: "system", content: systemPromptTextarea.value}, bubbleProperties]
        debugger
        addChatBubble "assistant", completion.choices[0]
    catch error
        alert error

main = ->
    apiChoiceText.addEventListener "click", activateTextForm
    apiChoiceImage.addEventListener "click", activateImageForm
    addBubbleButton.addEventListener "click", -> addChatBubble "user", ""
    sendButton.addEventListener "click", send


document.addEventListener "DOMContentLoaded", main