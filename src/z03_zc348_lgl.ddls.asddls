@AbapCatalog.sqlViewName: 'Z03C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM - Consumption'
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
define view Z03_ZC348_LGL
  as select from Z02_ZC348_LGL
/*   
 soy un comentario
en múltiples líneas
*/

//comentario de una línea
{
      @AnalyticsDetails.query.axis: #ROWS
  key Carrid,
      @AnalyticsDetails.query.axis: #ROWS //comentario lateral
  key Connid,
      @AnalyticsDetails.query.axis: #ROWS 
      Countryfr,
      @AnalyticsDetails.query.axis: #ROWS
      Cityfrom,
      @AnalyticsDetails.query.axis: #ROWS
      Airpfrom,
      @AnalyticsDetails.query.axis: #ROWS
      Countryto,
      @AnalyticsDetails.query.axis: #ROWS
      Cityto,
      @AnalyticsDetails.query.axis: #ROWS
      Airpto,
      @AnalyticsDetails.query.axis: #COLUMNS
      Distance,
      @AnalyticsDetails.query.axis: #COLUMNS
      Distid
}
