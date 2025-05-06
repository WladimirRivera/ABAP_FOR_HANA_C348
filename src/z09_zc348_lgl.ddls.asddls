@AbapCatalog.sqlViewName: 'Z09C348'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameters as elements'
define view Z09_ZC348_LGL
  with parameters
    param1 : char20,
    param2 : char20
  as select from scarr
{
  key carrid                                             as Carrid,
      //not to be used, it's recommended to use the $parameters
      :param1                                            as Param1Element,
      $parameters.param2                                 as Param2Element,
      carrname                                           as Carrname,
      concat_with_space($parameters.param1, carrname, 5) as ConcatElem,
      currcode                                           as Currcode,
      url                                                as Url
}
