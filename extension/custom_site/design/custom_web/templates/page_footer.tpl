{*def $footer_node = fetch( 'content', 'node', hash( 'node_id', ezini( 'FooterSettings', 'NodeID', 'content.ini' ) ) )*}

<footer id="footer">
   <div class="footerContent">
      {*
      <div id="footer-widgets">
         <!-- WIDGET 1 -->
         <div class="footer-widget first-clmn">
            <h5>Unser Verein</h5>
            {let $items =  fetch_alias( 'main_menu_sub',hash('parent_node_id',68))}
            <ul>
               {foreach $items as $item}
                  <li>
                     <a href={$item.url_alias|ezurl} title="{$item.data_map.title.content|wash}">
                        <span>{$item.name}</span>
                     </a>
                  </li>
               {/foreach}
            </ul>
            {/let}
         </div>
         <!-- WIDGET 2 -->
         <div class="footer-widget second-clmn">
            <h5>Angebote</h5>
            {let $items =  fetch_alias( 'main_menu_sub',hash('parent_node_id',65,limit,6,offset,0))}
               <ul>
                  {foreach $items as $item}
                     <li>
                        <a href={$item.url_alias|ezurl} title="{$item.data_map.title.content|wash}">
                           <span>{$item.name}</span>
                        </a>
                     </li>
                  {/foreach}
               </ul>
            {/let}
         </div>
         <!-- WIDGET 3 -->
         <div class="footer-widget third-clmn">
            <h5>&nbsp;</h5>
            {let $items =  fetch_alias( 'main_menu_sub',hash('parent_node_id',65,limit,6,offset,5))}
               <ul>
                  {foreach $items as $item}
                     <li>
                        <a href={$item.url_alias|ezurl} title="{$item.data_map.title.content|wash}">
                           <span>{$item.name}</span>
                        </a>
                     </li>
                  {/foreach}
               </ul>
            {/let}
         </div>
         <!-- WIDGET 4 -->
         <div class="footer-widget fourth-clmn">
            <h5>Kontakt</h5>
            {let $items =  fetch_alias( 'main_menu_sub',hash('parent_node_id',66))}
               <ul>
                  {foreach $items as $item}
                     <li>
                        <a href={$item.url_alias|ezurl} title="{$item.data_map.title.content|wash}">
                           <span>{$item.name}</span>
                        </a>
                     </li>
                  {/foreach}
               </ul>
            {/let}
         </div>
      </div>

      <div class="clear"></div>
   *}
      <!-- COPYRIGHT -->
      <ul class="footermenu">
         <li>• <a href={'/Kontakt'|ezurl()}>Kontakt</a></li>
         <li>• <a href={'/Kontakt'|ezurl()}>Impressum</a></li>
         <li>• <a href={'/Kontakt#Literaturverzeichnis'|ezurl()}>Literaturverzeichnis</a></li>
      </ul>
      <div class="credits"><address>Kloster Haina • 35114 Haina (Kloster)</address></div>
      <!-- SOCIAL ICONS -->
      {*
      <ul class="social-icons">
         <li>
            <a href="#">
               <img class="social-icon" src={"social-icons/facebook.png"|ezimage} alt="Facebook" />
            </a>
         </li>
         <!--
         <li>
             <a href="#">
                 <img class="social-icon" src="images/social-icons/twitter.png" alt="Twitter" />
             </a>
         </li>
         <li>
             <a href="#">
                 <img class="social-icon" src="images/social-icons/flickr.png" alt="Flickr" />
             </a>
         </li>
         <li>
             <a href="#">
                 <img class="social-icon" src="images/social-icons/linkedin.png" alt="Linked in" />
             </a>
         </li>
         <li>
             <a href="#">
                 <img class="social-icon" src="images/social-icons/google+.png" alt="Google+" />
             </a>
         </li>
         <li>
             <a href="#">
                 <img class="social-icon" src="images/social-icons/vimeo.png" alt="Vimeo" />
             </a>
         </li>
         <li>
             <a href="#">
                 <img class="social-icon" src="images/social-icons/youtube.png" alt="YouTube" />
             </a>
         </li>
         -->
      </ul>
      *}
   </div>
</footer>
{*undef $footer_node*}
