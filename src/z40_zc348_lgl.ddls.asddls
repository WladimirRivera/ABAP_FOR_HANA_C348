@AbapCatalog.sqlViewName: 'Z40C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF - Base Object'

@ObjectModel: {
     usageType: { serviceQuality: #X,
                   sizeCategory: #S,
                   dataClass: #TRANSACTIONAL },
     transactionalProcessingEnabled: true,
     modelCategory: #BUSINESS_OBJECT,
     compositionRoot: true,
     createEnabled: true,
     updateEnabled: true,
     deleteEnabled: true,
     writeActivePersistence: 'zscarr_log',
     semanticKey: [ 'Carrid' ]
}
define view Z40_ZC348_LGL
  as select from zscarr_log
{
      @ObjectModel.readOnly: true
  key bopfkey  as Bopfkey,
      carrid   as Carrid,
      carrname as Carrname,
      currcode as Currcode,
      url      as Url
}
