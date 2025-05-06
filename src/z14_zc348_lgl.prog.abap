*&---------------------------------------------------------------------*
*& Report z14_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z14_zc348_lgl.

select from z24_c315_gvaler
       fields *
       into table @data(gt_flights).

if sy-subrc eq 0.
  cl_Demo_output=>display( gt_flights ).
else.
  write 'NO data'.
endif.
