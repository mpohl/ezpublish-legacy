{default sponsorNodeId = first_set(ezini('SiteSettings','SponsorNodeId','site.ini'),false())
         sponsoren=false()}

{if $sponsorNodeId}
   {set $sponsoren =  fetch_alias( 'children',hash('parent_node_id',$sponsorNodeId))}
{/if}

{*$sponsoren.0.data_map.url.content|attribute('show')*}

{if $sponsoren}
   <div class="logos-title">
      <a href="/Unser-Verein/Sponsoren-Partner-und-Foerderer" style="color:#fff">Sponsoren, Partner und Förderer</a>
   </div>
   <section class="transparent-bg">
      <div id="sponsoren">
         {foreach $sponsoren as $sponsor}
            <div class="slide">
               <a href={$sponsor.data_map.url.content|ezurl} target="_blank" title="{$sponsor.name}">
                  {attribute_view_gui attribute=$sponsor.data_map.image image_class=sponsor}
               </a>
            </div>
         {/foreach}
      </div>
   </section>
{/if}