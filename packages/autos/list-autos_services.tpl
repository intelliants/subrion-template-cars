<div class="ia-item ia-item--border ia-item--{$listing.status} {if $listing.featured}ia-item--featured{/if} {if $listing.sponsored}ia-item--sponsored{/if}">
	{if $listing.logo}
		{$logo = unserialize($listing.logo)}
		<a class="ia-item__image" href="{ia_url item='autos_services' data=$listing type='url'}">
			{printImage imgfile=$logo.path title="{$listing.title}" class='img-responsive'}
		</a>
	{/if}

	<div class="ia-item__labels">
		{if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
		{if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}

		{if $member && $member.id == $listing.member_id && 'active' != $listing.status}
			<span class="label label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}"><span class="fa fa-warning"></span> {lang key=$listing.status default=$listing.status}</span>
		{/if}
	</div>

	<div class="ia-item__content">
		<div class="ia-item__actions">
			{printFavorites item=$listing itemtype='autos_services' guests=true}
			{accountActions item=$listing itemtype='autos_services'}
			<a href="{ia_url item='autos_services' data=$listing type='url'}">{lang key='details'} <span class="fa fa-angle-double-right"></span></a>
		</div>

		<div class="ia-item__title">
			{ia_url item='autos_services' type='link' data=$listing text="{$listing.title}"}
			<small>
				{$services = explode(',', $listing.categories)}

				{foreach $services as $service}
					{lang key="field_autos_services_categories_{$service}"}{if !$service@last}, {/if}
				{/foreach}
			</small>
		</div>

		<div class="ia-item__additional">
			{if isset($listing.company_phone) && $listing.company_phone}
				<p><span class="fa fa-phone"></span> {$listing.company_phone}</p>
			{/if}
		</div>
		<p>{$listing.description|escape|truncate:250:'...':true}</p>
	</div>
</div>