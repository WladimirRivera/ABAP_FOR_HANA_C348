@AbapCatalog.sqlViewAppendName: 'Z10C348'
@EndUserText.label: 'Extend'
extend view Z07_ZC348_LGL with Z10_ZC348_LGL
  association [0..1] to scarr as _CarrName on _CarrName.carrid = sflight.carrid
{
  sflight.planetype,
  _CarrName.carrname,
  _CarrName.currcode,
  _CarrName
}
