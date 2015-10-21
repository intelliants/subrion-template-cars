{if isset($car_blocks_data.body)}
	<div class="bodystyle-list">
		<div class="row">
			{foreach $car_blocks_data.body as $item}
				<div class="col-md-3">
					<a href="{$item.link}" class="pr-list__item">
						<img src="{$img}bodytypes/{$item.name}.png" alt="{$item.title}">
						<span class="pr-list__item__title">{$item.title}</span>
					</a>
				</div>

				{if $item@iteration % 4 == 0}
					</div>
					<div class="row">
				{/if}
			{/foreach}
		</div>
	</div>
{/if}