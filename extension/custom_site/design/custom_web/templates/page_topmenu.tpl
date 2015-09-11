{def $itemsTop = fetch_alias( 'main_menu_top')
   $indexPage = ezini( 'SiteSettings', 'IndexPage' , 'site.ini' )
   $itemsSub = false()
}
<a class="toggleMenu" href="#">Menu</a>
<nav>
   <ul id="mainmenu">
      {foreach $itemsTop as $itemTop}
         {let $itemTopActiveClass = ''
            $itemTopHref = $itemTop.url_alias}

            {if and(is_set($pagedata.path_id_array[1]),eq($pagedata.path_id_array[1],$itemTop.node_id))}
               {set $itemTopActiveClass='active'}
            {/if}

            {if eq(concat('/content/view/full/',$itemTop.node_id,'/'),$indexPage)}
               {set $itemTopHref=''}
            {else}
               {* sub items*}
               {*set $itemsSub = fetch_alias( 'main_menu_sub',hash('parent_node_id',$itemTop.node_id))*}
               {* link to first child *}
               {if $itemsSub}
                  {set $itemTopHref = $itemsSub[0].url_alias}
               {/if}
            {/if}

            <li class="{$itemTopActiveClass}">
               <a href={$itemTopHref|ezurl}><span>{$itemTop.name}</span></a>
               {if $itemsSub}
                  <ul>
                     {foreach $itemsSub as $itemSub}
                        {let $itemSubActiveClass = ''}
                           {if and(gt($pagedata.path_id_array|count,2),eq($pagedata.path_id_array[2],$itemSub.node_id))}
                              {set $itemSubActiveClass='active'}
                           {/if}
                           <li class="{$itemSubActiveClass}">
                              <a class="nodeId_{$itemSub.node_id}" href={$itemSub.url_alias|ezurl}>
                                 <span class="icon-vfb-victoria-{$itemSub.node_id}"></span>
                                 <span>{$itemSub.name}</span>
                              </a>
                           </li>
                        {/let}
                     {/foreach}
                  </ul>
               {/if}
            </li>

         {/let}
      {/foreach}
   </ul>
</nav>