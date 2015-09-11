{default $embedFromNodeId=false()}
<div class="embed folder folder_sponsors">
   {let $children =  fetch_alias( 'children',hash('parent_node_id',$object.main_node_id,'sort_by',$object.main_node.sort_array))}
   {* let $children =  fetch_alias( 'children',hash('parent_node_id',$object.main_node_id,'sort_by',array('name',1))) *}
   <div class="isotopeContSponsors">
      {foreach $children as $child}
         {content_view_gui embedFromNodeId=$embedFromNodeId view=embed content_object=$child.object}
      {/foreach}
   </div>
</div>