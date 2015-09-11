{default $view_parameters=array()}
{def $currentNode = false()}
{if is_set($node)}
   {set $currentNode = $node}
{elseif is_set($object)}
   {set $currentNode = $object.main_node}
{/if}


<div class="embed customcode">
   {if $object.data_map.template.has_content}
      {include uri=concat('design:parts/customcode/', $object.data_map.template.content, '.tpl') currentNode=$currentNode view_parameters=$view_parameters}
      {attribute_view_gui attribute=$object.data_map.code}
   {else}
      {$object.data_map.code.content}
   {/if}
</div>
