@AbapCatalog.sqlViewName: 'Z11C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base for association with Parameters'
define view Z11_ZC348_LGL
  with parameters
    pAirlineCode : s_carr_id
  as select from scarr
{
  key carrid   as Carrid,
      carrname as Carrname,
      currcode as Currcode,
      url      as Url
}
where
  carrid = $parameters.pAirlineCode;
