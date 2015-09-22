# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

ready = ->
  # $('img').mousedown (e) ->
  #   if e.button == 2
  #     # right click
  #     return false
  #     # do nothing!
  #   return
  $('img').bind 'contextmenu', (e) ->
    false

$(document).ready ready
$(document).on 'page:load', ready