{if and($node.is_hidden|not,$node.is_invisible|not) }
    <li>
        {content_view_gui view=embed_mainslider content_object=$node}
    </li>
{/if}
