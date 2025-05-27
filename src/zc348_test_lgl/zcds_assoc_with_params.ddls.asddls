@AbapCatalog.sqlViewName: 'Z09C348X'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameters as elements'
define view ZCDS_assoc_with_params
  as select from sflight
  association [0..1] to Z09_ZC348_LGL as _Airline on $projection.Carrid = _Airline.Carrid
  association [0..*] to Z01_ZC348_LGL as _Flights on $projection.Carrid = _Flights.Carrid
{
  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
      price      as Price,
      currency   as Currency,
      planetype  as Planetype,
      seatsmax   as Seatsmax,
      seatsocc   as Seatsocc,
      paymentsum as Paymentsum,
      seatsmax_b as SeatsmaxB,
      seatsocc_b as SeatsoccB,
      seatsmax_f as SeatsmaxF,
      seatsocc_f as SeatsoccF,
      num_puerta as NumPuerta,
      _Airline( param1: 'Param1', param2: 'Param1' ).Carrid as AirlineCarrid,
      _Flights[Period = 1].Period as Period
}
