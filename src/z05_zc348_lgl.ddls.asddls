@AbapCatalog.sqlViewName: 'Z05C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join'
define view Z05_ZC348_LGL
  with parameters
    pCurrency : s_currcode
  as select from spfli   as FlightPlan
    inner join   sflight as Flight on  FlightPlan.carrid = Flight.carrid
                                   and FlightPlan.connid = Flight.connid
{
  key Flight.carrid        as Carrid,
  key Flight.connid        as Connid,
  key Flight.fldate        as Fldate,
      FlightPlan.countryfr as Countryfr,
      FlightPlan.cityfrom  as Cityfrom,
      FlightPlan.airpfrom  as Airpfrom,
      FlightPlan.countryto as Countryto,
      FlightPlan.cityto    as Cityto,
      Flight.price         as Price,
      Flight.currency      as Currency

}
where
  Flight.currency = $parameters.pCurrency;
