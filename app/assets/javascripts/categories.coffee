# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

ready = ->
  $('.pswp').bind 'contextmenu', (e) ->
    false

  if $('#sortable')
    el = $('#sortable')[0]
  sortable = Sortable.create(el,
    disabled: true
    animation: 500)
  $(".switch label").on 'click', (e) ->
    state = sortable.option('disabled') #get
    sortable.option 'disabled', !state #set
    return

  return

$(document).ready ready
$(document).on 'page:load', ready