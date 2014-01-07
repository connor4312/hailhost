$ ->
	$('.content-switchy').each ->
		_this = @
		$buttons = $('.btns li', @)

		$('a', $buttons).on 'click', ->
			$parent = $(@).parent('li')
			index = $parent.index() + 1

			$buttons.removeClass('active')
			$parent.addClass('active')

			$('.slides li', _this)
				.removeClass('active')
				.filter(':nth-child(' + index + ')')
				.addClass('active')

	$('.ticker').each ->
		eh = $('> *:first-child', this).height()
		num = $(this).children().length
		i = 1

		setInterval(
			=>
				if i >= num
					i = 0

				$('> *:first-child', this).css 'margin-top', (i * eh * -1) + 'px'
				i++
			, 3000
		)