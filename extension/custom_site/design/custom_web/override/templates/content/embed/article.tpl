<div class="embed article">
   <article class="post">
      <h3>
         <a href={$object.main_node.url_alias|ezurl()}>
            {$object.name}
         </a>
      </h3>
      <p>
         {attribute_view_gui attribute=$object.data_map.body}
      </p>
      <a href={$object.main_node.url_alias|ezurl()}>Weiterlesen...</a>
   </article>
</div>