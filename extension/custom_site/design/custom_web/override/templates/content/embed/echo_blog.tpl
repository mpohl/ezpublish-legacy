{def $limit = 3
   $children =  fetch_alias( 'echo_blog_posts',hash('parent_node_id',$object.main_node_id,'limit',$limit,'offset',$view_parameters.offset))
   $children_count =  fetch_alias( 'echo_blog_posts_count',hash('parent_node_id',$object.main_node_id))}

<div class="embed echo_blog">
  {* <h2>Aktuelles</h2> *}

   {foreach $children as $index=>$child}
      {content_view_gui view=embed content_object=$child.object}
   {/foreach}

   {*if gt($children_count,$limit)}
      <a href={$object.main_node.url_alias|ezurl()} class="button next-prev">Alle Newsartikel ansehen</a>
   {/if*}

   {*include name=navigator
   uri='design:navigator/google.tpl'
   page_uri=$currentNode.url_alias
   item_count=$children_count
   view_parameters=$view_parameters
   item_limit=$limit*}
</div>