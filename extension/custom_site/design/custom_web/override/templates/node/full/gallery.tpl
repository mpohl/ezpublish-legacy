{def $sliderRelation = first_set($node.object.data_map.mainslider,false())
$sliderRelation_nodeId_list = array()
$mainsliderNodes = array()
$contentRelations = first_set($node.object.data_map.contentrelations,false()) }
{*
{if and($sliderRelation,$sliderRelation.has_content)}
   {foreach $sliderRelation.content.relation_list as $sliderRelation_list}
      {if $sliderRelation_list.in_trash|not()}
         {set $mainsliderNodes=$mainsliderNodes|append(fetch( content, node, hash( node_id, $sliderRelation_list.node_id ) ))}
      {/if}
   {/foreach}
{/if}
*}

<section class="flex-wrapper">
   {*include uri='design:parts/flexslider.tpl' galleryNodes=$mainsliderNodes*}
</section>

<!-- page container: START -->
<section class="pagecontainer full gallery">
   <!-- left container: START -->
   <section class="leftcontainer pageContent">
      <h1>{$node.name}</h1>
      {attribute_view_gui attribute=$node.object.data_map.description}
   </section>
   <!-- left container: END -->
   <!-- right container: START -->
   <section class="rightcontainer pageContent">
      {if and(is_set($view_parameters.from),$view_parameters.from|is_numeric())}
         {let $fromNode = fetch( 'content', 'node', hash( 'node_id', $view_parameters.from ) ) }
            {if and($fromNode,$fromNode.url_alias)}
               <a href={$fromNode.url_alias|ezurl} class="button button-widget">Zurück zur Seite</a>
            {/if}
         {/let}
      {/if}
   </section>
   <!-- right container: END -->
   <div class="clear"></div>

   <div class="isotopeCont photoswipe-gallery">
      {let $children =  fetch_alias( 'children',hash('parent_node_id',$node.node_id,'sort_by',array('priority',false())))}
      {foreach $children as $index => $child}
         {content_view_gui data-imagelightbox=$node.object.id view=embed content_object=$child.object }
      {/foreach}
   </div>

</section>
{*ezscript_load(array( 'vendor/isotope.pkgd.min.js' ) )*}
