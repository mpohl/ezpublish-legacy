<div class="content-view-children">

   {* Generic children list for admin interface. *}
   {def $item_type    = ezpreference( 'admin_list_limit' )
   $number_of_items = min( $item_type, 3)|choose( 10, 10, 25, 50 )
   $can_remove   = false()
   $can_move     = false()
   $can_edit     = false()
   $can_create   = false()
   $can_copy     = false()
   $current_path = first_set( $node.path_array[1], 1 )
   $admin_children_viewmode = ezpreference( 'admin_children_viewmode' )
   $children_count = fetch( content, list_count, hash( 'parent_node_id', $node.node_id,
   'objectname_filter', $view_parameters.namefilter ) )
   $children    = array()
   $priority    = and( eq( $node.sort_array[0][0], 'priority' ), $node.can_edit, $children_count ) }


   <!-- Children START -->

   <div class="context-block">
      <form name="children" method="post" action={'content/action'|ezurl}>
         <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
         <input type="hidden" name="ContentObjectID" value="{$node.contentobject_id}" />

         {if $children_count}
            {set $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
            'sort_by', $node.sort_array,
            'limit', $number_of_items,
            'offset', $view_parameters.offset,
            'objectname_filter', $view_parameters.namefilter ) )}
         {/if}


         {* DESIGN: Header START *}<div class="box-header">

            <h2 class="context-title"><a href={$node.depth|gt(1)|choose('/'|ezurl,$node.parent.url_alias|ezurl )} title="{'Up one level.'|i18n(  'design/admin/node/view/full'  )}"><img src={'up-16x16-grey.png'|ezimage} width="16" height="16" alt="{'Up one level.'|i18n( 'design/admin/node/view/full' )}" title="{'Up one level.'|i18n( 'design/admin/node/view/full' )}" /></a>&nbsp;{'Sub items (%children_count)'|i18n( 'design/admin/node/view/full',, hash( '%children_count', $children_count ) )}</h2>

            {* DESIGN: Header END *}</div>

         {* DESIGN: Content START *}<div class="box-content">


            {* Items per page and view mode selector. *}
            <div class="context-toolbar">
               <div class="float-break"></div>
            </div>

            {* Copying operation is allowed if the user can create stuff under the current node. *}
            {set can_copy=$node.can_create}

            {* Check if the current user is allowed to *}
            {* edit or delete any of the children.     *}
            {section var=Children loop=$children}
               {if $Children.item.can_remove}
                  {set can_remove=true()}
               {/if}
               {if $Children.item.can_move}
                  {set $can_move=true()}
               {/if}
               {if $Children.item.can_edit}
                  {set can_edit=true()}
               {/if}
               {if $Children.item.can_create}
                  {set can_create=true()}
               {/if}
            {/section}

            <input type="hidden" name="NodeID" value="{$node.node_id}" />

            {if and( $can_remove, ezini( 'RemoveSettings', 'HideRemoveConfirmation', 'content.ini' )|eq('true') )}
               <input type="hidden" name="HideRemoveConfirmation" value="true" />
            {/if}

            {* Display the actual list of nodes. *}


            {*
            mpohl : multiupload button START
            *}
            <span style="  float: left; margin-right: 5px; position: relative; top:10px;" id="ezbtn-multiupload" class="yui-button yui-menu-button">
          <span class="first-child">

             {if and(
             or( ezini( 'MultiUploadSettings', 'AvailableSubtreeNode', 'ezmultiupload.ini' )|contains( $node.node_id ),
             ezini( 'MultiUploadSettings', 'AvailableClasses', 'ezmultiupload.ini' )|contains( $node.class_identifier ) ) ,
             and( $node.object.can_create, $node.object.content_class.is_container)
             )}

                <button style="padding-left: 28px;" type="button" id="ezbtn-multiupload-button" onclick="location.href='{concat("/ezmultiupload/upload/",$node.node_id)|ezurl('no')}'">
                   <img style="position:absolute;left:5px;" class="ezwt-input-image" src={"ezwt-icon-upload.png"|ezimage} alt="{'Multiupload'|i18n('extension/ezmultiupload')}" /> {'Multiupload'|i18n('extension/ezmultiupload')}
                </button>
             {/if}
          </span>
       </span>

            {*
             mpohl : multiupload button END
            *}

            {include uri='design:children_detailed.tpl'}



            <div class="context-toolbar">
               {include name=navigator
               uri='design:navigator/alphabetical.tpl'
               page_uri=$node.url_alias
               item_count=$children_count
               view_parameters=$view_parameters
               node_id=$node.node_id
               item_limit=$number_of_items}
            </div>

            {* DESIGN: Content END *}</div>

      </form>

   </div>

   {* Load yui code for subitems display even if current node has no children (since cache blocks does not vary by this) *}
   {ezscript_require( array('ezjsc::yui2', 'ezajaxsubitems_datatable.js') )}

   <!-- Children END -->

   {undef $item_type $number_of_items $can_remove $can_move $can_edit $can_create $can_copy $current_path $admin_children_viewmode $children_count $children}
</div>
