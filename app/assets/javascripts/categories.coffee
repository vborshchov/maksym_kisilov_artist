# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

ready = ->
  $('.pswp').bind 'contextmenu', (e) ->
    false

  el = $('#sortable')[0]
  targetItem = undefined

  sortable = Sortable.create(el,
    disabled: true
    animation: 500
    onMove: (evt) ->
      targetItem = evt.related
      return
    onEnd: (evt) ->
      $.ajax
        url: '/artworks/change_position'
        type: 'GET'
        data:
          old_index: evt.item.getAttribute('data-pos')
          new_index: targetItem.getAttribute('data-pos')
      return
    )
  $(".switch label").on 'click', (e) ->
    state = sortable.option('disabled') #get
    sortable.option 'disabled', !state #set
    return
  return

$(document).ready ready
$(document).on 'page:load', ready