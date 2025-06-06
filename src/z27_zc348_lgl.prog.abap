*&---------------------------------------------------------------------*
*& Report z27_zc348_lgl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z27_zc348_lgl.

select * from sflight
  into table @data(gt_flights).

select * from spfli
   for all entries in @gt_flights
   where carrid eq @gt_flights-carrid
   into table @data(gt_results).

select * from acdoca
  into table @data(gt_documents).
