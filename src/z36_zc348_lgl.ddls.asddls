@AbapCatalog.sqlViewName: 'Z36C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - Analytics - QUERY'
@Analytics.query: true
@VDM.viewType: #CONSUMPTION
@Analytics.dataExtraction.enabled: true
@OData.publish: true
define view Z36_ZC348_LGL
  as select from Z35_ZC348_LGL
{
      // DIMENSIONS
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
  key Airline,
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
  key FlightConnection,
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
  key FlightDate,
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
      BookNumber,
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
      Customer,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      TravelAgency,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      CalendarYear,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      CalendarMonth,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      CustomerCountry,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      CustomerCity,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      TravelAgencyCountry,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      TravelAgencyCity,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      WeightUOM,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      Currency,

      // Measures
      TotalOfBooking,
      WeightOfLuggage,
      BookingPrice,

      @EndUserText.label: 'Average Weight Per Flight'
      @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationBehavior: #AVG
      @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationElements: ['Airline', 'FlightConnection', 'FlightDate']
      @AnalyticsDetails.query.formula: '$projection.WeightOfLuggage'
      @AnalyticsDetails.query.decimals: 0
      0 as AverageWeightPerFlight

}
