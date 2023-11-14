apiChoiceText = document.querySelector "#api-choice-text"
apiChoiceImage = document.querySelector "#api-choice-image"
textForm = document.querySelector "#text-form"
imageForm = document.querySelector "#image-form"

main = ->
    apiChoiceText.addEventListener "click", activateTextForm
    apiChoiceImage.addEventListener "click", activateImageForm

activateTextForm = ->
    imageForm.classList.add "hide"
    textForm.classList.remove "hide"

activateImageForm = ->
    textForm.classList.add "hide"
    imageForm.classList.remove "hide"

document.addEventListener "DOMContentLoaded", main