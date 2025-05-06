@AbapCatalog.sqlViewName: 'Z14C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Session Variable'
define view Z14_ZC348_LGL
  as select from scarr
{
  key carrid,
      $session.user            as SessionUser,
      $session.client          as ClientElem,
      $session.system_date     as SystemDate,
      $session.user_date       as UserDate,
      $session.system_language as SystemLanguage,
      $session.user_timezone   as UserTz
}
where
  carrid = 'AA';
