*&---------------------------------------------------------------------*
*& Report z08_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z08_zc348_lgl.

delete from demo_expressions.
insert demo_expressions from @( value #( id    = 'L'
                                         dats1 = '20240520'
                                         dats2 = '20250520' ) ).

select single from demo_expressions
       fields id,
              dats1,
              dats2,
              dats_is_valid( dats1 ) as valid,
              dats_days_between( dats1, dats2 ) as days_between,
              dats_add_days( dats1, 30 ) as add_days,
              dats_add_days( dats1, -30 ) as minus_days,
              dats_add_months( dats1, 2 ) as add_months,
              dats_add_months( dats1, -2 ) as minus_months
        where id eq 'L'
        into @data(gs_result).

if sy-subrc eq 0.
  cl_demo_output=>display( gs_result ).
endif.
