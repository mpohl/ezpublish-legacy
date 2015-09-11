{def $anrede = $object.data_map.anrede
   $vorname = $object.data_map.vorname
$nachname = $object.data_map.nachname
$telefon = $object.data_map.telefon
$mail = $object.data_map.mail
$anschrift = $object.data_map.anschrift
$description = $object.data_map.description}

<p>
   <a name="cont{$object.main_node_id}" id="cont{$object.main_node_id}"></a>
   {attribute_view_gui attribute=$anrede} {attribute_view_gui attribute=$vorname} {attribute_view_gui attribute=$nachname}
   {if $description.has_content}
      <br>
      {attribute_view_gui attribute=$description}
   {/if}
   {if $anschrift.has_content}
      <br>
      {attribute_view_gui attribute=$anschrift}
   {/if}
   {if $telefon.has_content}
      <br>
      Tel.: {attribute_view_gui attribute=$telefon}
   {/if}
   {if $mail.has_content}
      <br>
      {attribute_view_gui attribute=$mail}
   {/if}
</p>



