# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).load ->
  solutionExplanation   = document.getElementById('solution-explanation')
  inventorySolutionBox  = document.getElementById('inventory-solution')
  timeSolutionBox       = document.getElementById('time-solution')
  locationSolutionBox   = document.getElementById('location-solution')
  solutionBoxes         = [inventorySolutionBox, timeSolutionBox, locationSolutionBox]
  inventorySolutionText = "Never run out of medicine again! Know when a particular drug is running low in real-time."
  timeSolutionText      = "Surge's real-time and accurate readings save hospitals resources, time, and money."
  locationSolutionText  = "Know precisely where any patient's drug is located at any time without the hassle."
  solutionTexts         = [inventorySolutionText, timeSolutionText, locationSolutionText]
  currentText           = ""

  changeSolutionText = (newSolutionText) ->
    solutionExplanation.style.opacity = 0
    setTimeout (->
      currentText                       = newSolutionText
      solutionExplanation.innerHTML     = currentText
      solutionExplanation.style.opacity = 1
    ), 500
    return

  toggleSelect = (currentSolutionBox) ->
    for boxUnselect, i in solutionBoxes
      if boxUnselect != currentSolutionBox
        boxUnselect.classList.remove 'selected-solution-box'
      else
        if (currentText != solutionTexts[i])
          changeSolutionText(solutionTexts[i])
        boxUnselect.classList.add 'selected-solution-box'
    return

  inventorySolutionBox.addEventListener 'click', ->
    toggleSelect inventorySolutionBox

  timeSolutionBox.addEventListener 'click', ->
    toggleSelect timeSolutionBox

  locationSolutionBox.addEventListener 'click', ->
    toggleSelect locationSolutionBox

  $('#video-section').magnificPopup
    items: src: 'http://www.youtube.com/watch?v=rrlJiKFJSQY'
    type: 'iframe'

  toggleSelect inventorySolutionBox