{*$sliderRelation.content.relation_list|objInspect(0,1)*}
{def $sliderRelation = first_set($node.object.data_map.mainslider,$node.parent.object.data_map.mainslider,false())
$sliderRelation_nodeId_list = array()
$mainsliderNodes = array()
$contentRightRelations= first_set($node.object.data_map.contentrelations_right,false()) }

{if and($sliderRelation,$sliderRelation.has_content)}
    {foreach $sliderRelation.content.relation_list as $sliderRelation_list}
        {if $sliderRelation_list.in_trash|not()}
            {set $mainsliderNodes=$mainsliderNodes|append(fetch( content, node, hash( node_id, $sliderRelation_list.node_id ) ))}
        {/if}
    {/foreach}
{/if}

<section class="flex-wrapper">
    {include uri='design:parts/flexslider.tpl' galleryNodes=$mainsliderNodes}
</section>

<!-- page container: START -->
<section class="pagecontainer">
    <!-- left container: START -->
    <section class="leftcontainer pageContent photoswipe-gallery">

        {if $node.object.data_map.body.has_content}
            <article class="post data-body">
                {attribute_view_gui attribute=$node.object.data_map.body}
               <div class="post-date">{$node.object.data_map.publication_date.content.timestamp|datetime('custom','%d. %F %Y')}</div>
            </article>
        {/if}

    </section>
    <!-- left container: END -->
    <!-- right container: START -->
    <section class="rightcontainer pageContent photoswipe-gallery">

        {* subnavigation START *}
        {*include uri='design:parts/rightContentMenu.tpl'*}
        {* subnavigation END *}

        <a href={$node.parent.url_alias|ezurl} class="button button-widget button-back">Zurück zur Übersicht</a>

        {if and($contentRightRelations.has_content,$contentRightRelations.content.relation_list)}
            {foreach $contentRightRelations.content.relation_list as $index=>$relation}
                <article class="post data-relation">
                    {if $relation.in_trash|not()}
                        {content_view_gui
                        view=embed
                        view_parameters=$view_parameters
                        embedFromNodeId=$node.node_id
                        content_object=fetch( content, object, hash( object_id, $relation.contentobject_id ) )}
                    {/if}
                </article>
            {/foreach}
        {/if}

    </section>
    <!-- right container: END -->
</section>
<!-- page container: END -->