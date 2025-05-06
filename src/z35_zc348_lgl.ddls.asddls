@AbapCatalog.sqlViewName: 'Z35C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - Analytics - CUBE'
@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
define view Z35_ZC348_LGL

  as select from sbook

  association [0..1] to I_CalendarDate  as _CalendarDate on  $projection.FlightDate = _CalendarDate.CalendarDate
  association [0..1] to Z30_ZC348_LGL as _Airlines     on  $projection.Airline = _Airlines.Airline
  association [0..1] to Z31_ZC348_LGL as _Connection   on  $projection.Airline          = _Connection.Airline
                                                         and $projection.FlightConnection = _Connection.FlightConnection
  association [0..1] to Z32_ZC348_LGL as _Customer     on  $projection.Customer = _Customer.Customer
  association [0..1] to Z34_ZC348_LGL as _TravelAgency on  $projection.TravelAgency = _TravelAgency.TravelAgency


{
  // Dimensions
  @EndUserText.label: 'Airline'
  @ObjectModel.foreignKey.association: '_Airlines'
  carrid                 as Airline,
  @EndUserText.label: 'Connection'
  @ObjectModel.foreignKey.association: '_Connection'
  connid                 as FlightConnection,
  @EndUserText.label: 'Flight Date'
  @ObjectModel.foreignKey.association: '_CalendarDate'
  fldate                 as FlightDate,
  @EndUserText.label: 'Book Number'
  bookid                 as BookNumber,
  @EndUserText.label: 'Customer'
  @ObjectModel.foreignKey.association: '_Customer'
  customid               as Customer,
  @EndUserText.label: 'Travel Agency'
  @ObjectModel.foreignKey.association: '_TravelAgency'
  agencynum              as TravelAgency,
  @EndUserText.label: 'Flight Year'
  _CalendarDate.CalendarYear,
  @EndUserText.label: 'Flight Month'
  _CalendarDate.CalendarMonth,
  @EndUserText.label: 'Customer Country'
  @ObjectModel.foreignKey.association: '_CustomerCountry'
  _Customer.Country      as CustomerCountry,
  @EndUserText.label: 'Customer City'
  _Customer.City         as CustomerCity,
  @EndUserText.label: 'Travel Agency Country'
  @ObjectModel.foreignKey.association: '_TravelAgencyCountry'
  _TravelAgency.Country  as TravelAgencyCountry,
  @EndUserText.label: 'Travel Agency Customer City'
  _TravelAgency.City     as TravelAgencyCity,

  // MEASURES
  @EndUserText.label: 'Total of Bookings'
  @DefaultAggregation: #SUM
  1                      as TotalOfBooking,


  @EndUserText.label: 'Weight of Luggage'
  @Semantics.quantity.unitOfMeasure: 'WeightUOM'
  @DefaultAggregation: #SUM
  luggweight             as WeightOfLuggage,
  @EndUserText.label: 'Weight Unit'
  @Semantics.unitOfMeasure: true
  wunit                  as WeightUOM,

  @EndUserText.label: 'Booking Price'
  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  forcuram               as BookingPrice,
  @EndUserText.label: 'Currency'
  @Semantics.currencyCode: true
  forcurkey              as Currency,

  //Associations
  _Airlines,
  _Connection,
  _CalendarDate,
  _CalendarDate._CalendarMonth,
  _CalendarDate._CalendarYear,
  _Customer,
  _Customer._Country     as _CustomerCountry,
  _TravelAgency,
  _TravelAgency._Country as _TravelAgencyCountry

}
