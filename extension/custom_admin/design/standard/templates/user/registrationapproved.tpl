{def $site_url=ezini('SiteSettings','SiteURL')}
{set-block scope=root variable=subject}Anmeldung akzeptiert!{/set-block}
{* def $subject=concat( $site_url, ' registration approved') *}
{'Thank you for registering at %siteurl.'|i18n('design/standard/user/register', , hash( '%siteurl', $site_url ))}

{'Your registration has been approved. You can login with your account %username.'|i18n( 'design/standard/user/register', , hash( '%username', $user.login ) )}

{'Click the following URL to login:'|i18n( 'design/standard/user/register' )}
http://{$site_url}/user/login