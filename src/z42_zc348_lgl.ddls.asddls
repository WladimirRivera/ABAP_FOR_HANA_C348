@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtual Element'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//SADL - Service Adaptation Language
@OData.publish: true
define view entity Z42_ZC348_LGL
  as select from snwd_pd
{
  key node_key                    as NodeKey,
      product_id                  as ProductId,
      type_code                   as TypeCode,
      category                    as Category,
      created_by                  as CreatedBy,
      created_at                  as CreatedAt,
      changed_by                  as ChangedBy,
      changed_at                  as ChangedAt,
      name_guid                   as NameGuid,
      desc_guid                   as DescGuid,
      supplier_guid               as SupplierGuid,
      tax_tarif_code              as TaxTarifCode,
      measure_unit                as MeasureUnit,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      weight_measure              as WeightMeasure,
      weight_unit                 as WeightUnit,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,
      currency_code               as CurrencyCode,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @ObjectModel: {
         readOnly: true,
         virtualElement: true,
         virtualElementCalculatedBy: 'ABAP:ZCL_EXIT_SADL_ZC348_LGL'
      }
      cast(0 as snwd_unit_price ) as Discount
}  







