{* Default object view template for read-only views
   Displays object content only with no buttons or children *}
{default content_object=$node.object
         content_version=$node.contentobject_version_object
         node_name=$node.name|wash}

<div class="objectheader">
{*
<h2>Default object view. <a class="menuheadlink" href={"/setup/templateview/node/view/plain.tpl"|ezurl}>Click to create a custom template</a></h2>
*}
</div>

<div class="object">
    <h1>{$node_name}  [{$node.object.class_name|wash}]</h1>
    <input type="hidden" name="TopLevelNode" value="{$content_object.main_node_id}" />

    {section name=ContentObjectAttribute loop=$content_version.contentobject_attributes}
    <div class="block">
        <label>{$ContentObjectAttribute:item.contentclass_attribute.name|wash}</label>
    	<p class="box">{attribute_view_gui attribute=$ContentObjectAttribute:item}</p>
    </div>
    {/section}

    <h3>{'Placed in'|i18n('design/standard/node/view')}</h3>
    {section name=Parent loop=$content_object.parent_nodes}
        {let parent_node=fetch(content,node,hash(node_id,$:item))}
        {section name=Path loop=$:parent_node.path}
            {node_view_gui view=text_linked content_node=$:item} /
        {/section}
        {node_view_gui view=text_linked content_node=$:parent_node}<br/>
        {/let}
    {/section}
</div>

    {let name=Object related_objects=$content_version.related_contentobject_array}

      {section name=ContentObject  loop=$Object:related_objects show=$Object:related_objects}

        <div class="block">
        {content_view_gui view=text_linked content_object=$Object:ContentObject:item}
        </div>

      {/section}
    {/let}

{/default}
