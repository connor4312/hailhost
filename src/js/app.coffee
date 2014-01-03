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