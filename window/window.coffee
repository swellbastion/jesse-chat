apiChoiceText = document.querySelector "#api-choice-text"
apiChoiceImage = document.querySelector "#api-choice-image"
textForm = document.querySelector "#text-form"
imageForm = document.querySelector "#image-form"
addChatBubbleButton = document.querySelector "#add-chat-bubble"
textChatBubbles = document.querySelector "#text-chat-bubbles"

activateTextForm = ->
    imageForm.classList.add "hide"
    textForm.classList.remove "hide"

activateImageForm = ->
    textForm.classList.add "hide"
    imageForm.classList.remove "hide"

addTextChatBubble = ->
    textChatBubbles.innerHTML +=
    """
        <div class="radio-group">
            <label>
                <input 
                    type="radio" 
                    name="sender-choice">
                User
            </label>
            <label>
                <input 
                    type="radio" 
                    name="sender-choice">
                Assistant
            </label>
        </div>
        <textarea></textarea>
    """

main = ->
    apiChoiceText.addEventListener "click", activateTextForm
    apiChoiceImage.addEventListener "click", activateImageForm
    addChatBubbleButton.addEventListener "click", addTextChatBubble


document.addEventListener "DOMContentLoaded", main