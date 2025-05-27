*&---------------------------------------------------------------------*
*& Include z25_zc348_lgl_f01
*&---------------------------------------------------------------------*
FORM init_2000.

  IF go_cust_cont IS NOT BOUND.

    go_cust_cont = NEW #( 'ALV_CONT' ).

    go_alv_display = cl_salv_gui_table_ida=>create( iv_table_name    = 'SCUSTOM'
                                                    io_gui_container = go_cust_cont ).


  ENDIF.

ENDFORM.
