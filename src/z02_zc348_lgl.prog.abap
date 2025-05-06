*&---------------------------------------------------------------------*
*& Report z02_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z02_zc348_lgl.

select from sflight
       fields carrid, connid, fldate
       into table @data(gt_flights).

data(gv_carrid) = 'AA'.

select from sflight
       fields carrid, connid, fldate
       into table @gt_flights.

read table gt_flights into data(gs_flights) index 1.

gs_flights-carrid = 'LH'.

try.

    data(gs_flights_2) = gt_flights[ 1 ].

    gs_flights_2 = gt_flights[ carrid = 'AA'
                               connid = '1017' ].

    data(gv_carrid_2) = gt_flights[ carrid = 'AA'
                                    connid = '1017' ]-carrid.

  catch cx_sy_itab_line_not_found into data(gx_itab_line_not_f).
    write gx_itab_line_not_f->get_text(  ).
endtry.

append initial line to gt_flights assigning field-symbol(<gs_flights>).
<gs_flights>-carrid = 'AF'.

select from sflight
       fields carrid, connid, fldate
       into table @data(gt_airlines).

data: gt_final type table of sflight,
      gs_final type sflight.

loop at gt_flights assigning field-symbol(<gs_old_flights>)
         where carrid eq 'LH'.

  loop at gt_airlines into data(gs_old_airlines)
        where carrid eq <gs_old_flights>-carrid.

    gs_final-carrid = <gs_old_flights>-carrid.
    gs_final-connid = gs_old_airlines-connid.
    append gs_final to gt_final.

  endloop.

endloop.

gt_final = value #( for <gs_new_flights> in gt_flights where ( carrid = 'LH' )
                     for gs_new_airlines in gt_airlines where ( carrid = <gs_new_flights>-carrid )
                     ( carrid = <gs_new_flights>-carrid
                       connid = gs_new_airlines-connid ) ).
