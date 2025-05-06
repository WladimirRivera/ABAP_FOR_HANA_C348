*&---------------------------------------------------------------------*
*& Report z17_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z17_zc348_lgl.

types: begin of ty_countries,
         mandt   type mandt,
         spras   type spras,
         land1   type land1,
         landx50 type landx50,
       end of ty_countries.

* ADBC - ABAP DataBase Connectivity

data: go_connection type ref to cl_sql_connection,
      go_statement  type ref to cl_sql_statement,
      go_result     type ref to cl_sql_result_set,
      gx_sql_excep  type ref to cx_sql_exception,

      gv_sql        type string,
      gr_table      type ref to data,
      gt_countries  type standard table of zcountries.

parameters pa_langu type sylangu.

try.

    go_connection = cl_sql_connection=>get_connection( 'HANADB' ).

    create object go_statement
      exporting
        con_ref = go_connection.

    gv_sql = |SELECT * FROM "SYSTEM"."ZCOUNTRIES" where spras = '{ pa_langu }'|.

    go_result = go_statement->execute_query( gv_sql ).

    get reference of gt_countries into gr_table.

    go_result->set_param_table( gr_table ).

    go_result->next_package(  ).

    go_result->close(  ).

  catch cx_sql_exception into gx_sql_excep.
    write gx_sql_excep->get_text(  ).
    return.
endtry.


if not gt_countries is initial.
  cl_demo_output=>display( gt_countries ).
else.
  write 'NO data'.
endif.
