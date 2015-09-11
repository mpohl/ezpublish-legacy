<div class="embed folder folder_contacts">
   <h2>Ansprechpartner</h2>



      {let $children =  fetch_alias( 'children',hash('parent_node_id',$object.main_node_id,'sort_by',array('priority',false())))}
      {foreach $children as $child}


            {* $child.object.class_identifier|attribute('show') *}
            {if $child.is_container}
               <h3>{$child.name}</h3>

               {let $children2 =  fetch_alias( 'children',hash('parent_node_id',$child.main_node_id,'sort_by',array('priority',false())))}
               <div class="grid min-resp no-gutters">
               {foreach $children2 as $child2}
                  <div class="unit half">
                  {if $child2.is_container}
                     <h4>{$child2.name}</h4>

                     {let $children3 =  fetch_alias( 'children',hash('parent_node_id',$child2.main_node_id,'sort_by',array('priority',false())))}
                     {foreach $children3 as $child3}
                           {content_view_gui view=embed content_object=$child3.object}
                     {/foreach}
                     {/let}

                  {else}
                     {content_view_gui view=embed content_object=$child2.object}
                  {/if}
                  </div>

               {/foreach}
               </div>
               {/let}

            {else}
               {content_view_gui view=embed content_object=$child.object}
            {/if}


      {/foreach}

</div>