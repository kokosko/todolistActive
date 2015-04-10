$ ->
  $("#tasks tbody").sortable(
    axis: 'y'
    items: '.item'
    cursor: 'move'

    stop: (e, ui) ->
       ui.item.children('td').effect('highlight', {}, 1000)
    update: (e, ui) ->
      item_id = ui.item.attr('id').substr(5)
      position = ui.item.index()
      $.ajax(
        type: 'POST'
        url: '/tasks/update_row_order'
        dataType: 'json'
        data: { task: {task_id: item_id, position: position } }
      )
  )

$(document).on 'change', '.task_checkbox', ->
  $(@.form).submit()
