<div class="ia-card -{$listing.status} {if 'hidden' == $listing.status}-hidden{/if} {if $listing.featured}-featured{/if} {if $listing.sponsored}-sponsored{/if}">

	{if $listing.auto_pictures}
		<a class="ia-card__image" href="{$listing.link}">
			{printImage imgfile=$listing.auto_pictures[0]['path'] title=$listing.model}
			<span class="ia-card__support-info">
				<span class="pull-left"><span class="fa fa-image"></span> {$listing.auto_pictures_num}</span>
				<span class="pull-right">{$listing.date_added|date_format:$config.date_format}</span>
			</span>
		</a>

		{if $listing.sponsored}
			<div class="ia-card__image__more">
				{foreach $listing.auto_pictures as $pic}
					{if !$pic@first}
						<a href="{$listing.link}">
							{printImage imgfile=$pic['path'] title=$listing.model}
						</a>
					{/if}
					{if $pic@iteration == 4}
						{break}
					{/if}
				{/foreach}
			</div>
		{/if}
	{/if}

	<div class="ia-card__content">
		<div class="ia-card__actions dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
			<ul class="dropdown-menu pull-right">
				<li><a href="#">Add to wishlist</a></li>
				<li><a href="#">Add to compare</a></li>
				<li><a href="#">Report</a></li>
				<li class="divider"></li>
				<li><a href="#">Edit</a></li>
			</ul>
		</div>
		{if $listing.sponsored}
			<div class="badge badge-warning pull-right"><span class="fa fa-star"></span></div>
		{/if}
		<a class="ia-card__title" href="{$listing.link}">{$listing.model}, {$listing.release_year}</a>
		<p class="ia-card__sub-title">{$listing.price}</p>
		<table class="ia-card__info-table">
			<tbody>
				<td><img src="{$img}icon-engine.png" alt=""></td>
				<td><b>{lang key="field_engine_{$listing.engine}"} / {lang key="field_engine_type_{$listing.engine_type}"}{if $listing.engine_size} / {$listing.engine_size}{/if}</b></td>
				<tr>
					<td><img src="{$img}icon-body.png" alt=""></td>
					<td>
						<div class="wrp">
							<a href="{$packages.autos.url}body-style/{$listing.body_type}/">{lang key="field_body_type_{$listing.body_type}"}</a>
						</div>
					</td>
				</tr>
				<tr>
					<td><img src="{$img}icon-transmission.png" alt=""></td>
					<td><b>{lang key="field_transmission_{$listing.transmission}"}</b></td>
				</tr>
				{if $listing.mileage}
					<tr>
						<td><img src="{$img}icon-speed.png" alt=""></td>
						<td>{$listing.mileage}</td>
					</tr>
				{/if}
			</tbody>
		</table>
		{*<table class="ia-card__info-table">
			<tbody>
				<tr>
					<td>{lang key='field_auto_type'}</td>
					<td><div class="wrp"></div></td>
				</tr>
				{if $listing.mileage}
					<tr class="-additional">
						<td>{lang key='field_mileage'}</td>
						<td>{$listing.mileage}</td>
					</tr>
				{/if}
				<tr>
					<td>{lang key='field_body_type'}:</td>
					<td>
						<div class="wrp">
							<a href="{$packages.autos.url}body-style/{$listing.body_type}/">{lang key="field_body_type_{$listing.body_type}"}</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>{lang key='field_exterior_color'}:</td>
					<td><b>{lang key="field_exterior_color_{$listing.exterior_color}"}</b></td>
				</tr>
				<tr class="-additional">
					
				</tr>
				<tr class="-additional">
					<td>{lang key='field_transmission'}</td>
					<td><b>{lang key="field_transmission_{$listing.transmission}"}</b></td>
				</tr>
			</tbody>
		</table>*}
		{*<p class="ia-card__additional">{$listing.additional_info|escape:'html'|truncate:200:'...':true}</p>*}
	</div>
</div>

