{default $embedFromNodeId=false()}
{let $children =  fetch_alias( 'children',hash('parent_node_id',$object.main_node_id,'sort_by',array('priority',false()))) }
{if gt($children|count,1)}
<div class="embed gallery">
   <article class="post">
      <figure>
         <figcaption>
            <h2>
               <a class="button button-widget" href="{concat($object.main_node.url_alias|ezurl('no'),'/(from)/',$embedFromNodeId)}">
                  {$object.name}
               </a>
            </h2>
            <div class="post-date">
               {$object.published|datetime('custom','%d. %F %Y')}
            </div>
         </figcaption>
         <div class="galleryImages object-left gallery-ps-{$object.id}">
            {foreach $children as $index => $child}
               {if eq($index,0)}
                  {content_view_gui view=embed content_object=$child.object data-imagelightbox=$object.id}
                  {*break*}
               {else}
                  {content_view_gui view=embed content_object=$child.object data-imagelightbox=$object.id loadImage=false()}
               {/if}
            {/foreach}
            {*<a href="{concat($object.main_node.url_alias|ezurl('no'),'/(from)/',$embedFromNodeId)}" class="button button-widget">Galerie öffnen</a>*}
         </div>
            <div class="galleryDescr">
               {attribute_view_gui attribute=$object.data_map.description}
            </div>
      </figure>
   </article>
</div>

{/if}
{*

<article class="post">
   <figure>
      <a href="single-post.html">
         <img src="images/photos/blog1.jpg" alt="">
      </a>
      <figcaption>
         <h2><a class="button button-widget" href="single-post.html">Artikel Titel</a></h2>
         <div class="post-date">12. November 2015</div>
      </figcaption>
   </figure>
   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse lacinia ipsum quis diam aliquam vel mollis nisi tempus. Nam et ante urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam luctus, mi vel tincidunt pulvinar, lectus urna vestibulum velit, et pharetra enim sapien eget orci. Mauris in porta neque. In hac habitasse platea dictumst.
      <a href="single-post.html">Weiterlesen...</a>
   </p>
</article>
*}
