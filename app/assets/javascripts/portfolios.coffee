document_ready = undefined
set_positions = undefined

set_positions = ->
	$('.card').each (i) ->
		$(this).attr 'data-pos', i + 1
		return
	return

document_ready = -> 
	set_positions()
	$('.sortable-div').sortable()
	$('.sortable-div').sortable().bind 'sortupdate', (e, ui) ->
		updated_position = []
		set_positions()
		$('.card').each (i) ->
			updated_position.push
				id: $(this).data('id')
				position: i + 1
			return
		$.ajax
			type: 'PUT'
			url: '/portfolios/sort'
			data: order: updated_position
		return
	return

$(document).ready document_ready
