{*<header>
    <div class="container">
        <div class="navbar extra-navi">
            <div class="nav-collapse row">
                {include uri='design:page_header_languages.tpl'}

                {include uri='design:page_header_links.tpl'}
            </div>
        </div>
        <div class="row">
            {include uri='design:page_header_logo.tpl'}

            {include uri='design:page_header_searchbox.tpl'}
        </div>
    </div>
</header>*}
<header id="header">
   <div class="headerInner">
       <div class="logo">
           {*<a title="Zur Startseite" href="/"><img src={"logo-kloster-haina.png"|ezimage} alt="Logo Kloster Haina" /></a>*}
           <h1><a title="Zur Startseite" href="/"><span>KLOSTER HAINA</span><span class="hasenlogo"><img src={"logo-kloster-haina.png"|ezimage} alt="Logo Kloster Haina" /></span></a></h1>
           <p>Das versteckte Kleinod in der<br>Heimat der Brüder Grimm</p>
       </div>
      <!-- mainmenu area: START -->
      <section id="mainmenu-container">
         {*include uri='design:page_header_searchbox.tpl'*}

         <!-- Top menu area: START -->
         {if $pagedata.top_menu}
            {include uri='design:page_topmenu.tpl'}
         {/if}
         <!-- Top menu area: END -->
      </section>
      <!-- mainmenu area: END -->
   </div>
</header>