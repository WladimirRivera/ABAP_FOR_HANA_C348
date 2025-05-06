@AbapCatalog.sqlViewName: 'Z19C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Amount Conversions'
define view Z19_ZC348_LGL
  with parameters
    pTargetCurr : abap.cuky
  as select from sflight
{
  key carrid,
  key connid,
  key fldate,
      @Semantics.amount.currencyCode: 'OriginalCurrency'
      price                                                  as OriginalPrice,
      currency                                               as OriginalCurrency,

      @Semantics.amount.currencyCode: 'ConvertedCurreny'
      currency_conversion( amount => price,
                           source_currency => currency,
                           target_currency => $parameters.pTargetCurr,
                           exchange_rate_date => fldate,
                           error_handling => 'SET_TO_NULL' ) as PriceConverted,
      $parameters.pTargetCurr                                as ConvertedCurreny
}
