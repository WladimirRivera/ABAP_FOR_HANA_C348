@AbapCatalog.sqlViewName: 'Z02C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM - Composite'
@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
define view Z02_ZC348_LGL
  as select from Z01_ZC348_LGL
{
  key Carrid,
  key Connid,
      Countryfr,
      Cityfrom,
      Airpfrom,
      Countryto,
      Cityto,
      Airpto,
      Fltime,
      Deptime,
      Arrtime,
      @DefaultAggregation: #SUM
      @Semantics.quantity.unitOfMeasure: 'Distid'
      Distance,
      @Semantics.unitOfMeasure: true
      Distid,
      Fltype,
      Period
}
