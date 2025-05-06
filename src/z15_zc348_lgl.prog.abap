*&---------------------------------------------------------------------*
*& Report z15_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z15_zc348_lgl.

if sy-uname = 'GVALER'.

  select from z25_c315_gvaler with privileged access
         fields *
         into table @data(gt_flights).

else.

  select from z25_c315_gvaler
         fields *
         into table @gt_flights.

endif.

if sy-subrc eq 0.
  cl_demo_output=>display( gt_flights ).
else.
  write 'NO data'.
endif.
