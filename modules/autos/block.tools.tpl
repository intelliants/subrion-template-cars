<div class="b-tools">
	<div class="b-tools__header">
		<ul class="nav nav-tabs">
			<li class="nav-tabs-title"><span>{lang key='tools'}</span></li>
			<li><a href="#tab-saved-cars" data-toggle="tab"><span class="fa fa-star text-warning"></span>{if $car_blocks_data.saved_listings} {count($car_blocks_data.saved_listings)}{/if}</a></li>
			<li><a href="#tab-compare-cars" data-toggle="tab"><span class="fa fa-exchange"></span>{if $car_blocks_data.compare_listings} {count($car_blocks_data.compare_listings)}{/if}</a></li>
			<li class="active"><a href="#tab-recently-viewed-cars" data-toggle="tab"><span class="fa fa-clock-o"></span></a></li>
		</ul>
	</div>
	<div class="b-tools__content">
		<div class="tab-content">
			<div class="tab-pane active" id="tab-recently-viewed-cars">
				{if $car_blocks_data.recently_viewed}
					<div class="ia-items recently-viewed-cars">
						{foreach $car_blocks_data.recently_viewed as $entry}
							<div class="ia-item">
								{if !empty($entry.pictures[0])}
									<a href="{ia_url type='url' item='autos' data=$entry}" class="ia-item__image">{ia_image type='thumbnail' file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' width=60}</a>
								{/if}

								<div class="ia-item__content">
									<h5 class="ia-item__title">
										<a href="{ia_url type='url' item='autos' data=$entry}">{$entry.model|strip_tags|truncate:'30'}</a>
									</h5>
									{if !empty($entry.price)}<p><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
								</div>
							</div>
						{/foreach}
					</div>
				{else}
					<div class="alert alert-info">{lang key='no_recently_viewed_cars'}</div>
				{/if}
			</div>
			<div class="tab-pane" id="tab-saved-cars">
				{if $car_blocks_data.saved_listings}
					<div class="ia-items saved-cars">
						{foreach $car_blocks_data.saved_listings as $entry}
							<div class="ia-item">
								{if !empty($entry.pictures[0])}
									<a href="{ia_url type='url' item='autos' data=$entry}" class="ia-item__image">{ia_image type='thumbnail' file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' width=60}</a>
								{/if}

								<div class="ia-item__content">
									<h5 class="ia-item__title">
										<a href="{ia_url type='url' item='autos' data=$entry}">{$entry.model|strip_tags|truncate:'30'}</a>
									</h5>
									{if !empty($entry.price)}<p><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
								</div>
							</div>
						{/foreach}
					</div>
				{else}
					<div class="alert alert-info">{lang key='no_saved_cars'}</div>
				{/if}
			</div>
			<div class="tab-pane" id="tab-compare-cars">
				{if $car_blocks_data.compare_listings}
					<div class="ia-items compare-cars">
						{foreach $car_blocks_data.compare_listings as $entry}
							<div class="ia-item">
								{if !empty($entry.pictures[0])}
									<a href="{ia_url type='url' item='autos' data=$entry}" class="ia-item__image">{ia_image type='thumbnail' type='thumbnail' file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' width=60}</a>
								{/if}

								<div class="ia-item__content">
									<h5 class="ia-item__title">
										<a href="{ia_url type='url' item='autos' data=$entry}">{$entry.model|strip_tags|truncate:'30'}</a>
									</h5>
									{if !empty($entry.price)}<p><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
								</div>
							</div>
						{/foreach}
						<div class="ia-items__action m-t">
							<a href="{$core.packages.autos.url}comparison" class="btn btn-primary">{lang key='compare'}</a>
						</div>
					</div>
				{else}
					<div class="alert alert-info">{lang key='no_listings_selected_to_compare'}</div>
				{/if}
			</div>
		</div>
	</div>
</div>
