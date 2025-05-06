*&---------------------------------------------------------------------*
*& Report z18_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z18_zc348_lgl.

types: begin of ty_flights,
         carrid         type s_carr_id,
         connid         type s_conn_id,
         fldate         type s_date,
         cityfrom       type s_from_cit,
         cityto         type s_to_city,
         price          type s_price,
         currency       type s_currcode,
         price_with_vat type s_price,
       end of ty_flights.

* ADBC - ABAP DataBase Connectivity

data: "go_connection type ref to cl_sql_connection,
  "go_statement  type ref to cl_sql_statement,
  "go_result    type ref to cl_sql_result_set,
  "gx_sql_excep type ref to cx_sql_exception,

  "gv_sql       type string,
  gr_data      type ref to data,
  gt_flights   type standard table of ty_flights.

parameters pa_carid type s_carr_id.

start-of-selection.

  try.

      if not cl_abap_dbfeatures=>use_features(
                      exporting
                        connection         = 'HANADB'
                        requested_features = value #( ( cl_abap_dbfeatures=>external_views ) ) ).
        write 'El sistema de base de datos no soporta el procedimiento invocado'.
        return.
      endif.
    catch cx_abap_invalid_param_value into data(gx_invalid_param).
      write gx_invalid_param->get_text(  ).
      return.
  endtry.

  try.

      data(go_statement) = new cl_sql_statement( con_ref = cl_sql_connection=>get_connection( 'HANADB' ) ).

      data(gv_sql) = |SELECT * FROM "_SYS_BIC"."ZABAP_SEC_HANA_TRAINING.gvaler/FLIGHTS_C315" where carrid = '{ pa_carid }'|.

      gr_data = ref #( gt_flights ).

      data(go_result) = go_statement->execute_query( gv_sql ).

      go_result->set_param_table( gr_data ).

      go_result->next_package(  ).

      go_result->close(  ).

    catch cx_sql_exception into data(gx_sql_excep).
      write gx_sql_excep->get_text(  ).
      return.
  endtry.


  if not gt_flights is initial.
    cl_demo_output=>display( gt_flights ).
  else.
    write 'NO data'.
  endif.
