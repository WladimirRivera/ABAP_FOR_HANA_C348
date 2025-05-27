*&---------------------------------------------------------------------*
**& Report z26_zc348_lgl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z26_zc348_lgl.

class lcl_handle_salv_ida definition.

  public section.

    methods on_double_click for event double_click of if_salv_gui_table_display_opt
      importing ev_field_name
                eo_row_data.

endclass.

class lcl_handle_salv_ida implementation.

  method on_double_click.

    data ls_flight type sflight.

    check ev_field_name = 'CARRID'.

    try.

        eo_row_data->get_row_data(
          exporting
            iv_request_type = if_salv_gui_selection_ida=>cs_request_type-all_fields
          importing
            es_row          = ls_flight ).

      catch cx_salv_ida_contract_violation.
      catch cx_salv_ida_sel_row_deleted.

    endtry.

    "Display the row data
    cl_salv_ida_show_data_row=>display( iv_text = 'Flight Info'
                                        is_data = ls_flight ).

  endmethod.

endclass.

start-of-selection.

  data(go_salv) = cl_salv_gui_table_ida=>create( iv_table_name = 'SFLIGHT' ).

*  data(go_display_options) = go_salv->display_options(  ).
*
*  go_display_options->enable_double_click(  ).
*
*  data(go_event_handler) = new lcl_handle_salv_ida(  ).
**  set handler go_event_handler->on_double_click for go_display_options.
*   set handler go_event_handler->on_double_click for all instances.


  go_salv->display_options(  )->enable_double_click(  ).
  data(go_event_handler) = new lcl_handle_salv_ida(  ).
  set handler go_event_handler->on_double_click for go_salv->display_options(  ).

  go_salv->fullscreen(  )->display(  ).
