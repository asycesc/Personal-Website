document_ready = ->
	Typed.new '.element',
		strings: [
			'Explore is not always easy.'
			'A world of Code.'
			'Hope you like this website.'
		]
		typeSpeed: 30
	return


$(document).ready document_ready
$(document).on 'turbolink:load', document_ready