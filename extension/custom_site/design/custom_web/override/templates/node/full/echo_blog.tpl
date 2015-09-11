{*$sliderRelation.content.relation_list|objInspect(0,1)*}
{def $sliderRelation = first_set($node.object.data_map.mainslider,false())
     $sliderRelation_nodeId_list = array()
     $mainsliderNodes = array()
     $limit = 15
     $children =  fetch_alias( 'echo_blog_posts',hash('parent_node_id',$node.node_id,'limit',$limit,'offset',$view_parameters.offset))
     $children_count =  fetch_alias( 'echo_blog_posts_count',hash('parent_node_id',$node.node_id))
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
   <section class="leftcontainer pageContent">

      {if $node.object.data_map.body.has_content}
         <article class="post data-body">
            {attribute_view_gui attribute=$node.object.data_map.body}
         </article>
      {/if}


      {foreach $children as $index=>$child}
         {content_view_gui view=embed content_object=$child.object}
      {/foreach}

      {include name=navigator
      uri='design:navigator/google.tpl'
      page_uri=$node.url_alias
      item_count=$children_count
      view_parameters=$view_parameters
      item_limit=$limit}

      {*if and($contentRelations.has_content,$contentRelations.content.relation_list)}
         {foreach $contentRelations.content.relation_list as $index=>$relation}
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
      {/if*}

   </section>
   <!-- left container: END -->
   <!-- right container: START -->
   <section class="rightcontainer pageContent">

      {* subnavigation START *}
      {*include uri='design:parts/rightContentMenu.tpl'*}
      {* subnavigation END *}

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