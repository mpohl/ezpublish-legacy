{default use_url_translation=false()}

       <h3><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h3>
       <p>
          {if is_set($node.path.1)}
            {$node.path.1.name|wash()}
            {if is_set($node.path.2)} | {$node.path.2.name|wash()}{/if}
          {/if}
       </p>
{/default}
