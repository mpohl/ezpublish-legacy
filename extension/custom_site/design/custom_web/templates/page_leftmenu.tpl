{*
<div class="span{$outer_column_size} side-menu">
    {if is_array( $pagedata.left_menu )}
        {foreach $pagedata.left_menu as $left_menu}
        {include uri=concat('design:menu/', $left_menu, '.tpl')}
            {delimiter}<div class="hr"></div>{/delimiter}
        {/foreach}
        {else}
    {include uri=concat('design:menu/', $pagedata.left_menu, '.tpl')}
    {/if}
</div>
*}

<ul>
    <li><a href="angeboSub.html">Aktuelles</a></li>
    <li  class="contentMenu-active"><a href="angeboSub.html">1. Männermannschaft</a></li>
    <li><a href="angeboSub.html">2. Mannschaft</a></li>
    <li><a href="angeboSub.html">3. Mannschaft</a></li>
    <li><a href="angeboSub.html">Jugend</a></li>
    <li><a href="angeboSub.html">Trainingszeiten</a></li>
    <li><a href="tabelle.html">Tabelle</a></li>
    <li><a href="angeboSub.html">Spielpläne</a></li>
    <li><a href="angeboSub.html">Berichte</a></li>
</ul>