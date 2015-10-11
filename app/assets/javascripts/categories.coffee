# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/

# ready = undefined

# ready = ->

#   $('.pswp').bind 'contextmenu', (e) ->
#     false

#   el = $('.sortable')[0]
#   targetItem = undefined

#   sortable = Sortable.create el,
#     disabled: true
#     animation: 500
#     onMove: (evt) ->
#       targetItem = evt.related
#       return
#     onEnd: (evt) ->
#       $.ajax
#         url: '/artworks/change_position'
#         type: 'GET'
#         data:
#           old_index: evt.item.getAttribute('data-pos')
#           new_index: targetItem.getAttribute('data-pos')
#         success: collage
#       return

#   $(".switch label").on 'click', (e) ->
#     state = sortable.option('disabled') #get
#     sortable.option 'disabled', !state #set
#     return

#   $('.sortable').css('padding', '8')
#   $('.sortable').collagePlus
#     'targetHeight': 250
#     'allowPartialLastRow': true
#     'fadeSpeed': 2000
#   $('.sortable').css('padding', '0')

#   collage = ->
#     $('.sortable').css('padding', '8')
#     $('.sortable').collagePlus
#       'targetHeight': 250
#       'allowPartialLastRow': true
#       'fadeSpeed': 2000
#     $('.sortable').css('padding', '0')
#     return


#   resizeTimer = null
#   $(window).bind 'resize', ->
#     # hide all the images until we resize them
#     # set the element you are scaling i.e. the first child nodes of ```.sortable``` to opacity 0
#     $('.sortable figure').css 'opacity', 0
#     # set a timer to re-apply the plugin
#     if resizeTimer
#       clearTimeout resizeTimer
#     resizeTimer = setTimeout(collage, 200)
#     return


#   return

# $(document).ready ready
# $(document).on 'page:load', ready