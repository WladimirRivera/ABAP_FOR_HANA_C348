@AbapCatalog.sqlViewName: 'Z17C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Time Zone'
define view Z17_ZC348_LGL
  as select from scarr
{
  key carrid,
      abap_system_timezone($session.client, 'NULL')              as SytemTz,
      abap_user_timezone($session.user, $session.client, 'NULL') as Usertz
} where carrid = 'AA';
