{default $embedFromNodeId=false()}
<div class="embed folder folder_galleries">
   {let $children =  fetch_alias( 'children',hash('parent_node_id',$object.main_node_id,'sort_by',array('published',false())))}
   {foreach $children as $child}
      {content_view_gui embedFromNodeId=$embedFromNodeId view=embed content_object=$child.object}
   {/foreach}
</div>
