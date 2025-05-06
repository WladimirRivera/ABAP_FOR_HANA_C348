@AbapCatalog.sqlViewName: 'Z07C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base for association'
define view Z07_ZC348_LGL
  as select from sflight
  association [0..1] to scarr as _Airline  on _Airline.carrid = sflight.carrid
{
  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
      price      as Price,
      currency   as Currency,
      //      planetype  as Planetype,
      seatsmax   as Seatsmax,
      seatsocc   as Seatsocc,
      paymentsum as Paymentsum,
      seatsmax_b as SeatsmaxB,
      seatsocc_b as SeatsoccB,
      seatsmax_f as SeatsmaxF,
      seatsocc_f as SeatsoccF,
      //num_puerta as NumPuerta
      _Airline
}
