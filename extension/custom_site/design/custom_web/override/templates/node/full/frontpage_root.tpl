{*$sliderRelation.content.relation_list|objInspect(0,1)*}
{def $sliderRelation = first_set($node.object.data_map.mainslider,false())
     $sliderRelation_nodeId_list = array()
     $mainsliderNodes = array()
     $contentRelations = first_set($node.object.data_map.contentrelations,false())
     $contentRightRelations= first_set($node.object.data_map.contentrelations_right,false()) }

{if and($sliderRelation,$sliderRelation.has_content)}
   {foreach $sliderRelation.content.relation_list as $sliderRelation_list}
      {if $sliderRelation_list.in_trash|not()}
         {set $mainsliderNodes=$mainsliderNodes|append(fetch( content, node, hash( node_id, $sliderRelation_list.node_id ) ))}
      {/if}
   {/foreach}
{/if}
<section class="flex-wrapper ">
   {include uri='design:parts/flexslider.tpl' galleryNodes=$mainsliderNodes}
</section>

<!-- page container: START -->
<section class="pagecontainer frontpage_root">
   <!-- left container: START -->
   <section class="leftcontainer pageContent">

      {if and($contentRelations.has_content,$contentRelations.content.relation_list)}
         <div class="grid min-resp">
            {foreach $contentRelations.content.relation_list as $index=>$relation}
                {let $relationObject=fetch(content,object, hash(object_id, $relation.contentobject_id))}
                    {if and($relationObject,$relationObject.has_visible_node)}

                          <article class="post data-relation unit half">
                               {content_view_gui
                               view=embed
                               view_parameters=$view_parameters
                               embedFromNodeId=$node.node_id
                               content_object=$relationObject}
                           </article>

                    {/if}
                {/let}
            {/foreach}
         </div>
      {/if}

   </section>
   <!-- left container: END -->
   <!-- right container: START -->
   <section class="rightcontainer pageContent">
       {if $node.object.data_map.body.has_content}
           <h2 class="frontpage_claim">
               {attribute_view_gui attribute=$node.object.data_map.body}
           </h2>
       {/if}

      {* subnavigation START *}
      {include uri='design:parts/rightContentMenu.tpl'}
      {* subnavigation END *}

      {if and($contentRightRelations.has_content,$contentRightRelations.content.relation_list)}
         {foreach $contentRightRelations.content.relation_list as $index=>$relation}
            <article class="post data-relation">
               {if $relation.in_trash|not()}
                  {content_view_gui
                  view=embed
                  view_parameters=$view_parameters
                  embedFromNodeId=$node.node_id
                  embedPos=right
                  content_object=fetch( content, object, hash( object_id, $relation.contentobject_id ) )}
               {/if}
            </article>
         {/foreach}
      {/if}
   </section>
   <!-- right container: END -->
</section>
<!-- page container: END -->