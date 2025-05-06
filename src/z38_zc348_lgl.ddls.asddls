@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z38_ZC348_LGL
  as select from zsalesorders
  association [0..1] to Z37_ZC348_LGL as _Products on $projection.ProductA = _Products.ProductId
{
  key vbeln   as Vbeln,
  key posnr   as Posnr,

      @ObjectModel.foreignKey.association: '_Products'
      product as ProductA,

      @Consumption.valueHelpDefinition: [{ association: '_Products' }]
      product as ProductB,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'Z37_C315_GVALER',
                                                     element: 'ProductId'} } ]
      product as ProductC,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'Z37_C315_GVALER',
                                                     element: 'ProductId'},
                                           additionalBinding: [{ localElement: 'Description',
                                                                 element: 'Description' }] } ]
      product as ProductD,
      ''      as Description,
      _Products
}
