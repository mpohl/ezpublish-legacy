{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

{if $load_css_file_list}
  {ezcss_load( array( ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
                      ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) ) )}
{else}
  {*ezcss_load( array( 'bootstrap.css',
                      'responsive.css',
                      'debug.css',
                      'websitetoolbar.css' ) )*}
{/if}