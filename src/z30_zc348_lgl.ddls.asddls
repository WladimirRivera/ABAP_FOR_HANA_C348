@AbapCatalog.sqlViewName: 'Z30C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - Analytics - DIMENSION'
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
define view Z30_ZC348_LGL
  as select from scarr
{
      @ObjectModel.text.element: ['AirlineName']
  key carrid   as Airline,
      @Semantics.text: true
      carrname as AirlineName,
      @Semantics.currencyCode: true
      currcode as Currency
}
