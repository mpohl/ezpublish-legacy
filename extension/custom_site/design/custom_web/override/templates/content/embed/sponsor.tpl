<figure class="caption-sponsor">
   <div>
      {if $object.data_map.url.has_content}
         <a href={$object.data_map.url.content|ezurl} target="_blank" title="{$object.data_map.url.data_text|wash()}">
      {/if}
         {attribute_view_gui attribute=$object.data_map.image image_class="sponsorgrid" title=$object.data_map.url.data_text|wash()}
      {if $object.data_map.url.has_content}
         </a>
      {/if}
      <p>{$object.name}</p>
   </div>
</figure>
