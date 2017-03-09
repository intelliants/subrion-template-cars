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
			{if $item.logo}
				{$logo = unserialize($item.logo[0])}
				{ia_image type='thumbnail' file=$logo class='img-circle' width=30}
			{/if}
			<span>{$item.title}</span>
		</h2>
	</div>
</div>

<div class="row">
	<div class="col-md-4">
		<table class="v-item-table">
			<tbody>
				<tr>
					<td>{lang key='field_autos_services_categories'}</td>
					<td>
						{$services = explode(',', $item.categories)}

						{foreach $services as $service}
							{lang key="field_autos_services_categories_{$service}"}{if !$service@last}, {/if}
						{/foreach}
					</td>
				</tr>
				<tr>
					<td>{lang key='field_autos_services_company_address'}</td>
					<td>{$item.company_address}</td>
				</tr>
				<tr>
					<td>{lang key='field_autos_services_company_phone'}</td>
					<td>{$item.company_phone}</td>
				</tr>
				{if $item.company_website}
					<tr>
						<td>{lang key='field_autos_services_company_website'}</td>
						<td>{$item.company_website|linkify}</td>
					</tr>
				{/if}
				{if $item.company_skype}
					<tr>
						<td>{lang key='field_autos_services_company_skype'}</td>
						<td><a href="call:{$item.company_skype}">{$item.company_skype}</a></td>
					</tr>
				{/if}
			</tbody>
		</table>
	</div>

	<div class="col-md-8">
		{if !empty($item.pictures)}
			{ia_add_media files='fotorama'}

			<div class="ia-item-view__gallery">
				<div class="fotorama" 
					 data-nav="thumbs"
					 data-width="100%"
					 data-ratio="800/400"
					 data-allowfullscreen="true"
					 data-fit="{$core.config.template_fotorama_service}">
					{foreach $item.pictures as $entry}
						<a class="ia-item-view__gallery__item" href="{ia_image type='thumbnail' file=$entry url=true type='large'}">{ia_image type='thumbnail' file=$entry title=$entry.title}</a>
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

			{include file='item-view-tabs.tpl' isView=true exceptions=['logo', 'pictures', 'title', 'categories', 'description', 'company_address', 'company_phone', 'company_website', 'company_skype'] class='ia-item-view-tabs'}

			{ia_hooker name='smartyViewListingBeforeFooter'}
		</div>
	</div>
</div>
