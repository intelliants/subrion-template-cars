<a href="#" class="extra-filters__toggle{if !empty($smarty.get.model) || !empty($smarty.get.status)} extra-filters__toggle--active{/if}" id="js-extra-filters-toggle"><i class="icon-tasks"></i> {lang key='filter'}</a>

<div  class="extra-filters{if empty($smarty.get.model) && empty($smarty.get.status)} extra-filters--hidden{/if}" id="js-extra-filters">
	<form method="get" class="form-inline">
		<div class="extra-filters__model">
			<input type="hidden" name="model"{if !empty($smarty.get.model)} value="{$smarty.get.model|intval}"{/if}>
			<span>
				<select class="js-filters-form" data-children="{$parents}">
					<option value="">&lt;{lang key='model'}&gt;</option>
					{foreach $makes as $make}
						<option value="{$make.id}">{$make.title}</option>
					{/foreach}
				</select>
			</span>
		</div>
		<select name="status">
			<option value="">&lt;{lang key='status'}&gt;</option>
			{foreach $statuses as $status}
				<option value="{$status}"{if isset($smarty.get.status) && $status == $smarty.get.status} selected="selected"{/if}>{lang key=$status}</option>
			{/foreach}
		</select>
		<button type="submit" class="btn">{lang key='filter'}</button>
	</form>
</div>

{ia_add_media files='js:jquery/plugins/jquery.ia-dropdown.min'}
{ia_add_js}
$(function()
{
	$('#js-extra-filters-toggle').on('click', function(e)
	{
		e.preventDefault();

		$(this).toggleClass('extra-filters__toggle--active');
		$('#js-extra-filters').toggleClass('extra-filters--hidden');
	});

	$('select.js-filters-form').iaDropdown(
	{
		url: intelli.config.ia_url + 'profile/autos.json',
		valueHolder: 'model'
	});
});
{/ia_add_js}