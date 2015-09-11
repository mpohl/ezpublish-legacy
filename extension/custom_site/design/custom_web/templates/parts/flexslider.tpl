{*$galleryObject.main_node.children|objInspect(0,1)*}
{default $galleryNodes = array()}
{if $galleryNodes}
   <div id="slider" class="flexslider loading">
      <ul class="slides">
         {foreach $galleryNodes as $galleryNode}
            {node_view_gui view=embed_mainslider content_node=$galleryNode}
         {/foreach}
      </ul>
   </div>
{else}
{/if}