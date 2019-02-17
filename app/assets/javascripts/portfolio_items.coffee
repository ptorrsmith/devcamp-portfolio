# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = undefined


# setting data positions
set_positions = undefined

set_positions = ->
    $('.card').each (i) -> 
        $(this).attr 'data-pos', i + 1 # because i starts at 0, but we want postition 1 
        return
    return

# sortable('.sortable'); # js
# coffee
ready = ->
    set_positions()
    $('.sortable').sortable()
    $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
        updated_order = []
        set_positions()
        $('.card').each (i) ->
            updated_order.push
                id: $(this).data('id'),
                position: i + 1
            return
        $.ajax
            type: 'PUT'
            url: '/portfolio_items/sort' # setup put route for sort action on portfolio_items_controller
            data: order: updated_order
        return
    return

$(document).ready ready 

