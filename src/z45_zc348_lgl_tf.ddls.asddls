@EndUserText.label: 'Table Function - Select Options'
define table function Z45_ZC348_LGL_TF
  with parameters
    sel_opt : abap.char( 1000 )
returns
{
  mandt  : mandt;
  carrid : s_carr_id;
  connid : s_conn_id;
  fldate : s_date;
  price  : s_price;
}
implemented by method
  zcl_tf_zc348_lgl=>get_range_flights;
