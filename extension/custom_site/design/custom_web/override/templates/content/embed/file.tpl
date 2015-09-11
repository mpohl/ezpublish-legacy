{default $currentNode=$object.main_node}

{def $name = $object.data_map.name
   $fileAttr = cond($object.data_map.file.has_content,$object.data_map.file,false())
   $downloadLink = false()}

{if $fileAttr}
   {set $downloadLink = concat( 'content/download/', $fileAttr.contentobject_id, '/', $fileAttr.id,'/version/', $fileAttr.version , '/file/', $fileAttr.content.original_filename|urlencode )|ezurl('no')}
   {*set $downloadLink = $fileAttr.content.filepath|ezurl('no')*}
{/if}


<div class="embed file">
   <a class="linkIconBig {$object.data_map.file.content.mime_type_part}IconBig" href="{$downloadLink}">
      {attribute_view_gui attribute=$name}
      <span class="fileSize">
         {$object.data_map.file.content.mime_type_part|upcase} {$object.data_map.file.content.filesize|si( byte,mega,2 )}
      </span>
   </a>
</div>