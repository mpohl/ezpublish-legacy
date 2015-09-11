{*$node.children|objInspect(0,1)*}
{*$node|attribute('show')*}
{foreach $node.children as $child}
    {if and($child.is_hidden|not,$child.is_invisible|not) }
        <li>
            {content_view_gui view=embed_mainslider content_object=$child}
        </li>
    {/if}
{/foreach}