{* Folder - Admin preview *}
<div class="content-view-full">
    <div class="class-folder">

        <h1>{$node.data_map.name.content|wash()}</h1>

        {* Description *}
        {if $node.data_map.description.has_content}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

        </div>
</div>
