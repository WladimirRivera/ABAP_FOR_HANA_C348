@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Searchable'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity Z37_ZC348_LGL
  as select from zint_products
  association [0..*] to zint_products as _Text on $projection.ProductId = _Text.product_id
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.association: '_Text'
  key product_id  as ProductId,
      description as Description,
      _Text
} 
