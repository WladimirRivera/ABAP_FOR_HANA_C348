*&---------------------------------------------------------------------*
*& Report z22_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z22_zc348_lgl.

data: gv_seg_value type zif_zdpp_c315_gvaler=>iv_seg_value,
      gt_work_tab  type table of zif_zdpp_c315_gvaler=>it_work_tab,
      gt_out       type table of zif_zdpp_c315_gvaler=>et_out.

try.

    call database procedure zdpp_c315_gvaler
      exporting
        iv_seg_value = gv_seg_value
        it_work_tab  = gt_work_tab
      importing
        et_out       = gt_out.

  catch cx_sy_db_procedure_sql_error into data(gx_sy_db).
    write gx_sy_db->get_text(  ).
endtry.

if not gt_out is initial.
  cl_demo_output=>display( gt_out ).
endif.
