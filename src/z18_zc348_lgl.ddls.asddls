@AbapCatalog.sqlViewName: 'Z18C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quantity Conversion'
@Metadata.ignorePropagatedAnnotations: true
define view Z18_ZC348_LGL
  with parameters
    pFromUnit : s_distid,
    pToUnit   : abap.unit( 3 )
  as select from spfli
{
  key carrid,
  key connid,

      //@Semantics.quantity.unitOfMeasure: 'OriginalUnit'
      distance                                                              as OriginalQty,
      distid                                                                as OriginalUnit,

      @Semantics.quantity.unitOfMeasure: 'ConvertedUnit'
      cast( unit_conversion( quantity       => distance,
                       source_unit    => distid,
                       target_unit    => $parameters.pToUnit,
                       error_handling => 'SET_TO_NULL' ) as abap.dec(10,3)) as ConvertedQty,

      $parameters.pToUnit                                                   as ConvertedUnit

}
where
  distid = $parameters.pFromUnit;
