*&---------------------------------------------------------------------*
*& Report z20_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z20_zc348_lgl.

data: gs_flights type sflight,
      gv_sel_opt type string.

select-options: so_airl for gs_flights-carrid,
                so_fld  for gs_flights-fldate.

start-of-selection.

  try.

      gv_sel_opt = cl_shdb_seltab=>combine_seltabs( exporting it_named_seltabs = value #( ( name = 'CARRID' dref = ref #( so_airl[] ) )
                                                                                          ( name = 'FLDATE' dref = ref #( so_fld[] ) ) )
                                                              iv_client_field  = 'MANDT' ).
    catch cx_shdb_exception into data(gx_shdb).
      write gx_shdb->get_text(  ).
      return.
  endtry.

*  write gv_sel_opt.

  select * from z45_c315_gvaler_tf( sel_opt = @gv_sel_opt )
        into table @data(gt_results).

  if sy-subrc eq 0.
    cl_demo_output=>display( gt_results ).
  endif.
