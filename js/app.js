$(function() {

	// toggle tooltips
	$('[data-toggle="tooltip"]').tooltip();

	//
	// Utils
	// --------------------------------------------------

	$('.modal').appendTo('body');


	//
	// Back to top
	// --------------------------------------------------

	$('.js-back-to-top').on('click', function(e) {
		e.preventDefault();

		$('html, body').animate({
			scrollTop: 0
		}, 'fast');
	})



	//
	// Quick search
	// --------------------------------------------------

	$modelSelect = $('.js-car-model'),
	$loader = $('.q-search__loader'),
	$fmid  = $('input[name="mk"]'),
	$mid  = $('input[name="md"]');
	$defaultmid = $mid.val();

	$('.js-car-make').on('change', function(e, state)
	{
		var make   = $(this).val(),
			url    = intelli.config.packages.autos.url + 'models.json?fn=?',
			params = {pid: make};

		$modelSelect.val(0).prop('disabled', true).find('option').remove();
		
		$fmid.val(make);
		if (!state) $mid.val(make);
		$loader.css('display', 'block');
		
		if ('0' != make)
		{
			$.getJSON(url, params, function(response)
			{
				if (response && response.length > 0)
				{
					$.each(response, function(index, item)
					{
						var $option = $('<option>').val(item.id).text(item.title);
						if (item.id == $defaultmid) $option.attr('selected', 'selected');
						$modelSelect.append($option);
					});

					$modelSelect.prepend('<option value="1">' + _t('model') + '</option>');					
					$modelSelect.prop('disabled', false);
					$loader.css('display', 'none');
				}
				else
				{
					$loader.css('display', 'none');
				}
			});	
		}
		else {
			$modelSelect.val(0);
			$mid.val(0);
			$loader.css('display', 'none');
		}
	}).trigger('change', [true]);

	$modelSelect.on('change', function()
	{
		if ($modelSelect.val() == 0)
		{
			$mid.val($fmid.val());
		}
		else
		{
			$mid.val($modelSelect.val());
		}
	});



	//
	// Custom checkbox
	// --------------------------------------------------

	var $customChecks = $('.c-checkbox');

	$customChecks.each(function() {
		var $this = $(this).find('input'),
			$parent = $this.parent(),
			$icon = $parent.find('.fa');

		if ($this.prop('checked')) {
			$icon.removeClass('fa-square').addClass('fa-check-square')
		} else {
			$icon.removeClass('fa-check-square').addClass('fa-square')
		}
	});

	$customChecks.on('change', 'input', function () {
		var $this = $(this),
			$parent = $this.parent(),
			$icon = $parent.find('.fa');

		if ($this.prop('checked')) {
			$icon.removeClass('fa-square').addClass('fa-check-square')
		} else {
			$icon.removeClass('fa-check-square').addClass('fa-square')
		}
	});



	//
	// Expand makes list
	// --------------------------------------------------

	if ($('.pr-list-simple').length) {
		$('.pr-list-simple .row:nth-child(5)').nextAll('.row')
			.wrapAll('<div class="pr-list-simple__hidden"></div>')

		$('.js-more-makes').on('click', function(e) {
			e.preventDefault();

			var $this = $(this),
				$hiddenList = $('.pr-list-simple__hidden'),
				lessText = $this.data('less-makes-text'),
				moreText = $this.data('more-makes-text');

			if (!$hiddenList.hasClass('is-visible')) {
				$hiddenList.slideDown('fast', function() {
					$hiddenList.addClass('is-visible');
					$this.html(lessText);
				});
			} else {
				$hiddenList.slideUp('fast', function() {
					$hiddenList.removeClass('is-visible');
					$this.html(moreText);
				});
			}
		});
	}



	//
	// Layout for cards
	// --------------------------------------------------

	$('.js-toggle-layout').on('click', function(e) {
		e.preventDefault();

		var $this = $(this),
			layout = $this.data('layout'),
			$cards = $('.ia-cards__items');

		$this.addClass('active').siblings().removeClass('active');
		$cards.removeClass('-list -grid').addClass('-' + layout);

		intelli.cookie.write('cardsLayout', layout, 30, intelli.config.baseurl.replace(window.location.origin, ''));
	});
});