{section var=Elements loop=$attribute.content.enumobject_list}
{$Elements.item.enumelement|wash( xhtml )}
{/section}