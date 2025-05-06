@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OData with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true
define view entity Z29_ZC348_LGL
  with parameters
    pCfrom : land1,
    pCto   : land1
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
      //fltime as Fltime,
      deptime   as Deptime,
      arrtime   as Arrtime,
      @Semantics.quantity.unitOfMeasure: 'Distid'
      distance  as Distance,
      distid    as Distid,
      fltype    as Fltype,
      period    as Period
}
where
      countryfr = $parameters.pCfrom
  and countryto = $parameters.pCto;
