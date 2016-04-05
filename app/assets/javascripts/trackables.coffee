# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  if window.controller == "trackable"

    refreshTimeline = ->
      $.get 'refresh-timeline/' + window.trackable_id, ((data) ->
        $('#trackable-history-table').html(data)
        return
      ), 'html'
      return

    hideAlert = (elem) ->
      $('#alert').css('opacity', '0')

    pusher = new Pusher('a554079e030c74406aa4');
    channel = pusher.subscribe(window.hospital_id + "-" + window.trackable_id);
    setInterval refreshTimeline, 5000

    listen = (el, event, handler) ->
      if el.addEventListener
        el.addEventListener event, handler
      else
        el.attachEvent 'on' + event, ->
          handler.call el

    channel.bind 'tracking_update', (data) ->
      alertElem = $('#alert')
      alertElem.html(data.text)
      alertElem.css('opacity', '1')
      setInterval hideAlert, 10000
      refreshTimeline()
      return

$(document).ready(ready)
$(document).on('page:load', ready)