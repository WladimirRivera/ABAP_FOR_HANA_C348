*&---------------------------------------------------------------------*
*& Report z21_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z21_zc348_lgl.

select from zev_c315_gvaler
       fields *
       where spras eq 'E'
       into table @data(gt_countries).

if sy-subrc eq 0.
  cl_demo_output=>display( gt_countries ).
endif.
