<div class="embed echo_blogpost">
   <a href={$object.main_node.url_alias|ezurl()}>
      <article class="post">
         <figure>
            {if $object.data_map.image.has_content}
                  {attribute_view_gui attribute=$object.data_map.image image_class=blogpost_teaser}
            {/if}
            <figcaption>
               <h2>{$object.name}</h2>
            </figcaption>
         </figure>

            {attribute_view_gui attribute=$object.data_map.teaser}
            <div class="post-date">{$object.data_map.publication_date.content.timestamp|datetime('custom','%d. %F %Y')}</div>
            <span class="readmore">Weiterlesen...</span>

      </article>
   </a>

   {*
   <article class="post">
      <h3>
         <a href={$object.main_node.url_alias|ezurl()}>
            {$object.name}
         </a>
      </h3>
      <p>
         {attribute_view_gui attribute=$object.data_map.teaser}
      </p>
      <a href={$object.main_node.url_alias|ezurl()}>Weiterlesen...</a>
   </article>
   *}
</div>