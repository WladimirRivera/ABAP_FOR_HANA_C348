@AbapCatalog.sqlViewName: 'Z04C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union'
define view Z04_ZC348_LGL
  as select from zint_products
{
  key product_id  as ProductId,
      description as Name
}

//union all select from zext_products
//distinct
union select from zext_products
{
  key id   as ProductId,
      name as Name
}
