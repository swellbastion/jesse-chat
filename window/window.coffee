main = ->
    alert "hi"
    document.querySelector "#api-choice-text"
        .addEventListener "click", apiChoiceText

apiChoiceText = ->
    alert "time to do some texty stuff"

document.addEventListener "DOMContentLoaded", main