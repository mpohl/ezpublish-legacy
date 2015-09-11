{default $menuNode = $node
         $showFirst = false()}

{if and(is_set($node),gt($node.depth,2))}
   {* 11 = vfb Angebote*}
   {if eq($node.object.section_id,11)}
      {set $showFirst=true()}
      {if ge($node.depth,4)}
         {set $menuNode=$node.path.2}
      {/if}
   {else}
      {set $menuNode=$node.path.1}
   {/if}
{/if}

{if and($menuNode,$menuNode.children)}
   <div class="sidebarbox contentMenu">
      <ul>
         {if $showFirst}
            <li class="{if eq($node.node_id,$menuNode.node_id)}contentMenu-active {/if}">{node_view_gui view=text_linked content_node=$menuNode}</li>
         {/if}
         {foreach $menuNode.children as $item}
            <li class="{if eq($node.node_id,$item.node_id)}contentMenu-active {/if}">{node_view_gui view=text_linked content_node=$item}</li>
         {/foreach}
      </ul>
   </div>
{/if}