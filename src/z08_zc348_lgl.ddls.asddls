@AbapCatalog.sqlViewName: 'Z08C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association'
define view Z08_ZC348_LGL
  as select from spfli as FlightsSchedule
  association [0..*] to z07_c315_gvaler as _Flights on  _Flights.Carrid = FlightsSchedule.carrid
                                                    and _Flights.Connid = FlightsSchedule.connid
{
  key  FlightsSchedule.carrid    as Carrid,
  key  FlightsSchedule.connid    as Connid,
       FlightsSchedule.countryfr as Countryfr,
       FlightsSchedule.cityfrom  as Cityfrom,
       FlightsSchedule.airpfrom  as Airpfrom,
       FlightsSchedule.countryto as Countryto,
       FlightsSchedule.cityto    as Cityto,
       _Flights
}
