<div class="v-item">
	<div class="v-item__header">
		<ul class="content__actions">
			{foreach $core.actions as $name => $action}
				<li>
					{if 'action-favorites' == $name}
						{printFavorites item=$item itemtype=$item.item}
					{else}
						<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
							<span class="fa fa-{$name}" title="{$action.title}"></span>
						</a>
					{/if}
				</li>
			{/foreach}
		</ul>
		<h2>
			<span>{$item.title}</span>
		</h2>
	</div>
</div>

<div class="row">
	<div class="col-md-4">
		<table class="v-item-table">
			<tbody>
				<tr>
					<td>{lang key='field_autos_parts_price'}</td>
					<td><b class="text-success">{$core.config.currency} {$item.price}</b></td>
				</tr>
				<tr>
					<td>{lang key='field_autos_parts_categories'}</td>
					<td>
						{$cats = explode(',', $item.categories)}

						{foreach $cats as $cat}
							{lang key="field_autos_parts_categories_{$cat}"}{if !$cat@last}, {/if}
						{/foreach}
					</td>
				</tr>
				{if $item.part_number}
					<tr>
						<td>{lang key='field_autos_parts_part_number'}</td>
						<td>{$item.part_number}</td>
					</tr>
				{/if}
			</tbody>
		</table>
	</div>

	<div class="col-md-8">
		{if !empty($item.pictures)}
			{ia_add_media files='fotorama'}

			<div class="v-item__gallery">
				<div class="fotorama" 
					 data-nav="thumbs"
					 data-width="100%"
					 data-ratio="800/400"
					 data-allowfullscreen="true"
					 data-fit="{$core.config.template_fotorama_part}">
					{foreach $item.pictures as $entry}
						<a class="v-item__gallery__item" href="{ia_image file=$entry url=true type='large'}">{ia_image type='large' file=$entry}</a>
					{/foreach}
				</div>
			</div>
		{/if}

		<div class="v-item-info">
			<div class="v-item-info__section">
				<h3>{lang key='details'}</h3>
				{$item.description|escape:'html'}
			</div>
		</div>

		<div class="m-t-lg">
			{ia_hooker name='smartyItemViewBeforeTabs'}

			{include file='item-view-tabs.tpl' isView=true exceptions=['pictures', 'title', 'price', 'categories', 'description', 'part_number'] class='ia-item-view-tabs'}

			{ia_hooker name='smartyViewListingBeforeFooter'}
		</div>
	</div>
</div>