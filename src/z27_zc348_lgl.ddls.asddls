@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Metadata Extensions with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity Z27_ZC348_LGL
  with parameters
    pCityFrom : s_from_cit
  as select from spfli
{
  key carrid    as Carrid,
  key connid    as Connid,
      countryfr as Countryfr,
      cityfrom  as Cityfrom,
      airpfrom  as Airpfrom,
      countryto as Countryto,
      cityto    as Cityto,
      airpto    as Airpto,
      fltime    as Fltime,
      deptime   as Deptime,
      arrtime   as Arrtime,
      @Semantics.quantity.unitOfMeasure: 'Distid'
      distance  as Distance,
      distid    as Distid,
      fltype    as Fltype,
      period    as Period
}
where
  cityfrom = $parameters.pCityFrom;
