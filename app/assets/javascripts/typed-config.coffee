document_ready = ->
	Typed.new '.element',
		strings: [
			'Software development is the closest concept we have to magic.'
			"It's my goal to ensure that anyone with a passion for coding can become a true programming artisan."
		]
		typeSpeed: 0
	return


$(document).ready document_ready
$(document).on 'turbolink:load', document_ready