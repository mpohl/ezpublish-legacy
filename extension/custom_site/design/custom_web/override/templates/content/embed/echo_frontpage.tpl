{default embedPos=false()}

{def $teaserimg = $object.data_map.teaserimage}

<div class="embed echo_frontpage">
   <article class="post">
      {if eq($embedPos,'right')}
         <h3>
            {$object.name}
         </h3>
      {else}
         {*
         <h2>
            {$object.name}
         </h2>
        *}
      {/if}
      <a title="Weiterlesen..." href={$object.main_node.url_alias|ezurl()}>
         {if and($teaserimg.has_content,$teaserimg.content.relation_list.0)}
            {let $image = fetch(content,object, hash(object_id, $teaserimg.content.relation_list.0.contentobject_id))}
            {attribute_view_gui attribute=$image.data_map.image image_class=teaser}
            {/let}
         {/if}

         {if $object.data_map.title.has_content}
            <div class="title">
               <p>
               {attribute_view_gui attribute=$object.data_map.title}
               </p>
            </div>
         {/if}
      </a>

      {*<a class="readmore" href={$object.main_node.url_alias|ezurl()}>Weiterlesen...</a>*}
   </article>
</div>