{attribute_view_gui attribute=$object.data_map.image image_class=flexslider}
{if $object.data_map.caption.has_content}
   <div class="flex-title">
      {attribute_view_gui attribute=$object.data_map.caption}
   </div>
{/if}