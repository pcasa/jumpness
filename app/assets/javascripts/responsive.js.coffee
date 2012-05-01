$(document).ready ->
	
	$(window).resize ->
		nav_left = $('.nav').offset().left
		if(nav_left > 100)
			$('.phone').css('float', 'none')
			$('.phone').css('left', nav_left + 25)
			$('.principal_container').css('padding-top', '20px')
			$('.hero-unit').css('margin-top', '40px')
		else
			$('.phone').css('float', 'right')
			$('.phone').css('left', 'auto')
			$('.principal_container').css('padding-top', '0px')
			$('.hero-unit').css('margin-top', '-50px')

	nav_left = $('.nav').offset().left
	if(nav_left > 100)
		$('.phone').css('float', 'none')
		$('.phone').css('left', nav_left + 25)
		$('.principal_container').css('padding-top', '20px')
		$('.hero-unit').css('margin-top', '40px')
	else
		$('.phone').css('float', 'right')
		$('.phone').css('left', 'auto')
		$('.principal_container').css('padding-top', '0px')
		$('.hero-unit').css('margin-top', '-50px')