{let search=false()}
{section show=$use_template_search}
   {set page_limit=20}
   {set search=fetch(content,search,
   hash(text,$search_text,
   section_id,$search_section_id,
   subtree_array,$search_subtree_array,
   sort_by,array('modified',false()),
   offset,$view_parameters.offset,
   limit,$page_limit))}
   {set search_result=$search['SearchResult']}
   {set search_count=$search['SearchCount']}
   {set stop_word_array=$search['StopWordArray']}
   {set search_data=$search}
{/section}


   <section class="pagecontainer">
      <!-- left container: START -->
      <section class="leftcontainer pageContent">

         <form action={"/content/search/"|ezurl} method="get">


            {section show=$stop_word_array}
               <p>
                  {"The following words were excluded from the search"|i18n("design/standard/content/search")}:
                  {section name=StopWord loop=$stop_word_array}
                     {$StopWord:item.word|wash}
                     {delimiter}, {/delimiter}

                  {/section}
               </p>

            {/section}

            {switch name=Sw match=$search_count}
            {case match=0}
               <div class="warning">
                  <h2>{'No results were found when searching for "%1"'|i18n("design/standard/content/search",,array($search_text|wash))}</h2>
               </div>
               <p>{'Search tips'|i18n('design/standard/content/search')}</p>
               <ul>
                  <li>{'Check spelling of keywords.'|i18n('design/standard/content/search')}</li>
                  <li>{'Try changing some keywords eg. &quot;car&quot; instead of &quot;cars&quot;.'|i18n('design/standard/content/search')}</li>
                  <li>{'Try more general keywords.'|i18n('design/standard/content/search')}</li>
                  <li>{'Fewer keywords result in more matches. Try reducing keywords until you get a result.'|i18n('design/standard/content/search')}</li>
               </ul>
            {/case}
            {case}
               <div class="feedback">
                  <h2>{'Search for "%1" returned %2 matches'|i18n("design/standard/content/search",,array($search_text|wash,$search_count))}</h2>
               </div>
            {/case}
            {/switch}

            {include name=Result
            uri='design:content/searchresult.tpl'
            search_result=$search_result}

            {include name=Navigator
            uri='design:navigator/google.tpl'
            page_uri='/content/search'
            page_uri_suffix=concat('?SearchText=',$search_text|urlencode,$search_timestamp|gt(0)|choose('',concat('&SearchTimestamp=',$search_timestamp)))
            item_count=$search_count
            view_parameters=$view_parameters
            item_limit=$page_limit}

         </form>
      </section>
      <!-- left container: END -->
      <!-- right container: START -->
      <section class="rightcontainer pageContent">
      </section>
      <!-- right container: END -->
   </section>
   <!-- page container: END -->

{/let}
