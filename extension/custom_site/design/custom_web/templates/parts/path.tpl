 {foreach $module_result.path as $Path offset 2}
     {if $Path.url}
         {if is_set($Path.url_alias)}
             <a  class="breadcrump" href={$Path.url_alias|ezurl}>
                <span class="icon-vfb-victoria-{$Path.node_id}"></span>
                {$Path.text|wash}
             </a>&nbsp;/
         {else}
             <a  class="breadcrump" href={$Path.url|ezurl}>
                <span class="icon-vfb-victoria-{$Path.node_id}"></span>
                {$Path.text|wash}
             </a>&nbsp;/
         {/if}
     {else}
         <span class="icon-vfb-victoria-{$Path.node_id}"></span>
         {$Path.text|wash}
     {/if}
 {/foreach}
