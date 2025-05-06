*&---------------------------------------------------------------------*
*& Report z19_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z19_zc348_lgl.

types: begin of ty_overview,
         param type string,
         value type string,
       end of ty_overview.

types: begin of ty_flights,
         carrid   type s_carr_id,
         connid   type s_conn_id,
         fldate   type s_date,
         price    type s_price,
         cityfrom type s_from_cit,
         cityto   type s_to_city,
       end of ty_flights.

* ADBC - ABAP DataBase Connectivity

data: gr_data     type ref to data,
      gt_flights  type standard table of ty_flights,
      gt_overview type standard table of ty_overview.

start-of-selection.

  parameters: p_c_from type land1,
              p_c_to   type land1.

  try.

      if not cl_abap_dbfeatures=>use_features(
                      exporting
                        connection         = 'HANADB'
                        requested_features = value #( ( cl_abap_dbfeatures=>call_database_procedure ) ) ).
        write 'El sistema de base de datos no soporta el procedimiento invocado'.
        return.
      endif.
    catch cx_abap_invalid_param_value into data(gx_invalid_param).
      write gx_invalid_param->get_text(  ).
      return.
  endtry.

  try.

      data(go_statement) = new cl_sql_statement( con_ref = cl_sql_connection=>get_connection( 'HANADB' ) ).

      data(gv_sql) = |call "_SYS_BIC"."ZABAP_SEC_HANA_TRAINING.gvaler::c315"('{ p_c_from }', '{ p_c_to }', null) with overview|.

      data(go_result) = go_statement->execute_query( gv_sql ).

      gr_data = ref #( gt_overview ).

      go_result->set_param_table( gr_data ).

      go_result->next_package(  ).

      gv_sql = |SELECT * FROM { gt_overview[ param = 'ET_FLIGHTS' ]-value }|.

      go_result = go_statement->execute_query( gv_sql ).

      gr_data = ref #( gt_flights ).

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
