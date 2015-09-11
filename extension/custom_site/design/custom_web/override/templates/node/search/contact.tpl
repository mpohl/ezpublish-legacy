{default use_url_translation=false()}
   <h3>
    <a href={concat('/Kontakt/Ansprechpartner#cont',$node.node_id)|ezurl()}>
      {attribute_view_gui attribute=$node.object.data_map.anrede}
      {attribute_view_gui attribute=$node.object.data_map.vorname}
      {attribute_view_gui attribute=$node.object.data_map.nachname}
    </a>

    </h3>
    <p>
      {if is_set($node.path.1)}
         {$node.path.1.name|wash()}
         {if is_set($node.path.2)} | {$node.path.2.name|wash()}{/if}
      {/if}
   </p>
{/default}