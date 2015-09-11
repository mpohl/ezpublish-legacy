{let $limit = 10
     $posts =  fetch_alias( 'all_echo_blog_posts',hash('limit',$limit))}
   <h2>
      Aktuelles
   </h2>

   {foreach $posts as $index=>$post}
      {content_view_gui view=embed content_object=$post.object}
   {/foreach}
{/let}