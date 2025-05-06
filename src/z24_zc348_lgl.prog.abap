*&---------------------------------------------------------------------*
*& Report z24_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z24_zc348_lgl.


*cl_salv_gui_table_ida=>create( 'SPFLI' )->fullscreen(  )->display(  ).

data gs_flight type sflight.

parameters p_date1 type s_date obligatory.

select-options so_carid for gs_flight-carrid.

start-of-selection.

  try.

      data(go_salv) = cl_salv_gui_table_ida=>create_for_cds_view( exporting iv_cds_view_name = 'Z49_C315_GVALER' ).

      go_salv->set_view_parameters( it_parameters = value #( ( name  = 'p_Date'
                                                               value = p_date1 ) ) ).

      data(go_collector) = new cl_salv_range_tab_collector(  ).

      go_collector->add_ranges_for_name(
        exporting
          iv_name   = 'CARRID'
          it_ranges = so_carid[] ).

      go_collector->get_collected_ranges(
        importing
          et_named_ranges = data(gt_named_ranges) ).


      data(go_condition_factory) = go_salv->condition_factory(  ).


      data(go_conditions) = go_condition_factory->equals( name = 'COUNTRYFROM'
                                                          value = 'US' )->or(
                            go_condition_factory->equals( name = 'COUNTRYFROM'
                                                          value = 'IT' ) )->or(
                            go_condition_factory->equals( name = 'COUNTRYFROM'
                                                          value = 'JP' )  ).
      go_salv->set_select_options(
        exporting
          it_ranges    = gt_named_ranges
          io_condition = go_conditions
      ).

      go_salv->field_catalog(  )->set_field_header_texts(
        exporting
          iv_field_name        = 'CARRID'
          iv_header_text       = 'Company Code'
          iv_tooltip_text      = 'Company Code'
          iv_tooltip_text_long = 'Airline Company Code'
      ).
*     catch cx_salv_ida_unknown_name.
*     catch cx_salv_call_after_1st_display.


      if not cl_salv_gui_table_ida=>db_capabilities(  )->is_max_rows_recommended(  ).
*        go_salv->set_maximum_number_of_rows( 3 ).
      endif.

      go_salv->default_layout(  )->set_aggregations(
                                     it_aggregations = value #( ( field_name = 'PRICE'
                                                                  function   = if_salv_service_types=>cs_function_code-sum ) ) ).

      go_salv->default_layout(  )->set_sort_order( it_sort_order = value #( ( field_name = 'CARRID'
                                                                              descending = abap_off
                                                                              is_grouped = abap_on ) ) ).


      go_salv->fullscreen(  )->display(  ).


    catch cx_salv_db_connection into data(gx_db_connection).
      write gx_db_connection->get_text(  ).
    catch cx_salv_db_table_not_supported.
    catch cx_salv_ida_contract_violation.
    catch cx_salv_function_not_supported.

  endtry.
