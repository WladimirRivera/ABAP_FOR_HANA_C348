@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SQl Aggregation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z13_ZC348_LGL
  as select from spfli
{
  key carrid,
  key connid,
      min(fltime)                   as MinFltime,
      max(fltime)                   as MaxFltime,
      sum(fltime)                   as SumFltime,
      avg(fltime as abap.dec(16,3)) as AvgFltime,
      count( distinct fltime)       as CountFltime
}
group by
  carrid,
  connid;
