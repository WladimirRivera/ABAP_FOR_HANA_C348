*&---------------------------------------------------------------------*
*& Report z12_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z12_zc348_lgl.

select from spfli
       fields *
       into table @data(gt_flights).

select from @gt_flights as it
       inner join sflights as FlightsSchedule
               on it~carrid eq FlightsSchedule~carrid
              and it~connid eq FlightsSchedule~connid
       fields it~cityfrom,
              FlightsSchedule~cityto
       into table @data(gt_joined_flights). "###db_feature_mode[itabs_in_from_clause] ###itab_db_select

if sy-subrc eq 0.
  cl_demo_output=>display( gt_joined_flights ).
endif.
