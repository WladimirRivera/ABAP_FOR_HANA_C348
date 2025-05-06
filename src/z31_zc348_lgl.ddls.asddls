@AbapCatalog.sqlViewName: 'Z31C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - Analytics - DIMENSION'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'FlightConnection'
@VDM.viewType: #BASIC
define view Z31_ZC348_LGL
  as select from spfli
  association [0..1] to Z30_ZC348_LGL as _Airline on $projection.Airline = _Airline.Airline

{
      @ObjectModel.foreignKey.association: '_Airline'
  key carrid                                  as Airline,
      @ObjectModel.text.element: ['Destination']
  key connid                                  as FlightConnection,
      concat(cityfrom, concat(' - ', cityto)) as Destination,
      _Airline

}