{*
<div class="ia-item ia-item--bordered {if 'hidden' == $listing.status}status-{/if}{$listing.status} {if $listing.featured}ia-item-featured{/if} {if $listing.sponsored}ia-item-sponsored{/if}">
	{if $listing.auto_pictures}
		<a class="ia-item__image" href="{ia_url item='autos' type='url' data=$listing}">
			{printImage imgfile=$listing.auto_pictures[0]['path'] title="{$listing.model} {$listing.release_year}" class='img-responsive'}
			<span class="label label-info"><span class="fa fa-image"></span> {$listing.auto_pictures_num}</span>
		</a>
	{/if}
	<div class="ia-item__content">
		<div class="ia-item__title">
			{ia_url item='autos' type='link' data=$listing text="{$listing.model} {$listing.release_year}"}
		</div>
		
		{if $listing.price}
			<div class="ia-item__tag"><span class="fa fa-tag"></span> {$config.currency} {$listing.price}</div>
		{/if}

		<ul class="ia-list-items">
			<li><span class="muted">{lang key='field_body_type'}</span>: <a href="{$packages.autos.url}body-style/{$listing.body_type}/">{lang key="field_body_type_{$listing.body_type}"}</a></li>
			<li><span class="muted">{lang key='field_interior_color'}</span>: {lang key="field_interior_color_{$listing.interior_color}"}</li>
			<li><span class="muted">{lang key='field_engine'}</span>: {$listing.engine_size} cc / {$listing.horse_power} HP</li>
			{if $listing.mileage}
				<li><span class="muted">{lang key='field_mileage'}</span>: {$listing.mileage}</li>
			{/if}
		</ul>

		<div class="ia-item__actions">
			{accountActions item=$listing itemtype='autos' classname='btn-info'}
			{printFavorites item=$listing itemtype='autos' classname='btn-info'}
			{ia_url item='autos' type='icon_text' text='details' data=$listing}
		</div>
	</div>
</div>
*}
{*
<div class="media ia-item ia-item-bordered {if 'hidden' == $listing.status}status-{/if}{$listing.status} {if $listing.featured}ia-item-featured{/if} {if $listing.sponsored}ia-item-sponsored{/if}" id="tdlisting{$listing.id}">
	{if $listing.featured}<span class="ia-badge ia-badge-featured" title="{lang key='featured'}"><i class="icon-star"></i></span>{/if}
	{if $listing.sponsored}<span class="ia-badge ia-badge-sponsored" title="{lang key='sponsored'}"><i class="icon-dollar"></i></span>{/if}
	{if $member && $member.id == $listing.member_id && 'active' != $listing.status}
		<span class="ia-badge ia-badge-{$listing.status}" title="{lang key=$listing.status default=$listing.status}"><i class="icon-warning-sign"></i></span>
	{/if}

	{if $listing.auto_pictures}
		<a class="pull-left media-object thumbnail" href="{ia_url item='autos' type='url' data=$listing}">
			{printImage imgfile=$listing.auto_pictures[0]['path'] title="{$listing.model} {$listing.release_year}" width=150}
		</a>
	{/if}

	<div class="media-body">
		<h3 class="media-heading">
			{ia_url item='autos' type='link' data=$listing text="{$listing.model} {$listing.release_year}"}
		</h3>
	</div>

	{if $listing.price}
		<span class="label label-info">{$config.currency} {$listing.price}</span>
	{/if}

	<ul class="ia-list-items">
		<li><span class="muted">{lang key='field_body_type'}</span>: <a href="{$packages.autos.url}body-style/{$listing.body_type}/">{lang key="field_body_type_{$listing.body_type}"}</a></li>
		<li><span class="muted">{lang key='field_interior_color'}</span>: {lang key="field_interior_color_{$listing.interior_color}"}</li>
		<li><span class="muted">{lang key='field_engine'}</span>: {$listing.engine_size} cc / {$listing.horse_power} HP</li>
		{if $listing.mileage}
			<li><span class="muted">{lang key='field_mileage'}</span>: {$listing.mileage}</li>
		{/if}
	</ul>

	<div class="ia-item-panel">
		{accountActions item=$listing itemtype='autos' classname='btn-info pull-right'}
		{printFavorites item=$listing itemtype='autos' classname='btn-info pull-right'}
		{ia_url item='autos' type='icon_text' text='details' data=$listing classname='pull-right'}
	</div>
</div>
*}