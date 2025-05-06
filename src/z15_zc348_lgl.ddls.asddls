@AbapCatalog.sqlViewName: 'Z15C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Case'
define view Z15_ZC348_LGL
  as select from spfli
{
  key carrid,
  key connid,

      case
        when distance >= 2000 then 'Vuelo largo'
        when distance >= 1000 and distance < 2000 then 'Vuelo medium'
        else 'Vuelo corto'
      end as FlightType1,

      case distance
        when 2572 then 'Vuelo 2572'
        when 1500 then 'Vuelo 1500'
        else 'Diferente'
      end as FlightType2,

      case
        when distance > 2000 then case distid
                                    when 'KM' then 'Vuelo largo KM'
                                    when 'MI' then 'Vuelo largo MI'
                                    else ''
                                   end
        when distance >= 1000 and distance < 2000 then case distid
                                                            when 'KM' then 'Vuelo medium KM'
                                                            when 'MI' then 'Vuelo medium MI'
                                                            else ''
                                                           end
       else 'Vuelo corto'
      end as FlightType3

}
