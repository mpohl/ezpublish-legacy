{default  $loadImage = true()
         $object_parameters=array()
         $data-imagelightbox=$object.id
         $data-gallery-id=false()
         $zoom_image_class='zoomed'
         $pixeldif=0
         $pixeldifLimit=500
         $zoomable = false()
         $caption = false()
         }
{let image_variation="false"
     image_variation_zoom = first_set($object.data_map.image.content[$zoom_image_class],false())
      align="center"
      attribute_parameters=$object_parameters
      }

{if is_set($attribute_parameters.size)}
   {set image_variation=$object.data_map.image.content[$attribute_parameters.size]}
{else}
   {set image_variation=$object.data_map.image.content[ezini( 'ImageSettings', 'DefaultEmbedAlias', 'content.ini' )]}
{/if}

{if $object.data_map.caption.has_content}
   {set caption = $object.data_map.caption.content.output.output_text}
{elseif eq($object.data_map.image.content.alternative_text,'')|not}
   {* alt text fallback *}
    {*set caption=concat('<p>',$object.data_map.image.content.alternative_text|wash(xhtml),'</p>')*}
{/if}

{*$image_variation_zoom|attribute('show')*}

{if is_set($attribute_parameters.align)}
   {set align=$attribute_parameters.align}
{else}
   {set align="center"}
{/if}

{if and( is_set( $image_variation ), $image_variation , is_set( $image_variation_zoom ), $image_variation_zoom)}
   {set pixeldif=sub(mul($image_variation_zoom.width,$image_variation_zoom.height),mul($image_variation.width,$image_variation.height))}
{/if}

{*if and(is_set($link_parameters.href)|not,gt($pixeldif,$pixeldifLimit))}
   {set $zoomable = true() }
{/if*}
{if is_set($link_parameters.href)|not}
   {set $zoomable = true() }
{/if}

<figure class="caption-image image{$align} {if $zoomable}zoomable{/if}">

      {if is_set($link_parameters.href)}
         <a href={$link_parameters.href|ezurl} target="{$link_parameters.target|wash}"{if is_set($link_parameters.class)} class="{$link_parameters.class|wash}"{/if}{if is_set($link_parameters['xhtml:id'])} id="{$link_parameters['xhtml:id']|wash}"{/if}{if is_set($link_parameters['xhtml:title'])} title="{$link_parameters['xhtml:title']|wash}"{/if}>
      {elseif $zoomable}
         <a href={$image_variation_zoom.url|ezurl}
            class="imagelightbox"
            {if $data-imagelightbox} data-imagelightbox="{$data-imagelightbox}"{/if}
            data-size="{$image_variation_zoom.width}x{$image_variation_zoom.height}"
            title="{$object.data_map.image.content.alternative_text|wash(xhtml)}">
      {/if}
      {if $loadImage}
         <img class="contentImg" src={$image_variation.full_path|ezroot}
                 alt="{$object.data_map.image.content.alternative_text|wash(xhtml)}"
                 width="{$image_variation.width}" height="{$image_variation.height}"
                 style="max-width:{$image_variation.width}px" />
      {/if}
      {if or(is_set($link_parameters.href),$zoomable)}
         </a>
      {/if}

   {if $caption}
      <figcaption class="imageCaption">
         {$caption}
      </figcaption>
   {/if}
</figure>
{/let}
{/default}
