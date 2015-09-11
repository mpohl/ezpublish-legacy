<!DOCTYPE html>
<!--[if lt IE 9 ]><html class="unsupported-ie ie" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="{$site.http_equiv.Content-language|wash}"><!--<![endif]-->
<head>
{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

{*include uri='design:page_head_displaystyles.tpl'*}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{def $pagedata        = ezpagedata()
     $inner_column_size = $pagedata.inner_column_size
     $outer_column_size = $pagedata.outer_column_size}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $current_node_id  = $pagedata.node_id}

   <meta name="viewport" content="user-scalable=0,width=device-width,height=device-height,initial-scale=1,maximum-scale=1" />

{include uri='design:page_head.tpl'}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

</head>
<body>
{* Complete page area: START *}
<div id="page" class="{$pagestyle}">

   {if and( is_set( $pagedata.persistent_variable.extra_template_list ),
            $pagedata.persistent_variable.extra_template_list|count() )}
      {foreach $pagedata.persistent_variable.extra_template_list as $extra_template}
         {include uri=concat('design:extra/', $extra_template)}
      {/foreach}
   {/if}
   {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}
   {* Header area: START *}
   {include uri='design:page_header.tpl'}
   <div class="clear"></div>
   {* Header area: END *}

   {* main container : START *}
   <section class="maincontainer">
      {* Path area: START *}
      {* no path for media*}
      {*if and(is_set($module_result.path.0.node_id),eq($module_result.path.0.node_id,43)|not,$pagedata.show_path,gt($module_result.path|count,2))}
         <div class="page-title">
               {include uri='design:page_toppath.tpl'}
         </div>
      {/if*}
      {* Path area: END *}
      {* Toolbar area: START *}
      {*if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
          {include uri='design:page_toolbar.tpl'}
      {/if*}
      {* Toolbar area: END *}
      <div class="contentMobileFirst">
         {* Side menu area: START *}
         {*if $pagedata.left_menu*}
            <div class="contentMenu" style="display: none; pointer-events: auto;">
                {let $currentNode=fetch('content','node',hash('node_id',$current_node_id))}
                  {include uri='design:parts/rightContentMenu.tpl' node=$currentNode}
               {/let}
            </div>
         {*/if*}
         {* Side menu area: END *}
      </div>


         {/cache-block}
         {/cache-block}
         {* Main area: START *}
         {include uri='design:page_mainarea.tpl'}
         {* Main area: END *}
         {cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}


      {*include uri='design:parts/sponsoren.tpl'*}

      {* Footer area: START *}
      {include uri='design:page_footer.tpl'}
      {* Footer area: END *}
      <a href="#" class="back-to-top"></a>
   </section>
   {* main container : END *}
</div>
{* Complete page area: END *}

{* Footer script area: START *}
{include uri='design:page_footer_script.tpl'}
{* Footer script area: END *}

{/cache-block}
{include uri='design:parts/photoswipe.tpl'}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
</html>
