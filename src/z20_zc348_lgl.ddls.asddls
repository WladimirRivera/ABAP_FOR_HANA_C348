@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Base for Hierarchy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z20_ZC348_LGL
  as select from ztree
  association [0..*] to Z20_ZC348_LGL as _Tree on $projection.ParentId = _Tree.Id
{
  key id        as Id,
  key parent_id as ParentId,
      name      as Name,
      _Tree
}
